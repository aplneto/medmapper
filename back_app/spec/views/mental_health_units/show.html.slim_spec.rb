require 'rails_helper'

RSpec.describe "mental_health_units/show", type: :view do
  before(:each) do
    @mental_health_unit = assign(:mental_health_unit, MentalHealthUnit.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
