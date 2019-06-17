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

Então('todos os campos devem ser esvaziados') do
end

Então('o botão {string} permanece desabilitado') do |cadastrar|
  expect(page).to have_button(cadastrar, disabled: true)
end
