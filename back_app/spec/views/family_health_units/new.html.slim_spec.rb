require 'rails_helper'

RSpec.describe "family_health_units/new", type: :view do
  before(:each) do
    assign(:family_health_unit, FamilyHealthUnit.new())
  end

  it "renders new family_health_unit form" do
    render

    assert_select "form[action=?][method=?]", family_health_units_path, "post" do
    end
  end
end
