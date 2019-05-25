require 'rails_helper'

RSpec.describe "diagnosis_units/new", type: :view do
  before(:each) do
    assign(:diagnosis_unit, DiagnosisUnit.new(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders new diagnosis_unit form" do
    render

    assert_select "form[action=?][method=?]", diagnosis_units_path, "post" do

      assert_select "input[name=?]", "diagnosis_unit[health_unit_id]"

      assert_select "input[name=?]", "diagnosis_unit[type]"
    end
  end
end
