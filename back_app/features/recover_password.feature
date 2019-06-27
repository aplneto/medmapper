# language: pt

Funcionalidade: Recuperar Senha
  Para recuperar senha de login
  Como paciente
  Quero poder retomar o acesso a plataforma

  Cenário: Senha recuperada com sucesso
    Dado que eu estou na página de login
    E eu possou cadastro
    Quando eu clicar no link "Esqueceu a sua senha?"
    E eu preencho "E-mail" com "isac@3virgula14.ga"
    E eu clico no botão "Enviar"
    Então solicitação de alteração de senha enviada

  Cenário: Falha ao tentar recuperar senha, por causa de e-mail errado
    Dado que eu estou na página de login
    E eu possou cadastro
    Quando eu clicar no link "Esqueceu a sua senha?"
    E eu preencho "E-mail" com "paulina@miau"
    E eu clico no botão "Enviar"
    Então não foi possível enviar solicitação de alteração de senha

  Cenário: Falha ao tentar recuperar senha, por causa de e-mail não cadastrado
    Dado que eu estou na página de login
    E eu não possou cadastro
    Quando eu clicar no link "Esqueceu a sua senha?"
    E eu preencho "E-mail" com "contato@isac.br"
    E eu clico no botão "Enviar"
    Então não foi possível enviar solicitação de alteração de senha 

  Cenário: Falha ao tentar recuperar senha, por que o e-mail não foi informado
    Dado que eu estou na página de login
    E eu possou cadastro
    Quando eu clicar no link "Esqueceu a sua senha?"
    E eu preencho "E-mail" com ""
    E eu clico no botão "Enviar"
    Então não foi possível enviar solicitação de alteração de senha
