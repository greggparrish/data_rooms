class Folder < ActiveRecord::Base
  belongs_to :project
  has_many :documents, through: :doctrees
  has_many :doctrees, dependent: :delete_all
end
