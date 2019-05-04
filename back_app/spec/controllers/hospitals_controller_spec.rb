require 'rails_helper'

RSpec.describe HospitalsController, type: :controller do
    describe '#index' do
        it "should send a request to the model for all the hostpials" do
            expect(Hospital).to receive(:all)
            get :index
        end
        it "should return an array containing all hospitals"
    end
end
