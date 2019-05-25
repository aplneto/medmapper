require 'rails_helper'

RSpec.describe "pharmacies/index", type: :view do
  before(:each) do
    assign(:pharmacies, [
      Pharmacy.create!(
        :health_unit => nil
      ),
      Pharmacy.create!(
        :health_unit => nil
      )
    ])
  end

  it "renders a list of pharmacies" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
