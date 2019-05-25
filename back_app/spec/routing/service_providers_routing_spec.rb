require "rails_helper"

RSpec.describe ServiceProvidersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/service_providers").to route_to("service_providers#index")
    end

    it "routes to #new" do
      expect(:get => "/service_providers/new").to route_to("service_providers#new")
    end

    it "routes to #show" do
      expect(:get => "/service_providers/1").to route_to("service_providers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/service_providers/1/edit").to route_to("service_providers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/service_providers").to route_to("service_providers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/service_providers/1").to route_to("service_providers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/service_providers/1").to route_to("service_providers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/service_providers/1").to route_to("service_providers#destroy", :id => "1")
    end
  end
end
