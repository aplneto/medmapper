require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :user_name => "User Name",
        :email => "Email",
        :sex => "Sex",
        :encrypted_password => "Encrypted Password",
        :name => "Name",
        :phone => "Phone",
        :description => "MyText"
      ),
      User.create!(
        :user_name => "User Name",
        :email => "Email",
        :sex => "Sex",
        :encrypted_password => "Encrypted Password",
        :name => "Name",
        :phone => "Phone",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
