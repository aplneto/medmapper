require 'rails_helper'

RSpec.describe "odontology_units/index", type: :view do
  before(:each) do
    assign(:odontology_units, [
      OdontologyUnit.create!(
        :health_unit => nil,
        :type => "Type"
      ),
      OdontologyUnit.create!(
        :health_unit => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of odontology_units" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
