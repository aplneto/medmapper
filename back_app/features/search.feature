#language: pt

Funcionalidade: Procurar Hospital
  Para saber qual hospital devo ir
  Como paciente
  Quero digitar as informações do atendimento, e ver os hospitais mais proximos

  Cenário: Busca com resultados
    Ao fazer a busca, os hospitais referentes aos filtros informados são mostrados

    Dado que estou na página de Busca
    Quando eu preencho "Pesquisar Hospitais" com "imip"
    E eu clico no botão "Pesquisar"
    Então os hospitais que atendem aos filtros são mostrados

  Cenário: Busca sem informar o tipo de atendimento
    Ao fazer a busca sem informar o tipo de atendimento, é exigido ao usuário todos os hospitais, como se não tivesse sido feita uma busca

    Dado que estou na página de Busca
    E eu preencho "Pesquisar Hospitais" com ""
    Quando eu clico no botão "Pesquisar"
    Então os hospitais que atendem aos filtros são mostrados
