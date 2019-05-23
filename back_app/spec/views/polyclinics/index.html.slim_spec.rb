require 'rails_helper'

RSpec.describe "polyclinics/index", type: :view do
  before(:each) do
    assign(:polyclinics, [
      Polyclinic.create!(),
      Polyclinic.create!()
    ])
  end

  it "renders a list of polyclinics" do
    render
  end
end
