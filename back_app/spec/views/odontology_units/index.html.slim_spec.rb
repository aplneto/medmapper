require 'rails_helper'

RSpec.describe "odontology_units/index", type: :view do
  before(:each) do
    assign(:odontology_units, [
      OdontologyUnit.create!(),
      OdontologyUnit.create!()
    ])
  end

  it "renders a list of odontology_units" do
    render
  end
end
