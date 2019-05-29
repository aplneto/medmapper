require 'rails_helper'

RSpec.describe "user_profiles/index", type: :view do
  before(:each) do
    assign(:user_profiles, [
      UserProfile.create!(
        :name => "Name",
        :sex => "Sex",
        :phone => "Phone",
        :description => "MyText",
        :account => nil
      ),
      UserProfile.create!(
        :name => "Name",
        :sex => "Sex",
        :phone => "Phone",
        :description => "MyText",
        :account => nil
      )
    ])
  end

  it "renders a list of user_profiles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
