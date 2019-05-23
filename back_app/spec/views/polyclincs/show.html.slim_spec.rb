require 'rails_helper'

RSpec.describe "polyclincs/show", type: :view do
  before(:each) do
    @polyclinc = assign(:polyclinc, Polyclinc.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
