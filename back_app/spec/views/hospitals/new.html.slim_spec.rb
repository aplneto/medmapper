require 'rails_helper'

RSpec.describe "hospitals/new", type: :view do
  before(:each) do
    assign(:hospital, Hospital.new(
      :health_unit => nil,
      :type => ""
    ))
  end

  it "renders new hospital form" do
    render

    assert_select "form[action=?][method=?]", hospitals_path, "post" do

      assert_select "input[name=?]", "hospital[health_unit_id]"

      assert_select "input[name=?]", "hospital[type]"
    end
  end
end
