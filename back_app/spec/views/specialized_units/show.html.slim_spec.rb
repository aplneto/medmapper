require 'rails_helper'

RSpec.describe "specialized_units/show", type: :view do
  before(:each) do
    @specialized_unit = assign(:specialized_unit, SpecializedUnit.create!(
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
