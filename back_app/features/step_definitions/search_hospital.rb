Dado("que estou na página de Busca") do
  visit('/search')
end

Quando("preencho os campos de filtros") do
  fill_in('atendimento', :with => 'Pediatria')
  check('tipo_atendimento')
end

Entao("os hospitais que atendem aos filtros são mostrados") do
  page.has_content?('hospital')
end

Dado("não preencho o tipo de atendimento") do
  fill_in('atendimento', :with => '')
  check('tipo_atendimento')
end

Quando("aperto no botão de pesquisar") do
  click_button('Pesquisar')
end

Então("é visto na tela: {string}") do |string|
  page.has_content?(string)
end