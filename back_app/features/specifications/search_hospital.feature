#language: pt

Funcionalidade: Procurar Hospital
  Para saber qual hospital devo ir
  Como paciente
  Quero digitar as informações do atendimento, e ver os hospitais mais proximos
  
  Cenário: Busca sem resultados
    Ao fazer a busca, nenhum hospital corresponde aos filtros informados
    
    Dado que estou na página de busca
    Quando preencho os campos de filtros
    E nenhum resultado correspondeaos filtros inseridos
    Então uma sugestão de um hospital mais proximo dos filtros deve ser mostrada
    
  Cenário: Busca com resultados
    Ao fazer a busca, os hospitais referentes aos filtros informados são mostrados
    
    Dado que estou na página de Busca
    Quando preencho os campos de filtros
    Então os hospitais que atendem aos filtros são mostrados
    
  Cenário: Busca sem informar o tipo de atendimento
    Ao fazer a busca sem informar o tipo de atendimento, é exigido ao usuário essa informação
  
    Dado que estou na página de Busca
    E não preencho o tipo de atendimento
    Quando aperto no botão de pesquisar
    Então nada acontece e uma pop-up avisa que é preciso informar o tipo de atendimento
    
  