require 'rails_helper'

RSpec.describe "maternity_clinics/index", type: :view do
  before(:each) do
    assign(:maternity_clinics, [
      MaternityClinic.create!(
        :health_unit => nil,
        :type => "Type"
      ),
      MaternityClinic.create!(
        :health_unit => nil,
        :type => "Type"
      )
    ])
  end

  it "renders a list of maternity_clinics" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
