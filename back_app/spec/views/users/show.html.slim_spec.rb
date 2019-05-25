require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :user_name => "User Name",
      :email => "Email",
      :sex => "Sex",
      :encrypted_password => "Encrypted Password",
      :name => "Name",
      :phone => "Phone",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Sex/)
    expect(rendered).to match(/Encrypted Password/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
  end
end
