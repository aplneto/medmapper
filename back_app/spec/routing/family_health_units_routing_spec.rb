# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FamilyHealthUnitsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/saude-da-familia').to route_to('family_health_units#index')
    end

    it 'routes to #new' do
      expect(get: '/saude-da-familia/new').to route_to('family_health_units#new')
    end

    it 'routes to #show' do
      expect(get: '/saude-da-familia/1').to route_to('family_health_units#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/saude-da-familia/1/edit').to route_to('family_health_units#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/saude-da-familia').to route_to('family_health_units#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/saude-da-familia/1').to route_to('family_health_units#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/saude-da-familia/1').to route_to('family_health_units#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/saude-da-familia/1').to route_to('family_health_units#destroy', id: '1')
    end
  end
end
