require "rails_helper"

RSpec.describe MentalHealthUnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/mental_health_units").to route_to("mental_health_units#index")
    end

    it "routes to #new" do
      expect(:get => "/mental_health_units/new").to route_to("mental_health_units#new")
    end

    it "routes to #show" do
      expect(:get => "/mental_health_units/1").to route_to("mental_health_units#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mental_health_units/1/edit").to route_to("mental_health_units#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/mental_health_units").to route_to("mental_health_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mental_health_units/1").to route_to("mental_health_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mental_health_units/1").to route_to("mental_health_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mental_health_units/1").to route_to("mental_health_units#destroy", :id => "1")
    end
  end
end
