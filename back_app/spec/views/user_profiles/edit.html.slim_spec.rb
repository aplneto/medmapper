require 'rails_helper'

RSpec.describe "user_profiles/edit", type: :view do
  before(:each) do
    @user_profile = assign(:user_profile, UserProfile.create!(
      :name => "MyString",
      :sex => "MyString",
      :phone => "MyString",
      :description => "MyText",
      :account => nil
    ))
  end

  it "renders the edit user_profile form" do
    render

    assert_select "form[action=?][method=?]", user_profile_path(@user_profile), "post" do

      assert_select "input[name=?]", "user_profile[name]"

      assert_select "input[name=?]", "user_profile[sex]"

      assert_select "input[name=?]", "user_profile[phone]"

      assert_select "textarea[name=?]", "user_profile[description]"

      assert_select "input[name=?]", "user_profile[account_id]"
    end
  end
end
