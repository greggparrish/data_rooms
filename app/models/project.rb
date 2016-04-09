# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  thumbnail   :string(255)
#  slug        :string(255)
#

class Project < ActiveRecord::Base
  include Sortable
  before_create :randomize_id
  has_many :stakeholders, dependent: :delete_all
  has_many :users, through: :stakeholders
  has_many :assets, dependent: :delete_all
  has_many :documents, through: :assets
  has_many :folders

  validate :legit_filetype
  validates :title, :presence => true

  #images
  mount_uploader :thumbnail, ProjectUploader

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [
      :title,
      [:id, :title]
    ]
  end

  private
  def should_generate_new_friendly_id?
      title_changed?
  end

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000)
    end while User.where(id: self.id).exists?
  end

  # Use file to check if filetype is acceptable (jpg,png,gif) and is what it claims to be
  def legit_filetype
    errors.add(:thumbnail, 'Invalid content type') unless Cocaine::CommandLine.new('file', '-b --mime-type :file').run(file: "#{self.thumbnail.path}").chomp.in?(['image/jpeg', 'image/png', 'image/gif'])
  end
end
