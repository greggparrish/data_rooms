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

require 'rails_helper'

RSpec.describe "Doctrees", type: :request do
  describe "GET /doctrees" do
    it "works! (now write some real specs)" do
      get doctrees_path
      expect(response).to have_http_status(200)
    end
  end
end
