require 'rails_helper'

RSpec.describe "pharmacies/show", type: :view do
  before(:each) do
    @pharmacy = assign(:pharmacy, Pharmacy.create!(
      :health_unit => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
