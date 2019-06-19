# language: pt

Funcionalidade: Adicionar nova unidade de saúde
  Para adicionar uma nova unidade de saude
  Como administrador
  Quero preencher os dados da unidade de saude


  Cenário: Unidade de saúde cadastrada com sucesso
    Ao realizar o cadastro, é feito o redirecionamento para a página da unidade de saúde.

    Dado que eu estou na página de adicionar nova unidade de saude
    Quando eu preencho "Cnes" com "2752747"
    E eu preencho "Nome da unidade" com "Hospital dos testes"
    E eu preencho "Logradouro" com "Rua adriano rogerio, 560"
    E eu preencho "Bairro" com "Jordão"
    E eu preencho "Telefone" com "desconhecido"
    E eu preencho "Latitude" com "-8.06722"
    E eu preencho "Longitude" com "-8.06722"
    E eu preencho "Descrição" com "Testando funcionamento"
    E eu seleciono a caixa de seleção "Tipo de unidade" com "Hospital"
    E eu seleciono a caixa de seleção "Categoria" com "Público"
    E eu clico no botão "Criar Unidade de Saúde"
    Então sou redirecionado para página da unidade de saude
    
