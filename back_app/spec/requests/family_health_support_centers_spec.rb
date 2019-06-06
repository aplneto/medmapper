require 'rails_helper'

RSpec.describe "FamilyHealthSupportCenters", type: :request do
  describe "GET /family_health_support_centers" do
    it "works! (now write some real specs)" do
      get family_health_support_centers_path
      expect(response).to have_http_status(200)
    end
  end
end
