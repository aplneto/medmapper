# frozen_string_literal: true

Dado('eu possou cadastro') do
end

Dado('eu não possou cadastro') do
end

Quando('eu clicar no link {string}') do |link|
  click_link(link)
end

Quando('eu clico no botão {string}') do |string|
  click_button(string)
end

Então('solicitação de alteração de senha enviada') do
end

Então('não foi possível enviar solicitação de alteração de senha') do
end
