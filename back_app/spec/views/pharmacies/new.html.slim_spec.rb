require 'rails_helper'

RSpec.describe "pharmacies/new", type: :view do
  before(:each) do
    assign(:pharmacy, Pharmacy.new(
      :health_unit => nil
    ))
  end

  it "renders new pharmacy form" do
    render

    assert_select "form[action=?][method=?]", pharmacies_path, "post" do

      assert_select "input[name=?]", "pharmacy[health_unit_id]"
    end
  end
end
