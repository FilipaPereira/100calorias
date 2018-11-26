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

GRANT EXECUTE ON PROCEDURE clientes_localidade TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE inserir_professor TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE arquivar_professor TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE inserir_cliente TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE alterarQt_maquinaAtividade TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE diminuirQt_maquina TO 'Professor'@'localhost';
GRANT EXECUTE ON PROCEDURE aumentarQt_maquina TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE arquivar_plano TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE inserir_telemovel TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE inserir_limitacao TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE inserir_atividade_plano TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE inserir_plano TO 'SrJoao'@'localhost';
GRANT EXECUTE ON PROCEDURE arquivar_plano TO 'SrJoao'@'localhost';


GRANT EXECUTE ON PROCEDURE inserir_atividade_plano TO 'Professor'@'localhost';
GRANT EXECUTE ON PROCEDURE inserir_plano TO 'Professor'@'localhost';
GRANT EXECUTE ON PROCEDURE arquivar_plano TO 'Professor'@'localhost';


GRANT SELECT ON view_maquinas TO 'SrJoao' @'localhost';
GRANT SELECT ON view_maquinas TO 'Professor' @'localhost';
GRANT SELECT ON view_limitacao_fisica TO 'SrJoao' @'localhost';
GRANT SELECT ON view_limitacao_fisica TO 'Professor' @'localhost';
GRANT SELECT ON view_alunos TO 'SrJoao' @'localhost';
GRANT SELECT ON view_alunos TO 'Professor' @'localhost';
GRANT SELECT ON view_atividades TO 'SrJoao' @'localhost';
GRANT SELECT ON view_atividades TO 'Professor' @'localhost';
GRANT SELECT ON view_atividades TO 'Cliente' @'localhost';
GRANT SELECT ON view_plano TO 'SrJoao' @'localhost';
GRANT SELECT ON view_plano TO 'Professor' @'localhost';
GRANT SELECT ON view_atividade_professor TO 'SrJoao' @'localhost';


FLUSH privileges;

