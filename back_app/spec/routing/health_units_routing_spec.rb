require "rails_helper"

RSpec.describe HealthUnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/health_units").to route_to("health_units#index")
    end

    it "routes to #new" do
      expect(:get => "/health_units/new").to route_to("health_units#new")
    end

    it "routes to #show" do
      expect(:get => "/health_units/1").to route_to("health_units#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/health_units/1/edit").to route_to("health_units#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/health_units").to route_to("health_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/health_units/1").to route_to("health_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/health_units/1").to route_to("health_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/health_units/1").to route_to("health_units#destroy", :id => "1")
    end
  end
end
