require 'rails_helper'

RSpec.describe "polyclincs/edit", type: :view do
  before(:each) do
    @polyclinc = assign(:polyclinc, Polyclinc.create!())
  end

  it "renders the edit polyclinc form" do
    render

    assert_select "form[action=?][method=?]", polyclinc_path(@polyclinc), "post" do
    end
  end
end
