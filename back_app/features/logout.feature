# language: pt

Funcionalidade: Realizar log out
  Para encerrar sessão
  Como paciente
  Quero apertar o botão de Sair

  Cenário: Cadastro realizado com sucesso
    Ao realizar logoff, é feito o redirecionamento para página inicial.

    Dado que eu estou com minha conta conectada
    Quando eu clico no botão "Sair"
    Então sou redirecionado para página inicial
