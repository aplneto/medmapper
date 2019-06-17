# frozen_string_literal: true

Dado('que estou na página de Busca') do
  visit('/search')
end

Dado('não preencho o tipo de atendimento') do
  fill_in('atendimento', with: '')
  check('tipo_atendimento')
end

Quando('preencho os campos de filtros') do
  fill_in('atendimento', with: 'Pediatria')
  check('tipo_atendimento')
end

Então('os hospitais que atendem aos filtros são mostrados') do
  page.has_content?('hospital')
end
