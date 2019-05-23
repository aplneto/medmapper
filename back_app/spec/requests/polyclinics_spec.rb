require 'rails_helper'

RSpec.describe "Polyclinics", type: :request do
  describe "GET /polyclinics" do
    it "works! (now write some real specs)" do
      get polyclinics_path
      expect(response).to have_http_status(200)
    end
  end
end
