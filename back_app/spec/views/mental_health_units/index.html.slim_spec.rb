require 'rails_helper'

RSpec.describe "mental_health_units/index", type: :view do
  before(:each) do
    assign(:mental_health_units, [
      MentalHealthUnit.create!(),
      MentalHealthUnit.create!()
    ])
  end

  it "renders a list of mental_health_units" do
    render
  end
end
