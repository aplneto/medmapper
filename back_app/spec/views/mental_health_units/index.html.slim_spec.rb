require 'rails_helper'

RSpec.describe "mental_health_units/index", type: :view do
  before(:each) do
    assign(:mental_health_units, [
      MentalHealthUnit.create!(
        :health_unit => nil,
        :type => "Type"
      ),
      MentalHealthUnit.create!(
        :health_unit => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of mental_health_units" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
