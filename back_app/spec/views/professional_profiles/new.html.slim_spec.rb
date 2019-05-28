require 'rails_helper'

RSpec.describe "professional_profiles/new", type: :view do
  before(:each) do
    assign(:professional_profile, ProfessionalProfile.new(
      :registry => "MyString",
      :ocupation => "MyString",
      :validation => false,
      :contacts => "MyText",
      :places => "MyText",
      :services => "MyText",
      :cpf => "MyString",
      :user_profile => nil
    ))
  end

  it "renders new professional_profile form" do
    render

    assert_select "form[action=?][method=?]", professional_profiles_path, "post" do

      assert_select "input[name=?]", "professional_profile[registry]"

      assert_select "input[name=?]", "professional_profile[ocupation]"

      assert_select "input[name=?]", "professional_profile[validation]"

      assert_select "textarea[name=?]", "professional_profile[contacts]"

      assert_select "textarea[name=?]", "professional_profile[places]"

      assert_select "textarea[name=?]", "professional_profile[services]"

      assert_select "input[name=?]", "professional_profile[cpf]"

      assert_select "input[name=?]", "professional_profile[user_profile_id]"
    end
  end
end
