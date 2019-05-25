require 'rails_helper'

RSpec.describe "family_health_units/new", type: :view do
  before(:each) do
    assign(:family_health_unit, FamilyHealthUnit.new(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders new family_health_unit form" do
    render

    assert_select "form[action=?][method=?]", family_health_units_path, "post" do

      assert_select "input[name=?]", "family_health_unit[health_unit_id]"

      assert_select "input[name=?]", "family_health_unit[type]"
    end
  end
end
