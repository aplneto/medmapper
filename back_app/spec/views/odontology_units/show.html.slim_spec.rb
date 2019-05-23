require 'rails_helper'

RSpec.describe "odontology_units/show", type: :view do
  before(:each) do
    @odontology_unit = assign(:odontology_unit, OdontologyUnit.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
