#language: pt

Funcionalidade: Procurar Hospital
  Para saber qual hospital devo ir
  Como paciente
  Quero digitar as informações do atendimento, e ver os hospitais mais proximos

  Cenário: Busca com resultados
    Ao fazer a busca, os hospitais referentes aos filtros informados são mostrados

    Dado que estou na página de Busca
    Quando preencho os campos de filtros
    Então os hospitais que atendem aos filtros são mostrados

  Cenário: Busca sem informar o tipo de atendimento
    Ao fazer a busca sem informar o tipo de atendimento, é exigido ao usuário essa informação

    Dado que estou na página de Busca
    E não preencho o tipo de atendimento
    Quando eu clico no botão "Pesquisar"
    Então vejo na tela:
      """
      É preciso informar o tipo de atendimento
      """