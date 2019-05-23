require 'rails_helper'

RSpec.describe "family_health_units/show", type: :view do
  before(:each) do
    @family_health_unit = assign(:family_health_unit, FamilyHealthUnit.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
