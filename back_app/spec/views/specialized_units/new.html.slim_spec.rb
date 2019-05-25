require 'rails_helper'

RSpec.describe "specialized_units/new", type: :view do
  before(:each) do
    assign(:specialized_unit, SpecializedUnit.new(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders new specialized_unit form" do
    render

    assert_select "form[action=?][method=?]", specialized_units_path, "post" do

      assert_select "input[name=?]", "specialized_unit[health_unit_id]"

      assert_select "input[name=?]", "specialized_unit[type]"
    end
  end
end
