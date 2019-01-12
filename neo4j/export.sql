USE ginasio;

select * FROM cliente
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cliente.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM atividade_fitness
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/atividade_fitness.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM limitacao_fisica
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/limitacao_fisica.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM localidade
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/localidade.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM maquina
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/maquina.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM plano
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/plano.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM professor
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/professor.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM atividade_fitness_maquina
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/atividade_fitness_maquina.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM cliente_limitacao_fisica
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cliente_limitacao_fisica.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM plano_atividade_fitness
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/plano_atividade_fitness.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM telemovel
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/telemovel.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

