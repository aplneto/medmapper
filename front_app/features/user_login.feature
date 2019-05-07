# language: pt

Funcionalidade: Realizar login
  Para ter acesso a plataforma
  Como paciente
  Quero digitar minhas credenciais e ter meu login autorizado

	Cenário: Login realizado com sucesso
    Ao realizar o login, é feito o redirecionamento para o perfil do usuário do paciente.

		Dado um usuário "its" com a senha "Med@if977"
    E eu estou na página de login
    E eu preencho “Usuário” com “its”
    E eu preencho “Senha” com "Med@if977"
		Então o aplicativo devera me redireciona para o meu perfil de usuário

	Cenário: Falha no Login por causa da senha errada
		Ao  tentar realizar o login, é mostrada a mensagem de falha o tentar realizar login.

		
		Dado um usuário "its" com a senha "Med@if977"
    E eu estou na página de login
    E eu preencho “Usuário” com “its”
    E eu preencho “Senha” com "gfsahwqhie"
		Então vejo na tela:
			"""
			Usuário e/ou senhas estão incorretos, tente novamente
			"""

  Cenário: Falha no Login por causa da login errado
		Ao  tentar realizar o login, é mostrada a mensagem de falha o tentar realizar login.

		
	  Dado um usuário "its" com a senha "Med@if977"
    E eu estou na página de login
    E eu preencho “Usuário” com “isac”
    E eu preencho “Senha” com "Med@if977"
		Então vejo na tela:
			"""
			Usuário e/ou senhas estão incorretos, tente novamente
			"""

    Cenário: Falha no Login por causa de login e senha errados
		  Ao  tentar realizar o login, é mostrada a mensagem de falha o tentar realizar login.

		
		  Dado um usuário "its" com a senha "Med@if977"
      E eu estou na página de login
      E eu preencho “Usuário” com “isac”
      E eu preencho “Senha” com "fjahiekfdfas"
  		Então vejo na tela:
  			"""
  			Usuário e/ou senhas estão incorretos, tente novamente
  			"""
