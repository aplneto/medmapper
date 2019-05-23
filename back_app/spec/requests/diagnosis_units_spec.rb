require 'rails_helper'

RSpec.describe "DiagnosisUnits", type: :request do
  describe "GET /diagnosis_units" do
    it "works! (now write some real specs)" do
      get diagnosis_units_path
      expect(response).to have_http_status(200)
    end
  end
end
