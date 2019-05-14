const assert = require('assert');
const { Given, When, Then } = require('cucumber');
const SearchPage = require('../../src/search.js');

Given('que estou na página de Busca', function (callback) {
  SearchPage.visit().then(callback);
});
       
When('preencho os campos de filtros', function (nome, callback) {
  const filtro = SearchPage.filtro;
  SearchPage.SearchHospitals(nome).then(callback);
});
       
When('nenhum resultado correspondeaos filtros inseridos', function (callback) {
  expect(SearchPage.resultados).notify(callback)
});
       
Then('uma sugestão de um hospital mais proximo dos filtros deve ser mostrada', function () {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
       
Then('os hospitais que atendem aos filtros são mostrados', function () {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
       

Given('não preencho o tipo de atendimento', function () {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
       
When('aperto no botão de pesquisar', function () {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
        
Then('nada acontece e uma pop-up avisa que é preciso informar o tipo de atendimento', function () {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
        
