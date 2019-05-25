require 'rails_helper'

RSpec.describe "professionals/new", type: :view do
  before(:each) do
    assign(:professional, Professional.new(
      :user => nil,
      :registry => "MyString",
      :ocupation => "MyString",
      :validation => false
    ))
  end

  it "renders new professional form" do
    render

    assert_select "form[action=?][method=?]", professionals_path, "post" do

      assert_select "input[name=?]", "professional[user_id]"

      assert_select "input[name=?]", "professional[registry]"

      assert_select "input[name=?]", "professional[ocupation]"

      assert_select "input[name=?]", "professional[validation]"
    end
  end
end
