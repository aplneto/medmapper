require 'rails_helper'

RSpec.describe "emergency_units/index", type: :view do
  before(:each) do
    assign(:emergency_units, [
      EmergencyUnit.create!(),
      EmergencyUnit.create!()
    ])
  end

  it "renders a list of emergency_units" do
    render
  end
end
