require 'rails_helper'

RSpec.describe "service_providers/index", type: :view do
  before(:each) do
    assign(:service_providers, [
      ServiceProvider.create!(
        :name => "Name",
        :address => "Address",
        :neighborhood => "Neighborhood",
        :phone => "Phone",
        :user_profile => nil,
        :latitude => 2.5,
        :longitude => 3.5,
        :description => "MyText"
      ),
      ServiceProvider.create!(
        :name => "Name",
        :address => "Address",
        :neighborhood => "Neighborhood",
        :phone => "Phone",
        :user_profile => nil,
        :latitude => 2.5,
        :longitude => 3.5,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of service_providers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Neighborhood".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
