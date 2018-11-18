-- Conhecer a sala onde a atividade é lecionada
SELECT A.sala FROM atividade_fitness AS A
WHERE A.Id_atividade = 7;

-- Consultar os planos realizados por um dado cliente
DROP PROCEDURE IF EXISTS planos_cliente

DELIMITER $$
CREATE PROCEDURE planos_cliente (nome_cliente VARCHAR(45)) 
BEGIN
SELECT P.Id_plano, P.Preco, P.data_inicio FROM cliente AS C
INNER JOIN plano AS P ON P.Id_cliente = C.Id_cliente
WHERE C.Nome = nome_cliente;
END $$
DELIMITER ;

CALL planos_cliente ('Ana Maria');

-- Identificar o Top 3 de clientes com maior número de planos associados
SELECT count(P.Id_plano) AS Nr_planos, P.Id_cliente FROM plano AS P
GROUP BY P.Id_cliente
ORDER BY Nr_planos DESC
LIMIT 3;

-- Obter o Top 3 das atividades com mais alunos inscritos
SELECT count(P.Id_plano) AS Nr_inscritos, A.Nome FROM plano AS P
INNER JOIN plano_atividade_fitness AS PA ON PA.Id_plano = P.Id_plano
INNER JOIN atividade_fitness AS A ON A.Id_atividade = PA.Id_atividade
GROUP BY A.Id_atividade 
ORDER BY Nr_inscritos DESC
LIMIT 3;

-- Identificar o professor que elaborou mais planos
SELECT count(P.Id_plano) AS Nr_planos, Id_professor FROM plano AS P
GROUP BY P.Id_professor
ORDER BY Nr_planos DESC
LIMIT 1;

-- Verificar o Top 3 dos alunos com maior número de aulas de uma determinada atividade fitness
SELECT sum(PA.Nr_aulas) AS Nr_aulas, C.Nome FROM plano_atividade_fitness AS PA
INNER JOIN plano AS P ON P.Id_plano = PA.Id_plano
INNER JOIN atividade_fitness AS A ON A.Id_atividade = PA.Id_atividade
INNER JOIN cliente AS C ON C.Id_cliente = P.Id_cliente
WHERE A.Nome = 'Run'
GROUP BY P.Id_cliente
ORDER BY Nr_aulas DESC
LIMIT 3;

-- As atividades fitness dadas por um professor 
DROP PROCEDURE IF EXISTS atividades_professor;
DELIMITER $$
CREATE PROCEDURE atividades_professor (nome_professor VARCHAR(45)) 
BEGIN
SELECT A.Nome FROM professor AS P
INNER JOIN atividade_fitness AS A ON A.Id_professor = P.Id_professor
WHERE P.Nome = nome_professor;
END $$
DELIMITER ;

CALL atividades_professor ('Andre Gonçalves');


-- Devolver os planos elaborados por um professor ordenados pelo preço
DROP PROCEDURE IF EXISTS planos_professor;

DELIMITER $$
CREATE PROCEDURE planos_professor (nome_professor VARCHAR(45)) 
BEGIN
SELECT PL.preco, C.Nome FROM professor AS P
INNER JOIN plano AS PL ON PL.Id_professor = P.Id_professor
INNER JOIN cliente AS C ON C.Id_cliente = PL.Id_cliente
WHERE P.Nome = nome_professor
ORDER BY PL.preco DESC;
END $$
DELIMITER ;

CALL planos_professor ('Andre Gonçalves');

