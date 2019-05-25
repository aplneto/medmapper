require 'rails_helper'

RSpec.describe "emergency_units/new", type: :view do
  before(:each) do
    assign(:emergency_unit, EmergencyUnit.new(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders new emergency_unit form" do
    render

    assert_select "form[action=?][method=?]", emergency_units_path, "post" do

      assert_select "input[name=?]", "emergency_unit[health_unit_id]"

      assert_select "input[name=?]", "emergency_unit[type]"
    end
  end
end
