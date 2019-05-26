# MedMapper

## Goal Question Metric

### Objetivo

Evitar o desenvolvimento de teste iguais(que estejam duplicados), deixando os **DRY**.

| Objetivo        | Garantir que os teste sejam DRY                           |
| --------------- | --------------------------------------------------------- |
| Analisar        | Os testes desenvolvidos                                   |
| Com o propósito | De avaliar e garantir que não exista duplicação de código |
| Com respeito    | A qualidade dos testes                                    |
| Ponto de vista  | Dos desenvolvedores de testes                             |
| No contextos    | Do Projeto MedMapper                                      |

### Questões

- Os testes quando executados se comportam da mesma forma?
  - Possuir testes repetitivos só irá atrapalhar na refatoração, já que terá que refatorar o mesmo teste mais de uma vez, além de poder ter o mesmo testes com uma versão refatorada e a outra sem estar.

- Quantos testes repetidos temos atualmente?
  - Evitar a repetição de código ajuda na manutenção, uma vez que só precisara corrigir em um único local.

### Métricas

- Quantidade de testes repetidos.
- Quantidade de testes aceitáveis que testam a mesma funcionalidade.

------

### Objetivo

A plataforma **MedMapper** tem como principal objetivo reunir informações em um só lugar, com o intuito de facilitar a busca por unidades de saúde para o tratamento da Zika, e microcefalia em crianças.

| Objetivo        | O1 - Garantir qualidade da informação      |
| --------------- | ------------------------------------------ |
| Analisar        | As informações                             |
| Com o propósito | De facilitar a buscar por informações      |
| Com respeito    | A relevância das informações na plataforma |
| Ponto de vista  | Das mães                                   |
| No contextos    | Da buscar por informações relevantes       |

### Questões

- A informação foi avaliada?
  - Checar a veracidade e a qualidade da informação, irá garantir que a plataforma forneça as informações que é esperada dela, e também passará uma maior credibilidade para o público alvo.
- A informação é útil?
  - Fornecer um informação relevante para o usuário final, irá permitir que ele consiga marca uma consulta de forma mais rápida, e sem desperdício de tempo(seja por ter indo em um local que o atendimento não é prestado e/ou por ter um ponto de atendimento mais perto da sua casa) e dinheiro(ocasionado por viagens perdidas, pelo fato de o local não fornecer o atendimento).
- A busca por informação na plataforma é simples e fácil?
  - Garantir que as informações estejam acessíveis de forma fácil, aumentará chance de o usuário final continuar usando a plataforma.

### Métricas

- Quantidade de informações que descrevam um local de atendimento, seja ele um Hospital, Farmácia da Família, e etc.
- Complexidade de uma busca pelo um local de atendimento.
