require 'rails_helper'

RSpec.describe "maternity_clinics/new", type: :view do
  before(:each) do
    assign(:maternity_clinic, MaternityClinic.new())
  end

  it "renders new maternity_clinic form" do
    render

    assert_select "form[action=?][method=?]", maternity_clinics_path, "post" do
    end
  end
end
