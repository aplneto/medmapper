require 'rails_helper'

RSpec.describe "EmergencyUnits", type: :request do
  describe "GET /emergency_units" do
    it "works! (now write some real specs)" do
      get emergency_units_path
      expect(response).to have_http_status(200)
    end
  end
end
