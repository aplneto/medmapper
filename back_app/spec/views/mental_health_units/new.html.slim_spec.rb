require 'rails_helper'

RSpec.describe "mental_health_units/new", type: :view do
  before(:each) do
    assign(:mental_health_unit, MentalHealthUnit.new(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders new mental_health_unit form" do
    render

    assert_select "form[action=?][method=?]", mental_health_units_path, "post" do

      assert_select "input[name=?]", "mental_health_unit[health_unit_id]"

      assert_select "input[name=?]", "mental_health_unit[type]"
    end
  end
end
