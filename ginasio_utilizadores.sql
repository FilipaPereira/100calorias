USE ginasio;
CREATE USER 'SrJoao'@'localhost' IDENTIFIED BY 'Joao1';
CREATE USER 'Professor'@'localhost' IDENTIFIED BY 'Professor2';
CREATE USER 'Cliente'@'localhost' IDENTIFIED BY 'Cliente3';

GRANT SELECT, INSERT, UPDATE ON * TO 'SrJoao'@'localhost';
GRANT SELECT ON Cliente TO 'Professor'@'localhost';
GRANT SELECT ON Limitacao_Fisica TO 'Professor'@'localhost';
GRANT SELECT ON Maquina To 'Professor'@'localhost';
GRANT SELECT ON Atividade_Fitness TO 'Professor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Plano TO 'Professor'@'localhost';
GRANT SELECT ON Atividade_Fitness TO 'Cliente'@'localhost';

FLUSH privileges;
