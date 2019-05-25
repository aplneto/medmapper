require 'rails_helper'

RSpec.describe "health_units/index", type: :view do
  before(:each) do
    assign(:health_units, [
      HealthUnit.create!(
        :cnes => 2,
        :name => "Name",
        :address => "Address",
        :neighborhood => "Neighborhood",
        :phone => "Phone",
        :latitude => 3.5,
        :longitude => 4.5,
        :description => "MyText"
      ),
      HealthUnit.create!(
        :cnes => 2,
        :name => "Name",
        :address => "Address",
        :neighborhood => "Neighborhood",
        :phone => "Phone",
        :latitude => 3.5,
        :longitude => 4.5,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of health_units" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Neighborhood".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
