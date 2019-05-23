require 'rails_helper'

RSpec.describe "emergency_units/show", type: :view do
  before(:each) do
    @emergency_unit = assign(:emergency_unit, EmergencyUnit.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
