#language: pt
Funcionalidade: Realizar cadastro
  Para ter acesso a plataforma
  Como paciente
  Quero digitar meus dados e me cadastrar na plataforma

  Cenário: Cadastro realizado com sucesso
    Ao realizar o cadastro, é feito o redirecionamento para o perfil do usuário do paciente.

    Dado que eu estou na página de registro
    Quando eu preencho "E-mail" com "gcm2@cin.ufpe.br"
    E eu preencho "Senha" com "gcm2tmrp"
    E eu preencho "Confirmar senha" com "gcm2tmrp"
    E eu pressiono a caixa de seleção "account_terms"
    E eu clico no botão "Sign up"
    Então sou redirecionado para página inicial

  Cenário: Cadastro com todos os campos obrigatórios em branco
    Ao tentar realizar o cadastro, com campos obrigatórios estejam em branco, é exibida uma mensagem para preencher os campos obrigatórios

    Dado que eu estou na página de registro
    Quando eu preencho "E-mail" com ""
    E eu preencho "Senha" com ""
    E eu preencho "Confirmar senha" com ""
    Então vejo na tela:
      """
      Email não pode estar em branco
      Password não pode estar em branco
      Termos e Condições Você deve concordar com os nossos termos para continuar
      """

  Cenário: Cadastro com senhas diferentes
    Ao realizar o cadastro, com senhas diferentes, a mensagem "Senhas não coincidem" é mostrada

    Dado que eu estou na página de registro
    Quando eu preencho "E-mail" com "mary@odonto.br"
    E eu preencho "Senha" com "gderafrwb"
    E eu preencho "Confirmar senha" com "uyevjecert"
    E eu pressiono a caixa de seleção "account_terms"
    E eu clico no botão "Sign up"
    Então vejo na tela:
      """
      Senhas não coincidem
      """

  Cenário: Cadastro sem aceitar termos e condições
    Ao realizar o cadastro, sem aceitar termos e condições, a mensagem "Termos e Condições Você deve concordar com os nossos termos para continuar" é mostrada

    Dado que eu estou na página de registro
    Quando eu preencho "E-mail" com "gcm2@cin.ufpe.br"
    E eu preencho "Senha" com "gcm2gcm2"
    E eu preencho "Confirmar senha" com "gcm2gcm2"
    E eu não pressiono a caixa de seleção "account_terms"
    E eu clico no botão "Sign up"
    Então vejo na tela:
      """
      Termos e Condições Você deve concordar com os nossos termos para continuar
      """

  Cenário: Registro Cancelado
    Ao cancelar o cadastro, todos os campos são esvaziados

    Dado que eu estou na página de registro
    Quando eu clico no botão "Cancelar"
    Então todos os campos devem ser esvaziados
