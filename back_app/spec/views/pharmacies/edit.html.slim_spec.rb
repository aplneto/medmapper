require 'rails_helper'

RSpec.describe "pharmacies/edit", type: :view do
  before(:each) do
    @pharmacy = assign(:pharmacy, Pharmacy.create!(
      :health_unit => nil
    ))
  end

  it "renders the edit pharmacy form" do
    render

    assert_select "form[action=?][method=?]", pharmacy_path(@pharmacy), "post" do

      assert_select "input[name=?]", "pharmacy[health_unit_id]"
    end
  end
end
