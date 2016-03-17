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
end
