Dado("que eu estou na página de login") do
  visit('/login')
end

Quando("eu preencho {string} com {string}") do |string, string2|
  fill_in("string", :with => string2)
end

Entao("o aplicativo deverá me redireciona para o meu perfil de usuário") do
  expect(page).to have_current_path(user_access_path(search: 'my_profile'))
end

Entao("vejo na tela:") do |string|
  page.has_content?(string)
end