require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :user_name => "MyString",
      :email => "MyString",
      :sex => "MyString",
      :encrypted_password => "MyString",
      :name => "MyString",
      :phone => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[user_name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[sex]"

      assert_select "input[name=?]", "user[encrypted_password]"

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[phone]"

      assert_select "textarea[name=?]", "user[description]"
    end
  end
end
