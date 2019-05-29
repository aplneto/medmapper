require 'rails_helper'

RSpec.describe "user_profiles/show", type: :view do
  before(:each) do
    @user_profile = assign(:user_profile, UserProfile.create!(
      :name => "Name",
      :sex => "Sex",
      :phone => "Phone",
      :description => "MyText",
      :account => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Sex/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
