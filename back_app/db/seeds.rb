# Dados Recife's Website uses CKAN Datastore api extension
# https://docs.ckan.org/en/ckan-2.7.3/api/index.html
# https://docs.ckan.org/en/latest/maintaining/datastore.html


#ID_Hospitai: 2db3a931-7cf2-4974-9c06-c9fc99b5f5af

#Resource Search: Hospitais:
#http://dados.recife.pe.gov.br/api/action/resource_search?query=name:hospitais

#Dataset ids nas URLs: http://dados.recife.pe.gov.br/dataset/unidades-de-saude


require 'httparty'
require 'json'

def save_nasf_unit (unidade)
    if unidade.has_key? 'ponto_de_apoio'
        nasf = FamilyHealthSupportCenter.new
        nasf.district = unidade['distrito']
        nasf.name = unidade['unidade']
        nasf.support_point = unidade['ponto_de_apoio']
        nasf.latitude = unidade['latitude']
        nasf.longitude = unidade['longitude']
        nasf.team = unidade['equipe']
        nasf.area = unidade['area']
        nasf.phone = unidade['telefone']
        nasf.save!
    else
        false
    end
end


def save_health_unit (unidade, unit)

    unit.cnes = unidade.has_key?('cnes') ?
    unidade['cnes'] : 99999
    unit.name = unidade['unidade']
    unit.address = unidade.has_key?('endereco') ?
    unidade['endereco'] : 'desconhecido'
    unit.neighborhood = unidade.has_key?('bairro') ? 
    unidade['bairro'] : 'desconhecido'
    unit.phone = unidade.has_key?('fone')? 
    unidade['fone'] : "desconhecido"
    unit.latitude = unidade['latitude']
    unit.longitude = unidade['longitude']
    unit.treatments = []
    unit.city = 'Recife'
    unit.state = 'PE'
    unit.specialties = unidade.has_key?('especialidades') ?
    unidade['especialidades'].split(' ').map {|s| s.delete(',').
        delete('.')}.flatten.uniq - $tags_inuteis : []
    unit.category = 'Public'

    unit.save!

end

api_src = "http://dados.recife.pe.gov.br/api/action/"

lista_de_unidades = HTTParty.post(api_src+"package_show",
    body: { id: "unidades-de-saude" }.to_json)["result"]

$tags_inuteis = %w"A AS E O OS COM DA DAS DE DO DOS NA NO SEM"

$db_status = { } # Hash global contendo as datas da última atualização do BD

$error_loading = { } # Hash global de recursos não encontrados

lista_de_unidades['resources'].each do |resource|
    if resource['name'].include? 'Definição' or
        resource['name'].include? 'Dicionário' or
        resource['name'] == 'Farmácias Populares'
        next
    elsif resource['name'].include? 'NASF'
        list = HTTParty.post(api_src+'datastore_search',
            body: { id: resource['id'] }.to_json)
        list['result']['records'].each do |nasf|
            save_nasf_unit nasf
        end
    else
        list = HTTParty.post(api_src+"datastore_search", body: {
             resource_id: resource['id'] 
            }.to_json)
        
        list['result']['records'].each do |unidade|

            case resource['name']
            when /\bEspecialidades Odontológicas\b/
                unit = OdontologyUnit.new
            when /\bFarmácias da Família\b/
                unit = Pharmacy.new
            when /\bHospitais\b/
                unit = Hospital.new
            when /\bPoliclínica\b/
                unit = Polyclinic.new
            when /\bServiço de Apoio Diagnóstico\b/
                unit = DiagnosisUnit.new
            when /\bSaúde Mental\b/
                unit = MentalHealthUnit.new
            when /\bPronto Atendimento\b/
                unit = EmergencyUnit.new
            when /\bUnidades Básicas\b/
                unit = BasicHealthUnit.new
            when /\bSaúde da Família\b/
                unit = FamilyHealthUnit.new
            when /\bUnidades Especializadas\b/
                unit = SpecializedUnit.new
            when /\bMaternidades\b/
                unit = MaternityClinic.new
            end

            save_health_unit(unidade, unit)

        end

    end
end