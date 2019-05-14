const assert = require('assert');
const { Given, When, Then } = require('cucumber');
const singinPage = require('../../src/singin.js');

Given('que eu estou na página de registro', function (callback) {
  singinPage.visit().then(callback);
});

When('eu preencho os campos {stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes} com dados válidos', function (stringInDoubleQuotes, stringInDoubleQuotes2, stringInDoubleQuotes3, stringInDoubleQuotes4, stringInDoubleQuotes5, stringInDoubleQuotes6) {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
        
When('eu pressiono o botão {stringInDoubleQuotes}', function (stringInDoubleQuotes) {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
        
Then('sou redirecionado para o perfil usuário', function () {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});

Then('uma mensagem {stringInDoubleQuotes} é mostrada', function (stringInDoubleQuotes) {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
        
Then('todos os campos devem ser esvaziados', function () {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
        
When('eu preencho os campos {stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes} com dados válidos', function (stringInDoubleQuotes, stringInDoubleQuotes2, stringInDoubleQuotes3) {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
       
Then('o botão {stringInDoubleQuotes} permanece desabilitado', function (stringInDoubleQuotes) {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
        
When('eu preencho os campos {stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes} com senhas diferentes', function (stringInDoubleQuotes, stringInDoubleQuotes2, stringInDoubleQuotes3, stringInDoubleQuotes4, stringInDoubleQuotes5) {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
        

When('eu preencho os campos {stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes},{stringInDoubleQuotes} com dados válidos', function (stringInDoubleQuotes, stringInDoubleQuotes2, stringInDoubleQuotes3, stringInDoubleQuotes4, stringInDoubleQuotes5) {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
