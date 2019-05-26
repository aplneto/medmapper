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

$modelo_dataset = {
    'Especialidades Odontológicas' => OdontologyUnit,
    'Farmácias da Família' => Pharmacy,
    'Hospitais' => Hospital,
    'Policlínica' => Polyclinic,
    'Serviço de Apoio Diagnóstico' => DiagnosisUnit,
    'Saúde Mental' => MentalHealthUnit,
    '(SPA)' => EmergencyUnit,
    'Unidades Básicas' => BasicHealthUnit,
    'Saúde da Família' => FamilyHealthUnit,
    'Maternidade' => MaternityClinic,
    'Unidades Especializadas' => SpecializedUnit
}

lista_de_unidades = HTTParty.post(api_src+"package_show",
    body: { id: "unidades-de-saude" }.to_json)["result"]

$db_status = { } # Hash global contendo as datas da última atualização do BD

$error_loading = { } # Hash global de recursos não encontrados

lista_de_unidades['resources'].each do |resource|
    unidades_de_saude = HTTParty.post(api_src+"datastore_search",
        body: {resource_id: resource['id']}.to_json)
    unless unidades_de_saude['error'] # Se o JSON de retorno não tiver erros
        $db_status[resource['name'].to_sym] = resource['last_modified']
        unidades_de_saude['result']['records'].each do |unidade|
            puts "#{unidade['unidade']}: #{unidade['cnes']}"
            health_unit = HealthUnit.new
            health_unit.cnes = unidade['cnes']
            health_unit.name = unidade['unidade']
            health_unit.address = unidade['endereco']
            health_unit.neighborhood = unidade['bairro']
            health_unit.phone = unidade['fone']
            health_unit.latitude = unidade['latitude']
            health_unit.longitude = unidade['longitude']
            health_unit.treatments = []
            health_unit.specialties = unidade.has_key?('especialidades') ?
            unidade['especialidades'].split(', ').map {|s| s.split(' ')}
            .flatten : []
            health_unit.save!
            puts HealthUnit.count
        end
    else
        $error_loading[resource['name'].to_sym] = resource['id']
    end
end