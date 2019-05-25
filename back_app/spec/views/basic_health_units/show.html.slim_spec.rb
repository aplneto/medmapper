require 'rails_helper'

RSpec.describe "basic_health_units/show", type: :view do
  before(:each) do
    @basic_health_unit = assign(:basic_health_unit, BasicHealthUnit.create!(
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
