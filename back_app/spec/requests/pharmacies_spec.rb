require 'rails_helper'

RSpec.describe "Pharmacies", type: :request do
  describe "GET /pharmacies" do
    it "works! (now write some real specs)" do
      get pharmacies_path
      expect(response).to have_http_status(200)
    end
  end
end
