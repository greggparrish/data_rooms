# == Schema Information
#
# Table name: assets
#
#  id          :integer          not null, primary key
#  document_id :integer
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Asset < ActiveRecord::Base
  belongs_to :document
  belongs_to :project
end
