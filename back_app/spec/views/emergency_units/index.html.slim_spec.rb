require 'rails_helper'

RSpec.describe "emergency_units/index", type: :view do
  before(:each) do
    assign(:emergency_units, [
      EmergencyUnit.create!(
        :health_unit => nil,
        :type => "Type"
      ),
      EmergencyUnit.create!(
        :health_unit => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of emergency_units" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
