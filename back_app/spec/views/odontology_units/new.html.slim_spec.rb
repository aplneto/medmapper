require 'rails_helper'

RSpec.describe "odontology_units/new", type: :view do
  before(:each) do
    assign(:odontology_unit, OdontologyUnit.new(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders new odontology_unit form" do
    render

    assert_select "form[action=?][method=?]", odontology_units_path, "post" do

      assert_select "input[name=?]", "odontology_unit[health_unit_id]"

      assert_select "input[name=?]", "odontology_unit[type]"
    end
  end
end
