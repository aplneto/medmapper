require 'rails_helper'

RSpec.describe "maternity_clinics/index", type: :view do
  before(:each) do
    assign(:maternity_clinics, [
      MaternityClinic.create!(),
      MaternityClinic.create!()
    ])
  end

  it "renders a list of maternity_clinics" do
    render
  end
end
