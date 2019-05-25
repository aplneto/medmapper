require 'rails_helper'

RSpec.describe "family_health_units/edit", type: :view do
  before(:each) do
    @family_health_unit = assign(:family_health_unit, FamilyHealthUnit.create!(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders the edit family_health_unit form" do
    render

    assert_select "form[action=?][method=?]", family_health_unit_path(@family_health_unit), "post" do

      assert_select "input[name=?]", "family_health_unit[health_unit_id]"

      assert_select "input[name=?]", "family_health_unit[type]"
    end
  end
end
