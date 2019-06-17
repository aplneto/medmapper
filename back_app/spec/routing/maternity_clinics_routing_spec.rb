# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MaternityClinicsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/maternidades').to route_to('maternity_clinics#index')
    end

    it 'routes to #new' do
      expect(get: '/maternidades/new').to route_to('maternity_clinics#new')
    end

    it 'routes to #show' do
      expect(get: '/maternidades/1').to route_to('maternity_clinics#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/maternidades/1/edit').to route_to('maternity_clinics#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/maternidades').to route_to('maternity_clinics#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/maternidades/1').to route_to('maternity_clinics#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/maternidades/1').to route_to('maternity_clinics#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/maternidades/1').to route_to('maternity_clinics#destroy', id: '1')
    end
  end
end
