require 'rails_helper'

RSpec.describe "family_health_units/index", type: :view do
  before(:each) do
    assign(:family_health_units, [
      FamilyHealthUnit.create!(
        :health_unit => nil,
        :type => "Type"
      ),
      FamilyHealthUnit.create!(
        :health_unit => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of family_health_units" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
