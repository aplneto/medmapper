require 'rails_helper'

RSpec.describe "health_units/edit", type: :view do
  before(:each) do
    @health_unit = assign(:health_unit, HealthUnit.create!(
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

  it "renders the edit health_unit form" do
    render

    assert_select "form[action=?][method=?]", health_unit_path(@health_unit), "post" do

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
