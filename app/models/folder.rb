class Folder < ActiveRecord::Base
  has_many :doctrees, dependent: :delete_all
  has_many :documents, through: :doctrees
end
