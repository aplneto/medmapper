require 'rails_helper'

RSpec.describe "specialized_units/edit", type: :view do
  before(:each) do
    @specialized_unit = assign(:specialized_unit, SpecializedUnit.create!(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders the edit specialized_unit form" do
    render

    assert_select "form[action=?][method=?]", specialized_unit_path(@specialized_unit), "post" do

      assert_select "input[name=?]", "specialized_unit[health_unit_id]"

      assert_select "input[name=?]", "specialized_unit[type]"
    end
  end
end
