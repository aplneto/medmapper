require "rails_helper"

RSpec.describe OdontologyUnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/odontology_units").to route_to("odontology_units#index")
    end

    it "routes to #new" do
      expect(:get => "/odontology_units/new").to route_to("odontology_units#new")
    end

    it "routes to #show" do
      expect(:get => "/odontology_units/1").to route_to("odontology_units#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/odontology_units/1/edit").to route_to("odontology_units#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/odontology_units").to route_to("odontology_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/odontology_units/1").to route_to("odontology_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/odontology_units/1").to route_to("odontology_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/odontology_units/1").to route_to("odontology_units#destroy", :id => "1")
    end
  end
end
