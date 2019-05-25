require 'rails_helper'

RSpec.describe "mental_health_units/edit", type: :view do
  before(:each) do
    @mental_health_unit = assign(:mental_health_unit, MentalHealthUnit.create!(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders the edit mental_health_unit form" do
    render

    assert_select "form[action=?][method=?]", mental_health_unit_path(@mental_health_unit), "post" do

      assert_select "input[name=?]", "mental_health_unit[health_unit_id]"

      assert_select "input[name=?]", "mental_health_unit[type]"
    end
  end
end
