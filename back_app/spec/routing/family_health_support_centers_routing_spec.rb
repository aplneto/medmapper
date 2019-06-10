require "rails_helper"

RSpec.describe FamilyHealthSupportCentersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/family_health_support_centers").to route_to("family_health_support_centers#index")
    end

    it "routes to #new" do
      expect(:get => "/family_health_support_centers/new").to route_to("family_health_support_centers#new")
    end

    it "routes to #show" do
      expect(:get => "/family_health_support_centers/1").to route_to("family_health_support_centers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/family_health_support_centers/1/edit").to route_to("family_health_support_centers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/family_health_support_centers").to route_to("family_health_support_centers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/family_health_support_centers/1").to route_to("family_health_support_centers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/family_health_support_centers/1").to route_to("family_health_support_centers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/family_health_support_centers/1").to route_to("family_health_support_centers#destroy", :id => "1")
    end
  end
end