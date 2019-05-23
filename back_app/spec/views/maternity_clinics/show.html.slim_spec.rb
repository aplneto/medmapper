require 'rails_helper'

RSpec.describe "maternity_clinics/show", type: :view do
  before(:each) do
    @maternity_clinic = assign(:maternity_clinic, MaternityClinic.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
