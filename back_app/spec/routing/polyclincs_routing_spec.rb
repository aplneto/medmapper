require "rails_helper"

RSpec.describe PolyclincsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/polyclincs").to route_to("polyclincs#index")
    end

    it "routes to #new" do
      expect(:get => "/polyclincs/new").to route_to("polyclincs#new")
    end

    it "routes to #show" do
      expect(:get => "/polyclincs/1").to route_to("polyclincs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/polyclincs/1/edit").to route_to("polyclincs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/polyclincs").to route_to("polyclincs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/polyclincs/1").to route_to("polyclincs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/polyclincs/1").to route_to("polyclincs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/polyclincs/1").to route_to("polyclincs#destroy", :id => "1")
    end
  end
end
