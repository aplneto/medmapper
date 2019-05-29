require "rails_helper"

RSpec.describe ProfessionalProfilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/professional_profiles").to route_to("professional_profiles#index")
    end

    it "routes to #new" do
      expect(:get => "/professional_profiles/new").to route_to("professional_profiles#new")
    end

    it "routes to #show" do
      expect(:get => "/professional_profiles/1").to route_to("professional_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/professional_profiles/1/edit").to route_to("professional_profiles#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/professional_profiles").to route_to("professional_profiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/professional_profiles/1").to route_to("professional_profiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/professional_profiles/1").to route_to("professional_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/professional_profiles/1").to route_to("professional_profiles#destroy", :id => "1")
    end
  end
end
