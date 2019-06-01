# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiagnosisUnitsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/apoio-diagnostico').to route_to('diagnosis_units#index')
    end

    it 'routes to #new' do
      expect(get: '/apoio-diagnostico/new').to route_to('diagnosis_units#new')
    end

    it 'routes to #show' do
      expect(get: '/apoio-diagnostico/1').to route_to('diagnosis_units#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/apoio-diagnostico/1/edit').to route_to('diagnosis_units#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/apoio-diagnostico').to route_to('diagnosis_units#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/apoio-diagnostico/1').to route_to('diagnosis_units#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/apoio-diagnostico/1').to route_to('diagnosis_units#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/apoio-diagnostico/1').to route_to('diagnosis_units#destroy', id: '1')
    end
  end
end
