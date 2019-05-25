require 'rails_helper'

RSpec.describe "maternity_clinics/show", type: :view do
  before(:each) do
    @maternity_clinic = assign(:maternity_clinic, MaternityClinic.create!(
      :health_unit => nil,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
  end
end
