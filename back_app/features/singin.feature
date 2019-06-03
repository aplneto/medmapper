#language: pt
Funcionalidade: Realizar cadastro
  Para ter acesso a plataforma
  Como paciente
  Quero digitar meus dados e me cadastrar na plataforma

  Cenário: Cadastro realizado com sucesso
    Ao realizar o cadastro, é feito o redirecionamento para o perfil do usuário do paciente.

    Dado que eu estou na página de registro
    Quando eu preencho os campos "E-mail","Senha","Confirmação de senha","Nome" com dados válidos
    E eu pressiono a caixa de seleção "Aceitar termos e condições"
    E eu pressiono o botão "Cadastrar"
    Então sou redirecionado para o perfil usuário

  Cenário: Cadastro com campos não obrigatórios em branco
    Ao realizar o cadastro, mesmo que o campos não obrigatórios estejam em 
    branco, é feito o redirecionamento para o perfil do usuário

    Dado que eu estou na página de registro
    Quando eu preencho os campos "E-mail","Senha","Confirmação de senha","Nome" com dados válidos
    E eu pressiono a caixa de seleção "Aceitar termos e condições"
    E eu pressiono o botão "Cadastrar"
    Então sou redirecionado para o perfil usuário

  Cenário: Cadastro com campos obrigatórios em branco
    Ao realizar o cadastro, com campos obrigatórios estejam em branco, o botão "Cadastrar" é bloqueado

    Dado que eu estou na página de registro
    Quando eu preencho os campos "Telefone","Sexo","Nome" com dados válidos
    Então o botão "Cadastrar" permanece desabilitado

  Cenário: Cadastro com senhas diferentes
    Ao realizar o cadastro, com senhas diferentes, a mensagem 
    "Senhas não coincidem" é mostrada

    Dado que eu estou na página de registro
    Quando eu preencho os campos "E-mail","Senha","Confirmação de senha","Nome" com senhas diferentes
    E eu pressiono a caixa de seleção "Aceitar termos e condições"
    E eu pressiono o botão "Cadastrar"
    Então uma mensagem "Senhas não coincidem" é mostrada

  Cenário: Cadastro com sem aceitar termos e condições
    Ao realizar o cadastro, sem aceitar termos e condições, a mensagem "Termos e Condições Você deve concordar com os nossos termos para continuar" é mostrada

    Dado que eu estou na página de registro
    Quando eu preencho os campos "E-mail","Senha","Confirmação de senha","Nome" com dados válidos
    E eu não pressiono a caixa de seleção "Aceitar termos e condições"
    E eu pressiono o botão "Cadastrar"
    Então vejo na tela:
      """
      Termos e Condições Você deve concordar com os nossos termos para continuar
      """

  Cenário: Registro Cancelado
    Ao cancelar o cadastro, todos os campos são esvaziados

    Dado que eu estou na página de registro
    Quando eu preencho os campos "E-mail","Senha","Confirmação de senha","Nome" com senhas diferentes
    E eu pressiono o botão "Cancelar"
    Então todos os campos devem ser esvaziados