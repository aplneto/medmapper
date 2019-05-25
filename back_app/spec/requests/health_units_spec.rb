require 'rails_helper'

RSpec.describe "HealthUnits", type: :request do
  describe "GET /health_units" do
    it "works! (now write some real specs)" do
      get health_units_path
      expect(response).to have_http_status(200)
    end
  end
end
