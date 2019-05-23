require 'rails_helper'

RSpec.describe "diagnosis_units/index", type: :view do
  before(:each) do
    assign(:diagnosis_units, [
      DiagnosisUnit.create!(),
      DiagnosisUnit.create!()
    ])
  end

  it "renders a list of diagnosis_units" do
    render
  end
end
