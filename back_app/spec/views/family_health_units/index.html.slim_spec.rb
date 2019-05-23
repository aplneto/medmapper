require 'rails_helper'

RSpec.describe "family_health_units/index", type: :view do
  before(:each) do
    assign(:family_health_units, [
      FamilyHealthUnit.create!(),
      FamilyHealthUnit.create!()
    ])
  end

  it "renders a list of family_health_units" do
    render
  end
end
