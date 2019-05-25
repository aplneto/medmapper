# Unidades de Saúde

## `pharmacies`

`pharmacies` representará o dataset Farmácias da Família.

`pharmacies(id, cnes, unidade, endereco, bairro, fone, latitude, longitude,
type)`;
 
 ## `hospitals`
 
 `hospitals` representará os datasets Hospitais, Centros de
 Especialidades Odontológicas, Policlinicas, Serviços de Apoio Diagnóstico
 e Terapêutico e Serviços de Proto Atendimento.
 
 `hospitals(id, cnes, unidade, endereco, bairro, fone, latitude, longitude,
 type)`;
 
 ## `basic_health_units`
 
 `basic_health_units` será a tabela que armazenará os postos de saúde. Nesta
 tabela estarão representados os datasets Unidades Saúde da Família (USF) e
 Unidades Bácias de Saúde (UBS).
 
 `baisc_health_units(id, cnes, unidade, endereco, bairro, fone, latitude,
 longitude, type)`;
 
 ## `specialized_units`
 
 `specialized_units` representam as unidades com seviços especializados e
 específicos, incluindo os datasets Saúde Mental, Unidades Especializadas e
 Maternidades.
 
 `specialized_units(id,cnes, unidade, endereco, bairro, telefone, latitude,
 longitude, type)`;
 
 As tabelas acima serão configuradas através de single table inheritance.
 
 Apesar das tabelas compartilharem boa parte dos atributos, a divisão de
 tabelas entre grupos relacionados foi escolhido para dar maior
 escalabilidade ao banco.
 
 ## tipos de dados
 
 ```
 id: integer (auto_incremented), unique, not_null, primary_key;
 cnes: integer(7), unique, not_null;
 unidade: string(80), unique, not_null;
 endereco: string(50), not_null;
 bairro: string(30), not_null;
 fone: string(25), not_null;
 latitude: string(20), unique, not_null;
 longitude: string(20), unique, not_null;
 type: string(model);
 ```
 
 ## Recursos de hospitais
 
 `specialties(hospital_id, specialty)`
 
 # Usuário
 
 Os usuários serão configurados através de multi table inheritance. As
 classes abaixo foram definidas por ordem hierarquica.
 
 `users(id, login, name, sex, encrypted_password, telephone, email,
 birthday)`;
 
 `professionals(user_id, registry, ocupation, description)`
 
 `administrators(user_id)`;
 
 ## Recursos de usuários
 
 Campos de atuação de cada usuário.
 
 `fields(user_id, field)`
 
 Locais de trabalho e atendimento de cada usuário.
 
 `places(user_id, place)`
 
 # Axuliares
 
 ## Comentários
 
 Cada comentário estará relacionado a uma unidade de saúde. A associação
 será polimórfica.
 
 `comments(id, unit_id, unit_ype, user_id, text)`
