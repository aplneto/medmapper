require "rails_helper"

RSpec.describe PolyclinicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/polyclinics").to route_to("polyclinics#index")
    end

    it "routes to #new" do
      expect(:get => "/polyclinics/new").to route_to("polyclinics#new")
    end

    it "routes to #show" do
      expect(:get => "/polyclinics/1").to route_to("polyclinics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/polyclinics/1/edit").to route_to("polyclinics#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/polyclinics").to route_to("polyclinics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/polyclinics/1").to route_to("polyclinics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/polyclinics/1").to route_to("polyclinics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/polyclinics/1").to route_to("polyclinics#destroy", :id => "1")
    end
  end
end
