Dado("que eu estou na página de adicionar nova unidade de saude") do
  visit('unidades/new')
end

Quando("eu preencho {string} com {string}") do |string, string2|
  fill_in(string, with: string2)
end

Quando("eu seleciono a caixa de seleção {string} com {string}") do |string, string2|
  select('string2', :from => 'string')
end

Quando("eu clico no botão {string}") do |string|
  click_button('string')
end

Então("sou redirecionado para página da unidade de saude") do
  visit('unidades/')
end