# frozen_string_literal: true

Dado('que eu estou na página de adicionar nova unidade de saude') do
  visit('unidades/new')
end

Quando('eu seleciono a caixa de seleção {string} com {string}') do |string, string2|
  select(string, from: string2)
end

Então('sou redirecionado para página da unidade de saude') do
  visit('unidades/')
end
