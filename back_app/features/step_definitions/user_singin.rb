Dado("que eu estou na página de registro") do
  visit('/singin')
end

Quando("eu preencho os campos {string},{string},{string},{string} com dados válidos") do |string, string2, string3, string4|
  fill_in("E-mail", :with => 'gcm2@cin.ufpe.br')
  fill_in("Senha", :with => 'gcm2')
  fill_in("Confirmação de Senha", :with => 'gcm2')
  fill_in("Nome", :with => 'Gabriel')
end

Quando("eu pressiono o botão {string}") do |string|
  click_button(string)
end

Entao("sou redirecionado para o perfil usuário") do
  expect(page).to have_current_path(user_access_path(search: 'my_profile'))
end

Quando("eu preencho os campos {string},{string},{string} com dados válidos") do |string, string2, string3|
  fill_in("Telefone", :with => '983727372')
  fill_in("Sexo", :with => 'M')
  fill_in("Nome", :with => 'Gabriel')
  
end

Entao("o botão {string} permanece desabilitado") do |string|
  expect(page).to have_button('Cadastrar', disabled: true)
end

Quando("eu preencho os campos {string},{string},{string},{string} com senhas diferentes") do |string, string2, string3, string4|
  fill_in("E-mail", :with => 'gcm2@cin.ufpe.br')
  fill_in("Senha", :with => 'gcm2')
  fill_in("Confirmação de Senha", :with => 'gdyfsuhb')
  fill_in("Nome", :with => 'Gabriel')
end

Entao("uma mensagem {string} é mostrada") do |string|
  page.has_content?(string)
end

Então("todos os campos devem ser esvaziados") do
  
end