# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PharmaciesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/farmacias').to route_to('pharmacies#index')
    end

    it 'routes to #new' do
      expect(get: '/farmacias/new').to route_to('pharmacies#new')
    end

    it 'routes to #show' do
      expect(get: '/farmacias/1').to route_to('pharmacies#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/farmacias/1/edit').to route_to('pharmacies#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/farmacias').to route_to('pharmacies#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/farmacias/1').to route_to('pharmacies#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/farmacias/1').to route_to('pharmacies#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/farmacias/1').to route_to('pharmacies#destroy', id: '1')
    end
  end
end
