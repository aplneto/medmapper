require 'rails_helper'

RSpec.describe "professionals/index", type: :view do
  before(:each) do
    assign(:professionals, [
      Professional.create!(
        :user => nil,
        :registry => "Registry",
        :ocupation => "Ocupation",
        :validation => false
      ),
      Professional.create!(
        :user => nil,
        :registry => "Registry",
        :ocupation => "Ocupation",
        :validation => false
      )
    ])
  end

  it "renders a list of professionals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Registry".to_s, :count => 2
    assert_select "tr>td", :text => "Ocupation".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
