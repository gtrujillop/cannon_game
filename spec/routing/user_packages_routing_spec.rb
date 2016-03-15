require "rails_helper"

RSpec.describe UserPackagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_packages").to route_to("user_packages#index")
    end

    it "routes to #new" do
      expect(:get => "/user_packages/new").to route_to("user_packages#new")
    end

    it "routes to #show" do
      expect(:get => "/user_packages/1").to route_to("user_packages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_packages/1/edit").to route_to("user_packages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_packages").to route_to("user_packages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_packages/1").to route_to("user_packages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_packages/1").to route_to("user_packages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_packages/1").to route_to("user_packages#destroy", :id => "1")
    end

  end
end
