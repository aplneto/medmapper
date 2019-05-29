require 'rails_helper'

RSpec.describe "professional_profiles/show", type: :view do
  before(:each) do
    @professional_profile = assign(:professional_profile, ProfessionalProfile.create!(
      :registry => "Registry",
      :ocupation => "Ocupation",
      :validation => false,
      :contacts => "MyText",
      :places => "MyText",
      :services => "MyText",
      :cpf => "Cpf",
      :user_profile => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Registry/)
    expect(rendered).to match(/Ocupation/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(//)
  end
end
