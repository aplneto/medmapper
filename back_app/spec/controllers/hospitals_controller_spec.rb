require 'rails_helper'

RSpec.describe HospitalsController, type: :controller do
    before :context do
        @hospital1 = FactoryBot.create :hospital
        @hospital1.save!
    end
    
    describe '#index' do
        after (:example) do
            get :index
        end
        it 'should send an "all" request to the model' do
            expect(Hospital).to receive(:all)
        end
        it 'should have http success status' do
            expect(response).to have_http_status(:success)
        end
        it 'should contain the @hospital1 entity in it\'s body' do
            get :index
            json_response = JSON.parse(response.body)
            expect(json_response).to include(JSON.parse(@hospital1.to_json))
        end
    end
    
    describe '#show' do
        it 'should send a find request to the Hospital model' do
            expect(Hospital).to receive(:find).with(@hospital1.id)
            get :show, params: {id: @hospital1.id.to_s}
        end
        it 'should send the json information of the correct hospital' do
            get :show, params: {id: @hospital1.id.to_s}
            expect(response.body).to eq(@hospital1.to_json)
        end
        it 'should send an error json if the information is invalid' do
            get :show, params: {id: '0'}
            expect(response).to have_http_status(:not_found)
        end
    end
    
    describe '#find_by' do
        it 'should send a "find_by" request to the Hospital model'
        it 'needs to have the valid hospital in it\'s body\'s response'
    end

    describe '#new'

    describe '#update'

    describe '#destroy'
end