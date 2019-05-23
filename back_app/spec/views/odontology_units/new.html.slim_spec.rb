require 'rails_helper'

RSpec.describe "odontology_units/new", type: :view do
  before(:each) do
    assign(:odontology_unit, OdontologyUnit.new())
  end

  it "renders new odontology_unit form" do
    render

    assert_select "form[action=?][method=?]", odontology_units_path, "post" do
    end
  end
end
