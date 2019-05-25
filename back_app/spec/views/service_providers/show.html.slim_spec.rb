require 'rails_helper'

RSpec.describe "service_providers/show", type: :view do
  before(:each) do
    @service_provider = assign(:service_provider, ServiceProvider.create!(
      :name => "Name",
      :address => "Address",
      :neighborhood => "Neighborhood",
      :phone => "Phone",
      :user => nil,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Neighborhood/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
