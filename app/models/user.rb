# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#  title                  :string(255)
#  company                :string(255)
#  avatar                 :string(255)
#  avatar_updated_at      :datetime
#  name                   :string(255)
#  slug                   :string(255)
#

class User < ActiveRecord::Base
  before_create :randomize_id
  has_many :teams, through: :memberships
  has_many :memberships, dependent: :delete_all
  has_many :projects, through: :stakeholders
  has_many :stakeholders, dependent: :delete_all
  has_many :assets, dependent: :delete_all
  has_many :documents, through: :assets
  has_many :doc_permissions, dependent: :delete_all
  has_many :documents, through: :doc_permissions

  validates :username, presence: true, length: { minimum: 4, maximum: 16 } 
  validates_uniqueness_of :username
  validate :legit_filetype
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login

  extend FriendlyId
  friendly_id :username, use: :slugged

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  private
  # Use file to check if filetype is acceptable (jpg,png,gif) and is what it claims to be
  def legit_filetype
    errors.add(:avatar, 'Invalid content type') unless Cocaine::CommandLine.new('file', '-b --mime-type :file').run(file: "#{self.avatar.path}").chomp.in?(['image/jpeg', 'image/png', 'image/gif'])
  end

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000)
    end while User.where(id: self.id).exists?
  end

end
