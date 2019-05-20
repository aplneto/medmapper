require "rails_helper"

RSpec.describe PharmaciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/pharmacies").to route_to("pharmacies#index")
    end

    it "routes to #show" do
      expect(:get => "/pharmacies/1").to route_to("pharmacies#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/pharmacies").to route_to("pharmacies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pharmacies/1").to route_to("pharmacies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pharmacies/1").to route_to("pharmacies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pharmacies/1").to route_to("pharmacies#destroy", :id => "1")
    end
  end
end
