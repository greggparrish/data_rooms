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
require "rails_helper"

RSpec.describe DocumentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/documents").to route_to("documents#index")
    end

    it "routes to #new" do
      expect(:get => "/documents/new").to route_to("documents#new")
    end

    it "routes to #show" do
      expect(:get => "/documents/1").to route_to("documents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/documents/1/edit").to route_to("documents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/documents").to route_to("documents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/documents/1").to route_to("documents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/documents/1").to route_to("documents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/documents/1").to route_to("documents#destroy", :id => "1")
    end

  end
end
