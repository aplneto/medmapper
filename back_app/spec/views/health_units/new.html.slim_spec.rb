require 'rails_helper'

RSpec.describe "health_units/new", type: :view do
  before(:each) do
    assign(:health_unit, HealthUnit.new(
      :cnes => 1,
      :name => "MyString",
      :address => "MyString",
      :neighborhood => "MyString",
      :phone => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :description => "MyText"
    ))
  end

  it "renders new health_unit form" do
    render

    assert_select "form[action=?][method=?]", health_units_path, "post" do

      assert_select "input[name=?]", "health_unit[cnes]"

      assert_select "input[name=?]", "health_unit[name]"

      assert_select "input[name=?]", "health_unit[address]"

      assert_select "input[name=?]", "health_unit[neighborhood]"

      assert_select "input[name=?]", "health_unit[phone]"

      assert_select "input[name=?]", "health_unit[latitude]"

      assert_select "input[name=?]", "health_unit[longitude]"

      assert_select "textarea[name=?]", "health_unit[description]"
    end
  end
end
