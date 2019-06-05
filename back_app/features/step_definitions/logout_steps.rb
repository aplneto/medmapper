# frozen_string_literal: true

Dado('que eu estou com minha conta conectada') do
end

Então('sou redirecionado para página inicial') do
  expect(page).to have_current_path(user_access_path(search: '/'))
end
