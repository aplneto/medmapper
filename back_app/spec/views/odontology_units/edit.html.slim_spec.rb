require 'rails_helper'

RSpec.describe "odontology_units/edit", type: :view do
  before(:each) do
    @odontology_unit = assign(:odontology_unit, OdontologyUnit.create!())
  end

  it "renders the edit odontology_unit form" do
    render

    assert_select "form[action=?][method=?]", odontology_unit_path(@odontology_unit), "post" do
    end
  end
end
