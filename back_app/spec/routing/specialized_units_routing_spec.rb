require "rails_helper"

RSpec.describe SpecializedUnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/specialized_units").to route_to("specialized_units#index")
    end

    it "routes to #show" do
      expect(:get => "/specialized_units/1").to route_to("specialized_units#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/specialized_units").to route_to("specialized_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/specialized_units/1").to route_to("specialized_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/specialized_units/1").to route_to("specialized_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/specialized_units/1").to route_to("specialized_units#destroy", :id => "1")
    end
  end
end
