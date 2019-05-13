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

$db_status = { } # Hash global contendo as datas da última atualização do BD

$error_loading = { } # Hash global de recursos não encontrados

counting = { } # CONTROLE

lista_de_unidades['resources'].each do |resource|
    $db_status[resource['name'].to_sym] = resource['last_modified']
    unidades_de_saude = HTTParty.post(api_src+"datastore_search",
        body: {resource_id: resource['id']}.to_json)
    unless unidades_de_saude['error'] # Se o JSON de retorno não tiver erros
        count = 0 # CONTROLE
        unidades_de_saude['result']['records'].each do |unidade|
            count += 1 # CONTROLE
            nome = unidade['unidade']
            telefone = unidade['fone']
            endereco = unidade['endereco']
            bairro = unidade['bairro']
            latitude = unidade['latitude']
            longitude = unidade['longitude']
            regiao = unidade['rpa']
            micro_regiao  = unidade['micro_regiao']
            natureza = unidade['natureza'] ? unidade['natureza']: 'NÃO SE APLICA'
            espcialidades = unidade['especialidades']? unidade['especialidades']: 'NÃO SE APLICA'
        end
        counting[resource['name'].to_sym] = count
    else
        $error_loading[resource['name'].to_sym] = resource['id']
    end
end