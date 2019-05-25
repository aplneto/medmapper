require 'rails_helper'

RSpec.describe "polyclinics/new", type: :view do
  before(:each) do
    assign(:polyclinic, Polyclinic.new(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders new polyclinic form" do
    render

    assert_select "form[action=?][method=?]", polyclinics_path, "post" do

      assert_select "input[name=?]", "polyclinic[health_unit_id]"

      assert_select "input[name=?]", "polyclinic[type]"
    end
  end
end
