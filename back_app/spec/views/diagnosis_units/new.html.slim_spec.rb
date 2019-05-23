require 'rails_helper'

RSpec.describe "diagnosis_units/new", type: :view do
  before(:each) do
    assign(:diagnosis_unit, DiagnosisUnit.new())
  end

  it "renders new diagnosis_unit form" do
    render

    assert_select "form[action=?][method=?]", diagnosis_units_path, "post" do
    end
  end
end
