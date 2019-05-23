require 'rails_helper'

RSpec.describe "emergency_units/edit", type: :view do
  before(:each) do
    @emergency_unit = assign(:emergency_unit, EmergencyUnit.create!())
  end

  it "renders the edit emergency_unit form" do
    render

    assert_select "form[action=?][method=?]", emergency_unit_path(@emergency_unit), "post" do
    end
  end
end
