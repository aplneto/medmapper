require 'rails_helper'

RSpec.describe "MaternityClinics", type: :request do
  describe "GET /maternity_clinics" do
    it "works! (now write some real specs)" do
      get maternity_clinics_path
      expect(response).to have_http_status(200)
    end
  end
end
