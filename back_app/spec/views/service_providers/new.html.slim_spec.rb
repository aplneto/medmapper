require 'rails_helper'

RSpec.describe "service_providers/new", type: :view do
  before(:each) do
    assign(:service_provider, ServiceProvider.new(
      :name => "MyString",
      :address => "MyString",
      :neighborhood => "MyString",
      :phone => "MyString",
      :user => nil,
      :description => "MyText"
    ))
  end

  it "renders new service_provider form" do
    render

    assert_select "form[action=?][method=?]", service_providers_path, "post" do

      assert_select "input[name=?]", "service_provider[name]"

      assert_select "input[name=?]", "service_provider[address]"

      assert_select "input[name=?]", "service_provider[neighborhood]"

      assert_select "input[name=?]", "service_provider[phone]"

      assert_select "input[name=?]", "service_provider[user_id]"

      assert_select "textarea[name=?]", "service_provider[description]"
    end
  end
end
