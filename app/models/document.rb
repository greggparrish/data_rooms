# == Schema Information
#
# Table name: documents
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  doc_file          :string(255)
#  file_content_type :string(255)
#  file_size         :integer
#  file_updated_at   :datetime
#  description       :text(65535)
#  user_id           :integer
#  title             :string(255)
#  original_filename :string(255)
#

class Document < ActiveRecord::Base
  before_create :randomize_id
  has_many :permissions, dependent: :delete_all
  has_many :users, through: :permissions
  has_many :assets, dependent: :delete_all
  has_many :projects, through: :assets
  has_many :doctrees, dependent: :delete_all
  has_many :folders, through: :doctrees
  belongs_to :user

  validates :doc_file, :title, presence: true
  validate :legit_filetype
  mount_uploader :doc_file, DocumentUploader
  before_save :save_doc_metadata

  private
  # Check if filetype is acceptable (pdf,doc) and not funny business
  def legit_filetype
    Cocaine::CommandLine.new('file', '-b --mime-type :file').run(file: self.doc_file).chomp.in?(['application/pdf', 'application/doc']) ? self.file_content_type = doc_file.file.content_type : errors.add(:document, 'Invalid content type')
  end

  def save_doc_metadata
    if doc_file.present? && doc_file_changed?
      self.file_size = doc_file.file.size
    end
  end

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000)
    end while Document.where(id: self.id).exists?
  end
end
