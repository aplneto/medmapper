# frozen_string_literal: true

Dado('que eu estou na página de registro') do
  visit('accounts/sign_up')
end

Quando('eu pressiono a caixa de seleção {string}') do |caixa_de_selecao|
  check(caixa_de_selecao)
end

Quando('eu não pressiono a caixa de seleção {string}') do |caixa_de_selecao|
  uncheck(caixa_de_selecao)
end

Então('todos os campos devem ser esvaziados') do
end

Então('o botão {string} permanece desabilitado') do |cadastrar|
  expect(page).to have_button(cadastrar, disabled: true)
end
