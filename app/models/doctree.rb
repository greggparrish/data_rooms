# == Schema Information
#
# Table name: doctrees
#
#  id          :integer          not null, primary key
#  document_id :integer
#  folder_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Doctree < ActiveRecord::Base
  belongs_to :document
  belongs_to :folder
end
