require 'rails_helper'

RSpec.describe "diagnosis_units/show", type: :view do
  before(:each) do
    @diagnosis_unit = assign(:diagnosis_unit, DiagnosisUnit.create!(
      :health_unit => nil,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
  end
end
