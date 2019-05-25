require 'rails_helper'

RSpec.describe "basic_health_units/edit", type: :view do
  before(:each) do
    @basic_health_unit = assign(:basic_health_unit, BasicHealthUnit.create!(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders the edit basic_health_unit form" do
    render

    assert_select "form[action=?][method=?]", basic_health_unit_path(@basic_health_unit), "post" do

      assert_select "input[name=?]", "basic_health_unit[health_unit_id]"

      assert_select "input[name=?]", "basic_health_unit[type]"
    end
  end
end
