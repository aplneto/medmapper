require 'rails_helper'

RSpec.describe "Polyclincs", type: :request do
  describe "GET /polyclincs" do
    it "works! (now write some real specs)" do
      get polyclincs_path
      expect(response).to have_http_status(200)
    end
  end
end
