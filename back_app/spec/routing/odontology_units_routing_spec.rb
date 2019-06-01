# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OdontologyUnitsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/odontologia').to route_to('odontology_units#index')
    end

    it 'routes to #new' do
      expect(get: '/odontologia/new').to route_to('odontology_units#new')
    end

    it 'routes to #show' do
      expect(get: '/odontologia/1').to route_to('odontology_units#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/odontologia/1/edit').to route_to('odontology_units#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/odontologia').to route_to('odontology_units#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/odontologia/1').to route_to('odontology_units#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/odontologia/1').to route_to('odontology_units#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/odontologia/1').to route_to('odontology_units#destroy', id: '1')
    end
  end
end
