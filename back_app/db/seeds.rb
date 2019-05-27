# Dados Recife's Website uses CKAN Datastore api extension
# https://docs.ckan.org/en/ckan-2.7.3/api/index.html
# https://docs.ckan.org/en/latest/maintaining/datastore.html


#ID_Hospitai: 2db3a931-7cf2-4974-9c06-c9fc99b5f5af

#Resource Search: Hospitais:
#http://dados.recife.pe.gov.br/api/action/resource_search?query=name:hospitais

#Dataset ids nas URLs: http://dados.recife.pe.gov.br/dataset/unidades-de-saude


require 'httparty'
require 'json'

api_src = "http://dados.recife.pe.gov.br/api/action/"

lista_de_unidades = HTTParty.post(api_src+"package_show",
    body: { id: "unidades-de-saude" }.to_json)["result"]

$tags_inuteis = %w"A AS E O OS COM DA DAS DE DO DOS NA NO SEM"

$db_status = { } # Hash global contendo as datas da última atualização do BD

$error_loading = { } # Hash global de recursos não encontrados

lista_de_unidades['resources'].each do |resource|
    
    # Pulando os NASF e Farmácias Populares
    if resource['name'].include? 'NASF'
        next
    end

    unidades_de_saude = HTTParty.post(api_src+"datastore_search",
        body: {resource_id: resource['id']}.to_json)
    unless unidades_de_saude['error'] # Se o JSON de retorno não tiver erros
        $db_status[resource['name'].to_sym] = resource['last_modified']
        unidades_de_saude['result']['records'].each do |unidade|
            unless unidade.has_key? 'unidade'
                next
            end
            health_unit = HealthUnit.new
            health_unit.cnes = unidade.has_key?('cnes') ?
            unidade['cnes'] : 99999
            health_unit.name = unidade['unidade']
            health_unit.address = unidade.has_key?('endereco') ?
            unidade['endereco'] : 'desconhecido'
            health_unit.neighborhood = unidade.has_key?('bairro') ? 
            unidade['bairro'] : 'desconhecido'
            health_unit.phone = unidade.has_key?('fone')? 
            unidade['fone'] : "desconhecido"
            health_unit.latitude = unidade['latitude']
            health_unit.longitude = unidade['longitude']
            health_unit.treatments = []
            health_unit.city = 'Recife'
            health_unit.state = 'PE'
            health_unit.specialties = unidade.has_key?('especialidades') ?
            unidade['especialidades'].split(' ').map {|s| s.delete(',').
                delete('.')}.flatten.uniq - $tags_inuteis : []
            health_unit.save!

            # Subclassificação

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
            unit.health_unit = health_unit
            unit.save!
        end
    else
        $error_loading[resource['name'].to_sym] = resource['id']
    end
end