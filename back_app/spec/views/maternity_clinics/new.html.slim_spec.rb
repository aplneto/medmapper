require 'rails_helper'

RSpec.describe "maternity_clinics/new", type: :view do
  before(:each) do
    assign(:maternity_clinic, MaternityClinic.new(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders new maternity_clinic form" do
    render

    assert_select "form[action=?][method=?]", maternity_clinics_path, "post" do

      assert_select "input[name=?]", "maternity_clinic[health_unit_id]"

      assert_select "input[name=?]", "maternity_clinic[type]"
    end
  end
end
