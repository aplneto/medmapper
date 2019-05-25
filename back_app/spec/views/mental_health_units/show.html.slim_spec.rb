require 'rails_helper'

RSpec.describe "mental_health_units/show", type: :view do
  before(:each) do
    @mental_health_unit = assign(:mental_health_unit, MentalHealthUnit.create!(
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
