require 'rails_helper'

RSpec.describe "professionals/edit", type: :view do
  before(:each) do
    @professional = assign(:professional, Professional.create!(
      :user => nil,
      :registry => "MyString",
      :ocupation => "MyString",
      :validation => false
    ))
  end

  it "renders the edit professional form" do
    render

    assert_select "form[action=?][method=?]", professional_path(@professional), "post" do

      assert_select "input[name=?]", "professional[user_id]"

      assert_select "input[name=?]", "professional[registry]"

      assert_select "input[name=?]", "professional[ocupation]"

      assert_select "input[name=?]", "professional[validation]"
    end
  end
end
