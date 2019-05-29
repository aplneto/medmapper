require 'rails_helper'

RSpec.describe "user_profiles/new", type: :view do
  before(:each) do
    assign(:user_profile, UserProfile.new(
      :name => "MyString",
      :sex => "MyString",
      :phone => "MyString",
      :description => "MyText",
      :account => nil
    ))
  end

  it "renders new user_profile form" do
    render

    assert_select "form[action=?][method=?]", user_profiles_path, "post" do

      assert_select "input[name=?]", "user_profile[name]"

      assert_select "input[name=?]", "user_profile[sex]"

      assert_select "input[name=?]", "user_profile[phone]"

      assert_select "textarea[name=?]", "user_profile[description]"

      assert_select "input[name=?]", "user_profile[account_id]"
    end
  end
end
