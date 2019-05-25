require 'rails_helper'

RSpec.describe "professionals/show", type: :view do
  before(:each) do
    @professional = assign(:professional, Professional.create!(
      :user => nil,
      :registry => "Registry",
      :ocupation => "Ocupation",
      :validation => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Registry/)
    expect(rendered).to match(/Ocupation/)
    expect(rendered).to match(/false/)
  end
end
