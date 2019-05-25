require 'rails_helper'

RSpec.describe "family_health_units/show", type: :view do
  before(:each) do
    @family_health_unit = assign(:family_health_unit, FamilyHealthUnit.create!(
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
