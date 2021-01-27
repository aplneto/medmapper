# frozen_string_literal: true

Dado('que estou na página de Busca') do
  visit('/unidades')
end

Então('os hospitais que atendem aos filtros são mostrados') do
  page.has_content?('hospital')
end
