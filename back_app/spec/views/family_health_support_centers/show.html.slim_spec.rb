require 'rails_helper'

RSpec.describe "family_health_support_centers/show", type: :view do
  before(:each) do
    @family_health_support_center = assign(:family_health_support_center, FamilyHealthSupportCenter.create!(
      :team => "Team",
      :support_point => "Support Point",
      :name => "Name",
      :area => "Area",
      :phone => "Phone",
      :latitude => 2.5,
      :longitude => 3.5,
      :district => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Team/)
    expect(rendered).to match(/Support Point/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Area/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4/)
  end
end
