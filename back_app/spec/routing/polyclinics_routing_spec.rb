# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PolyclinicsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/policlinicas').to route_to('polyclinics#index')
    end

    it 'routes to #new' do
      expect(get: '/policlinicas/new').to route_to('polyclinics#new')
    end

    it 'routes to #show' do
      expect(get: '/policlinicas/1').to route_to('polyclinics#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/policlinicas/1/edit').to route_to('polyclinics#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/policlinicas').to route_to('polyclinics#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/policlinicas/1').to route_to('polyclinics#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/policlinicas/1').to route_to('polyclinics#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/policlinicas/1').to route_to('polyclinics#destroy', id: '1')
    end
  end
end
