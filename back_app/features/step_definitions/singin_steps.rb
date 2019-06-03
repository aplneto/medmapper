# frozen_string_literal: true

Dado('que eu estou na página de registro') do
  visit('accounts/sign_up')
end

Quando('eu preencho os campos {string},{string},{string},{string} com dados válidos') do |email, senha, confirmacao_senha, nome|
  fill_in(email, with: 'gcm2@cin.ufpe.br')
  fill_in(senha, with: 'gcm2')
  fill_in(confirmacao_senha, with: 'gcm2')
  fill_in(nome, with: 'Gabriel')
end

Quando('eu pressiono o botão {string}') do |string|
  click_button(string)
end

Quando('eu pressiono a caixa de seleção {string}') do |string|
  find(:css, "#account_terms[value='1']").set(false)
end

Quando('eu não pressiono a caixa de seleção {string}') do |string|
  find(:css, "#account_terms[value='1']").set(false)
end

Entao('sou redirecionado para o perfil usuário') do
  expect(page).to have_current_path(user_access_path(search: 'my_profile'))
end

Quando('eu preencho os campos {string},{string},{string} com dados válidos') do |telefone, sexo, nome|
  fill_in(telefone, with: '983727372')
  fill_in(sexo, with: 'M')
  fill_in(nome, with: 'Gabriel')
end

Entao('o botão {string} permanece desabilitado') do |cadastrar|
  expect(page).to have_button(cadastrar, disabled: true)
end

Quando('eu preencho os campos {string},{string},{string},{string} com senhas diferentes') do |email, senha, confirmacao_senha, nome|
  fill_in(email, with: 'gcm2@cin.ufpe.br')
  fill_in(senha, with: 'gcm2')
  fill_in(confirmacao_senha, with: 'gdyfsuhb')
  fill_in(nome, with: 'Gabriel')
end

Entao('uma mensagem {string} é mostrada') do |string|
  page.has_content?(string)
end

Então('todos os campos devem ser esvaziados') do
end
