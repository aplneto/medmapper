require 'rails_helper'

RSpec.describe "polyclinics/edit", type: :view do
  before(:each) do
    @polyclinic = assign(:polyclinic, Polyclinic.create!(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders the edit polyclinic form" do
    render

    assert_select "form[action=?][method=?]", polyclinic_path(@polyclinic), "post" do

      assert_select "input[name=?]", "polyclinic[health_unit_id]"

      assert_select "input[name=?]", "polyclinic[type]"
    end
  end
end
