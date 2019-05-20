require "rails_helper"

RSpec.describe BasicHealthUnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/basic_health_units").to route_to("basic_health_units#index")
    end

    it "routes to #show" do
      expect(:get => "/basic_health_units/1").to route_to("basic_health_units#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/basic_health_units").to route_to("basic_health_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/basic_health_units/1").to route_to("basic_health_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/basic_health_units/1").to route_to("basic_health_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/basic_health_units/1").to route_to("basic_health_units#destroy", :id => "1")
    end
  end
end
