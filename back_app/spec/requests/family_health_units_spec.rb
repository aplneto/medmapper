require 'rails_helper'

RSpec.describe "FamilyHealthUnits", type: :request do
  describe "GET /family_health_units" do
    it "works! (now write some real specs)" do
      get family_health_units_path
      expect(response).to have_http_status(200)
    end
  end
end
