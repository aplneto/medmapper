require 'rails_helper'

RSpec.describe "family_health_support_centers/new", type: :view do
  before(:each) do
    assign(:family_health_support_center, FamilyHealthSupportCenter.new(
      :team => "MyString",
      :support_point => "MyString",
      :name => "MyString",
      :area => "MyString",
      :phone => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :district => 1
    ))
  end

  it "renders new family_health_support_center form" do
    render

    assert_select "form[action=?][method=?]", family_health_support_centers_path, "post" do

      assert_select "input[name=?]", "family_health_support_center[team]"

      assert_select "input[name=?]", "family_health_support_center[support_point]"

      assert_select "input[name=?]", "family_health_support_center[name]"

      assert_select "input[name=?]", "family_health_support_center[area]"

      assert_select "input[name=?]", "family_health_support_center[phone]"

      assert_select "input[name=?]", "family_health_support_center[latitude]"

      assert_select "input[name=?]", "family_health_support_center[longitude]"

      assert_select "input[name=?]", "family_health_support_center[district]"
    end
  end
end
