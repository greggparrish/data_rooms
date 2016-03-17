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

require "rails_helper"

RSpec.describe DoctreesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/doctrees").to route_to("doctrees#index")
    end

    it "routes to #new" do
      expect(:get => "/doctrees/new").to route_to("doctrees#new")
    end

    it "routes to #show" do
      expect(:get => "/doctrees/1").to route_to("doctrees#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/doctrees/1/edit").to route_to("doctrees#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/doctrees").to route_to("doctrees#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/doctrees/1").to route_to("doctrees#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/doctrees/1").to route_to("doctrees#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/doctrees/1").to route_to("doctrees#destroy", :id => "1")
    end

  end
end
