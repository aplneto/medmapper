# Medmapper

## Goal Question Metric

### Objetivo

Evitar o desenvolvimento de teste iguais(que estejam duplicados), deixando os **DRY**.

| Objetivo        | Garantir que os teste sejam DRY                           |
| --------------- | --------------------------------------------------------- |
| Analisar        | Os testes desenvolvidos                                   |
| Com o propósito | De avaliar e garantir que não exista duplicação de código |
| Com respeito    | A qualidade dos testes                                    |
| Ponto de vista  | Dos desenvolvedores de testes                             |
| No contextos    | Do Projeto Medmapper                                      |

### Questões

- Os testes quando executados se comportam da mesma forma?
  - Possuir testes repetitivos só irá atrapalhar na refatoração, já que terá que refatorar o mesmo teste mais de uma vez, além de poder ter o mesmo testes com uma versão refatorada e a outra sem estar.

- Quantos testes repetidos temos atualmente?
  - Evitar a repetição de código ajuda na manutenção, uma vez que só precisara corrigir em um único local.

### Métricas

- Quantidade de testes repetidos.
- Quantidade de testes aceitáveis que testam a mesma funcionalidade.