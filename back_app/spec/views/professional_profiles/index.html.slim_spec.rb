require 'rails_helper'

RSpec.describe "professional_profiles/index", type: :view do
  before(:each) do
    assign(:professional_profiles, [
      ProfessionalProfile.create!(
        :registry => "Registry",
        :ocupation => "Ocupation",
        :validation => false,
        :contacts => "MyText",
        :places => "MyText",
        :services => "MyText",
        :cpf => "Cpf",
        :user_profile => nil
      ),
      ProfessionalProfile.create!(
        :registry => "Registry",
        :ocupation => "Ocupation",
        :validation => false,
        :contacts => "MyText",
        :places => "MyText",
        :services => "MyText",
        :cpf => "Cpf",
        :user_profile => nil
      )
    ])
  end

  it "renders a list of professional_profiles" do
    render
    assert_select "tr>td", :text => "Registry".to_s, :count => 2
    assert_select "tr>td", :text => "Ocupation".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
