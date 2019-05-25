require 'rails_helper'

RSpec.describe "polyclinics/show", type: :view do
  before(:each) do
    @polyclinic = assign(:polyclinic, Polyclinic.create!(
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
