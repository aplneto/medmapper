require 'rails_helper'

RSpec.describe "odontology_units/edit", type: :view do
  before(:each) do
    @odontology_unit = assign(:odontology_unit, OdontologyUnit.create!(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders the edit odontology_unit form" do
    render

    assert_select "form[action=?][method=?]", odontology_unit_path(@odontology_unit), "post" do

      assert_select "input[name=?]", "odontology_unit[health_unit_id]"

      assert_select "input[name=?]", "odontology_unit[type]"
    end
  end
end
