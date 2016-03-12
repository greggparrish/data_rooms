# == Schema Information
#
# Table name: permissions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  document_id :integer
#  expires     :datetime
#  abilities   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :document
end
