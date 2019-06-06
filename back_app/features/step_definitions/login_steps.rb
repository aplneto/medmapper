# frozen_string_literal: true

Dado('que eu estou na página de login') do
  visit('accounts/sign_in')
end

Quando('eu preencho {string} com {string}') do |string, string2|
  fill_in(string, with: string2)
end

Então('vejo na tela:') do |string|
  page.has_content?(string)
end
