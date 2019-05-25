require 'rails_helper'

RSpec.describe "health_units/show", type: :view do
  before(:each) do
    @health_unit = assign(:health_unit, HealthUnit.create!(
      :cnes => 2,
      :name => "Name",
      :address => "Address",
      :neighborhood => "Neighborhood",
      :phone => "Phone",
      :latitude => 3.5,
      :longitude => 4.5,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Neighborhood/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/MyText/)
  end
end
