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

require 'rails_helper'

RSpec.describe "Permissions", type: :request do
  describe "GET /permissions" do
    it "works! (now write some real specs)" do
      get permissions_path
      expect(response).to have_http_status(200)
    end
  end
end
