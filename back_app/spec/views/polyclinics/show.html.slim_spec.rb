require 'rails_helper'

RSpec.describe "polyclinics/show", type: :view do
  before(:each) do
    @polyclinic = assign(:polyclinic, Polyclinic.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
