require 'rails_helper'

RSpec.describe "diagnosis_units/index", type: :view do
  before(:each) do
    assign(:diagnosis_units, [
      DiagnosisUnit.create!(
        :health_unit => nil,
        :type => "Type"
      ),
      DiagnosisUnit.create!(
        :health_unit => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of diagnosis_units" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
