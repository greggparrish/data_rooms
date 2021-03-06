# == Schema Information
#
# Table name: folders
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class Folder < ActiveRecord::Base
  belongs_to :project
  has_many :documents, through: :doctrees
  has_many :doctrees, dependent: :delete_all
  validates :title, presence: true
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [
      [:project_id, :title],
      [:project_id, :id, :title]
    ]
  end
end
