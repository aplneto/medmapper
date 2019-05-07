require 'rails_helper'

RSpec.describe HospitalsController, type: :controller do
    describe '#index' do
        before (:all) do
            @hospital1 = FactoryBot.create :hospital
            @hospital1.save
        end
        it 'should send an "all" request to the model' do
            expect(Hospital).to receive(:all)
            get :index
        end
    end
    describe '#show' do
        it 'should return an error-like JSON if nothing is found' do
            expect(response.status).to eq(404)
            get :show, param: {:id => '2777460'}
        end
    end
end
