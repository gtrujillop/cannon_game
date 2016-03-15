require "rails_helper"

RSpec.describe SessionResourcesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/session_resources").to route_to("session_resources#index")
    end

    it "routes to #new" do
      expect(:get => "/session_resources/new").to route_to("session_resources#new")
    end

    it "routes to #show" do
      expect(:get => "/session_resources/1").to route_to("session_resources#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/session_resources/1/edit").to route_to("session_resources#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/session_resources").to route_to("session_resources#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/session_resources/1").to route_to("session_resources#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/session_resources/1").to route_to("session_resources#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/session_resources/1").to route_to("session_resources#destroy", :id => "1")
    end

  end
end
