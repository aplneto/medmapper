# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthUnitsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/unidades').to route_to('health_units#index')
    end

    it 'routes to #new' do
      expect(get: '/unidades/new').to route_to('health_units#new')
    end

    it 'routes to #show' do
      expect(get: '/unidades/1').to route_to('health_units#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/unidades/1/edit').to route_to('health_units#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/unidades').to route_to('health_units#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/unidades/1').to route_to('health_units#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/unidades/1').to route_to('health_units#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/unidades/1').to route_to('health_units#destroy', id: '1')
    end
  end
end
