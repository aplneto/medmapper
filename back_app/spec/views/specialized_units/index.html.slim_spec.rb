require 'rails_helper'

RSpec.describe "specialized_units/index", type: :view do
  before(:each) do
    assign(:specialized_units, [
      SpecializedUnit.create!(
        :health_unit => nil,
        :type => "Type"
      ),
      SpecializedUnit.create!(
        :health_unit => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of specialized_units" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
