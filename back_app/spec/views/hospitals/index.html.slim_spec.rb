require 'rails_helper'

RSpec.describe "hospitals/index", type: :view do
  before(:each) do
    assign(:hospitals, [
      Hospital.create!(
        :health_unit => nil,
        :type => "Type"
      ),
      Hospital.create!(
        :health_unit => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of hospitals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
