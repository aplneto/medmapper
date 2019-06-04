require 'rails_helper'

RSpec.describe "family_health_support_centers/index", type: :view do
  before(:each) do
    assign(:family_health_support_centers, [
      FamilyHealthSupportCenter.create!(
        :team => "Team",
        :support_point => "Support Point",
        :name => "Name",
        :area => "Area",
        :phone => "Phone",
        :latitude => 2.5,
        :longitude => 3.5,
        :district => 4
      ),
      FamilyHealthSupportCenter.create!(
        :team => "Team",
        :support_point => "Support Point",
        :name => "Name",
        :area => "Area",
        :phone => "Phone",
        :latitude => 2.5,
        :longitude => 3.5,
        :district => 4
      )
    ])
  end

  it "renders a list of family_health_support_centers" do
    render
    assert_select "tr>td", :text => "Team".to_s, :count => 2
    assert_select "tr>td", :text => "Support Point".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Area".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
