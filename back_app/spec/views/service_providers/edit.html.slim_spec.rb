require 'rails_helper'

RSpec.describe "service_providers/edit", type: :view do
  before(:each) do
    @service_provider = assign(:service_provider, ServiceProvider.create!(
      :name => "MyString",
      :address => "MyString",
      :neighborhood => "MyString",
      :phone => "MyString",
      :user_profile => nil,
      :latitude => 1.5,
      :longitude => 1.5,
      :description => "MyText"
    ))
  end

  it "renders the edit service_provider form" do
    render

    assert_select "form[action=?][method=?]", service_provider_path(@service_provider), "post" do

      assert_select "input[name=?]", "service_provider[name]"

      assert_select "input[name=?]", "service_provider[address]"

      assert_select "input[name=?]", "service_provider[neighborhood]"

      assert_select "input[name=?]", "service_provider[phone]"

      assert_select "input[name=?]", "service_provider[user_profile_id]"

      assert_select "input[name=?]", "service_provider[latitude]"

      assert_select "input[name=?]", "service_provider[longitude]"

      assert_select "textarea[name=?]", "service_provider[description]"
    end
  end
end
