require 'rails_helper'

RSpec.describe "polyclinics/new", type: :view do
  before(:each) do
    assign(:polyclinic, Polyclinic.new())
  end

  it "renders new polyclinic form" do
    render

    assert_select "form[action=?][method=?]", polyclinics_path, "post" do
    end
  end
end
