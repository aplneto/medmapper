require 'rails_helper'

RSpec.describe "polyclincs/index", type: :view do
  before(:each) do
    assign(:polyclincs, [
      Polyclinc.create!(),
      Polyclinc.create!()
    ])
  end

  it "renders a list of polyclincs" do
    render
  end
end
