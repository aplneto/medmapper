require "rails_helper"

RSpec.describe ProfessionalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/professionals").to route_to("professionals#index")
    end

    it "routes to #new" do
      expect(:get => "/professionals/new").to route_to("professionals#new")
    end

    it "routes to #show" do
      expect(:get => "/professionals/1").to route_to("professionals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/professionals/1/edit").to route_to("professionals#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/professionals").to route_to("professionals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/professionals/1").to route_to("professionals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/professionals/1").to route_to("professionals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/professionals/1").to route_to("professionals#destroy", :id => "1")
    end
  end
end
