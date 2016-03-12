# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Team < ActiveRecord::Base
  has_many :memberships, dependent: :delete_all
  has_many :users, through: :memberships
  mount_uploader :thumbnail, ProjectUploader
end
