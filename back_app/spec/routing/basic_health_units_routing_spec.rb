# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasicHealthUnitsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/unidades-basicas').to route_to('basic_health_units#index')
    end

    it 'routes to #new' do
      expect(get: '/unidades-basicas/new').to route_to('basic_health_units#new')
    end

    it 'routes to #show' do
      expect(get: '/unidades-basicas/1').to route_to('basic_health_units#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/unidades-basicas/1/edit').to route_to('basic_health_units#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/unidades-basicas').to route_to('basic_health_units#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/unidades-basicas/1').to route_to('basic_health_units#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/unidades-basicas/1').to route_to('basic_health_units#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/unidades-basicas/1').to route_to('basic_health_units#destroy', id: '1')
    end
  end
end
