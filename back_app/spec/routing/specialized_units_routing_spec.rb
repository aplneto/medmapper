# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpecializedUnitsController, type: :routing do
  describe 'routing list by specialties' do
    it 'routes to basic_health_units' do
      expect(get: '/unidades-basicas/especialidades').to route_to('basic_health_units#list_by_specialties')
    end

    it 'routes to diagnosis_units' do
      expect(get: '/apoio-diagnostico/especialidades').to route_to('diagnosis_units#list_by_specialties')
    end

    it 'routes to emergency_units' do
      expect(get: '/emergencias/especialidades').to route_to('emergency_units#list_by_specialties')
    end

    it 'routes to family_health_units' do
      expect(get: '/saude-da-familia/especialidades').to route_to('family_health_units#list_by_specialties')
    end

    it 'routes to hospitals' do
      expect(get: '/hospitais/especialidades').to route_to('hospitals#list_by_specialties')
    end

    it 'routes to maternity_clinics' do
      expect(get: '/maternidades/especialidades').to route_to('maternity_clinics#list_by_specialties')
    end

    it 'routes to mental_health_units' do
      expect(get: '/saude-mental/especialidades').to route_to('mental_health_units#list_by_specialties')
    end

    it 'routes to odontology_units' do
      expect(get: '/odontologia/especialidades').to route_to('odontology_units#list_by_specialties')
    end

    it 'routes to pharmacies' do
      expect(get: '/farmacias/especialidades').to route_to('pharmacies#list_by_specialties')
    end

    it 'routes to polyclinics' do
      expect(get: '/policlinicas/especialidades').to route_to('polyclinics#list_by_specialties')
    end

    it 'routes to specialized_units' do
      expect(get: '/unidades-especializadas/especialidades').to route_to('specialized_units#list_by_specialties')
    end

    it 'routes to health_units' do
      expect(get: '/unidades/especialidades').to route_to('health_units#list_by_specialties')
    end
  end
end
