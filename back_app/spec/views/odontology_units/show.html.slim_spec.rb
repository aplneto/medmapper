require 'rails_helper'

RSpec.describe "odontology_units/show", type: :view do
  before(:each) do
    @odontology_unit = assign(:odontology_unit, OdontologyUnit.create!(
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
