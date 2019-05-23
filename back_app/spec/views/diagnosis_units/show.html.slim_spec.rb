require 'rails_helper'

RSpec.describe "diagnosis_units/show", type: :view do
  before(:each) do
    @diagnosis_unit = assign(:diagnosis_unit, DiagnosisUnit.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
