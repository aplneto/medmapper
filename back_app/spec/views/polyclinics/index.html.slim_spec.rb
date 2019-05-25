require 'rails_helper'

RSpec.describe "polyclinics/index", type: :view do
  before(:each) do
    assign(:polyclinics, [
      Polyclinic.create!(
        :health_unit => nil,
        :type => "Type"
      ),
      Polyclinic.create!(
        :health_unit => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of polyclinics" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
