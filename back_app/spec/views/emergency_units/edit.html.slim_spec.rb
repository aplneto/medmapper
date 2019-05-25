require 'rails_helper'

RSpec.describe "emergency_units/edit", type: :view do
  before(:each) do
    @emergency_unit = assign(:emergency_unit, EmergencyUnit.create!(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders the edit emergency_unit form" do
    render

    assert_select "form[action=?][method=?]", emergency_unit_path(@emergency_unit), "post" do

      assert_select "input[name=?]", "emergency_unit[health_unit_id]"

      assert_select "input[name=?]", "emergency_unit[type]"
    end
  end
end
