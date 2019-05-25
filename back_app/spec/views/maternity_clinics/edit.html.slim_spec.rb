require 'rails_helper'

RSpec.describe "maternity_clinics/edit", type: :view do
  before(:each) do
    @maternity_clinic = assign(:maternity_clinic, MaternityClinic.create!(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders the edit maternity_clinic form" do
    render

    assert_select "form[action=?][method=?]", maternity_clinic_path(@maternity_clinic), "post" do

      assert_select "input[name=?]", "maternity_clinic[health_unit_id]"

      assert_select "input[name=?]", "maternity_clinic[type]"
    end
  end
end
