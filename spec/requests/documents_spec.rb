<<<<<<< HEAD
# == Schema Information
#
# Table name: documents
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  doc_file          :string(255)
#  file_content_type :string(255)
#  file_size         :integer
#  file_updated_at   :datetime
#  description       :text(65535)
#  user_id           :integer
#  title             :string(255)
#  original_filename :string(255)
#

=======
>>>>>>> 490d2b80685964c5b6351d7ee5fb136e754846e7
require 'rails_helper'

RSpec.describe "Documents", type: :request do
  describe "GET /documents" do
    it "works! (now write some real specs)" do
      get documents_path
      expect(response).to have_http_status(200)
    end
  end
end
