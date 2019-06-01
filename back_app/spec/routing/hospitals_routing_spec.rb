# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HospitalsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/hospitais').to route_to('hospitals#index')
    end

    it 'routes to #new' do
      expect(get: '/hospitais/new').to route_to('hospitals#new')
    end

    it 'routes to #show' do
      expect(get: '/hospitais/1').to route_to('hospitals#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/hospitais/1/edit').to route_to('hospitals#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/hospitais').to route_to('hospitals#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/hospitais/1').to route_to('hospitals#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/hospitais/1').to route_to('hospitals#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/hospitais/1').to route_to('hospitals#destroy', id: '1')
    end
  end
end
