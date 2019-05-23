require 'rails_helper'

RSpec.describe "emergency_units/new", type: :view do
  before(:each) do
    assign(:emergency_unit, EmergencyUnit.new())
  end

  it "renders new emergency_unit form" do
    render

    assert_select "form[action=?][method=?]", emergency_units_path, "post" do
    end
  end
end
