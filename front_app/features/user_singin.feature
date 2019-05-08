#language: pt
Funcionalidade: Realizar cadastro
  Para ter acesso a plataforma
  Como paciente
  Quero digitar meus dados e me cadastrar na plataforma
  
  Cenário: Cadastro realizado com sucesso
    Ao realizar o cadastro, é feito o redirecionamento para o perfil do usuário do paciente.
    
    Dado que eu estou na página de registro
    Quando eu preencho os campos "e-mail","","","",""