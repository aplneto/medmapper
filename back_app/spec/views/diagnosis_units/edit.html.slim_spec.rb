require 'rails_helper'

RSpec.describe "diagnosis_units/edit", type: :view do
  before(:each) do
    @diagnosis_unit = assign(:diagnosis_unit, DiagnosisUnit.create!(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders the edit diagnosis_unit form" do
    render

    assert_select "form[action=?][method=?]", diagnosis_unit_path(@diagnosis_unit), "post" do

      assert_select "input[name=?]", "diagnosis_unit[health_unit_id]"

      assert_select "input[name=?]", "diagnosis_unit[type]"
    end
  end
end
