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

# Funções auxiliares
def new_unit(unit_hash, model)
    model.create(cnes: unit_hash['cnes'], name:unit_hash['unidade'],
    address: unit_hash['endereco'], neighborhood: unit_hash['bairro'],
    latitude: unit_hash['latitude'], longitude: unit_hash['longitude'],
    phone: unit_hash['fone'])
end

def find_unit(name)
    $modelo_dataset.each do |trecho, modelo|
        if name.include? trecho
            return modelo
        end
    end
    return nil
end


$modelo_dataset = {
    'Especialidades Odontológicas' => OdontologyUnit,
    'Farmácias da Família' => Pharmacy,
    'Hospitais' => Hospital,
    'Policlínica' => Polyclinc,
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
            modelo = find_unit resource['name']
            unless modelo.nil?
                new_unit(unidade, modelo)
            end
        end
    else
        $error_loading[resource['name'].to_sym] = resource['id']
    end
end