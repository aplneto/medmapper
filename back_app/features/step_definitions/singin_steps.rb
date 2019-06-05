# frozen_string_literal: true

Dado('que eu estou na página de registro') do
  visit('accounts/sign_up')
end

Quando('eu pressiono a caixa de seleção {string}') do |caixa_de_selecao|
  find(:css, "##{caixa_de_selecao}[value='1']").set(false)
end

Quando('eu não pressiono a caixa de seleção {string}') do |caixa_de_selecao|
  find(:css, "##{caixa_de_selecao}[value='1']").set(false)
end

Quando('eu preencho os campos {string} com {string}, {string} com {string}, {string} com {string} sendo todos dados válidos') do |string, string2, string3, string4, string5, string6|
  fill_in(string, with: string2)
  fill_in(string3, with: string4)
  fill_in(string5, with: string6)
end

Quando('eu preencho os campos {string} com {string}, {string} com {string}, {string} com {string} com dados inválidos') do |string, string2, string3, string4, string5, string6|
  fill_in(string, with: string2)
  fill_in(string3, with: string4)
  fill_in(string5, with: string6)
end

Então('todos os campos devem ser esvaziados') do
end

Então('sou redirecionado para o perfil usuário') do
  expect(page).to have_current_path(user_access_path(search: 'my_profile'))
end

Então('o botão {string} permanece desabilitado') do |cadastrar|
  expect(page).to have_button(cadastrar, disabled: true)
end
