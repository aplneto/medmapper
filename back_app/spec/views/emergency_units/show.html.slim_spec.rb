require 'rails_helper'

RSpec.describe "emergency_units/show", type: :view do
  before(:each) do
    @emergency_unit = assign(:emergency_unit, EmergencyUnit.create!(
      :health_unit => nil,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
  end
end
