require 'rails_helper'

RSpec.describe "mental_health_units/new", type: :view do
  before(:each) do
    assign(:mental_health_unit, MentalHealthUnit.new())
  end

  it "renders new mental_health_unit form" do
    render

    assert_select "form[action=?][method=?]", mental_health_units_path, "post" do
    end
  end
end
