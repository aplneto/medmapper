require 'rails_helper'

RSpec.describe "basic_health_units/new", type: :view do
  before(:each) do
    assign(:basic_health_unit, BasicHealthUnit.new(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders new basic_health_unit form" do
    render

    assert_select "form[action=?][method=?]", basic_health_units_path, "post" do

      assert_select "input[name=?]", "basic_health_unit[health_unit_id]"

      assert_select "input[name=?]", "basic_health_unit[type]"
    end
  end
end
