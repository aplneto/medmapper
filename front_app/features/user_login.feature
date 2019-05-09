# language: pt

Funcionalidade: Realizar login
  Para ter acesso a plataforma
  Como paciente
  Quero digitar minhas credenciais e ter meu login autorizado

  Cenário: Login realizado com sucesso
    Ao realizar o login, é feito o redirecionamento para o perfil do usuário do paciente.

    Dado um usuário "its" com a senha "Med@if977"
    E eu estou na página de login
    Quando eu preencho "Usuário" com "its"
    E eu preencho "Senha" com "Med@if977"
    Então o aplicativo deverá me redireciona para o meu perfil de usuário

  Cenário: Falha no Login por causa da senha errada
    Ao  tentar realizar o login, é mostrada a mensagem de falha o tentar realizar login.

    Dado um usuário "its" com a senha "Med@if977"
    E eu estou na página de login
    Quando eu preencho "Usuário" com "its"
    E eu preencho "Senha" com "gfsahwqhie"
    Então vejo na tela:
      """
      Usuário e/ou senhas estão incorretos, tente novamente
      """

  Cenário: Falha no Login por causa do login esta errado
    Ao  tentar realizar o login, é mostrada a mensagem de falha o tentar realizar login.

    Dado um usuário "its" com a senha "Med@if977"
    E eu estou na página de login
    Quando eu preencho "Usuário" com "isac"
    E eu preencho "Senha" com "Med@if977"
    Então vejo na tela:
      """
      Usuário e/ou senhas estão incorretos, tente novamente
      """

  Cenário: Falha no Login por causa de login e senha estão errados
    Ao  tentar realizar o login, é mostrada a mensagem de falha ao tentar realizar login.

    Dado um usuário "its" com a senha "Med@if977"
    E eu estou na página de login
    Quando eu preencho "Usuário" com "isac"
    E eu preencho "Senha" com "fjahiekfdfas"
    Então vejo na tela:
      """
      Usuário e/ou senhas estão incorretos, tente novamente
      """

  Cenário: Falha no Login por causa de senha em branco
    Ao  tentar realizar o login, é mostrada a mensagem de falha o tentar realizar login.

    Dado um usuário "vinicius" com a senha "if977"
    E eu estou na página de login
    Quando eu preencho "Usuário" com "vinicius"
    E eu preencho "Senha" com ""
    Então vejo na tela:
      """
      Usuário e/ou senhas estão incorretos, tente novamente
      """

  Cenário: Falha no Login por causa de login em branco
    Ao  tentar realizar o login, é mostrada a mensagem de falha o tentar realizar login.

    Dado um usuário "its" com a senha "Med@if977"
    E eu estou na página de login
    Quando eu preencho "Usuário" com ""
    E eu preencho "Senha" com "fjahiekfdfas"
    Então vejo na tela:
      """
      Usuário e/ou senhas estão incorretos, tente novamente
      """

  Cenário: Falha no Login por causa de login e senha estão em branco
    Ao  tentar realizar o login, é mostrada a mensagem de falha o tentar realizar login.

    Dado um usuário "its" com a senha "Med@if977"
    E eu estou na página de login
    Quando eu preencho "Usuário" com ""
    E eu preencho "Senha" com ""
    Então vejo na tela:
      """
      Usuário e/ou senhas estão incorretos, tente novamente
      """
