require 'rails_helper'

RSpec.describe "diagnosis_units/edit", type: :view do
  before(:each) do
    @diagnosis_unit = assign(:diagnosis_unit, DiagnosisUnit.create!())
  end

  it "renders the edit diagnosis_unit form" do
    render

    assert_select "form[action=?][method=?]", diagnosis_unit_path(@diagnosis_unit), "post" do
    end
  end
end
