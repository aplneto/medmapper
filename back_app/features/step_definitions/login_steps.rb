# frozen_string_literal: true

Dado('que eu estou na página de login') do
  visit('accounts/sign_in')
end

Quando('eu preencho {string} com {string}') do |string, string2|
  fill_in(string, with: string2)
end

Quando('eu clicar no botão {string}') do |string|
  click_button(string)
end

Então('o aplicativo deverá me redireciona para o meu perfil de usuário') do
  expect(page).to have_current_path(user_access_path(search: 'my_profile'))
end

Então('vejo na tela:') do |string|
  page.has_content?(string)
end
