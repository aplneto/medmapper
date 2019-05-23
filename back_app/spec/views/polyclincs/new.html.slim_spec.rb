require 'rails_helper'

RSpec.describe "polyclincs/new", type: :view do
  before(:each) do
    assign(:polyclinc, Polyclinc.new())
  end

  it "renders new polyclinc form" do
    render

    assert_select "form[action=?][method=?]", polyclincs_path, "post" do
    end
  end
end
