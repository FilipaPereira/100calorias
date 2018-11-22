-- Obter o numero total de clientes do ginasio
SELECT count(C.Id_cliente) AS Nr_clientes FROM Cliente AS C;

-- Verificar o numero de professores que lecionam no ginasio
SELECT count(P.Id_professor) AS Nr_professores FROM Professor AS P;

-- Saber que professor leciona certa atividade fisica
SELECT P.nome AS Nome_Professor FROM Professor AS P
INNER JOIN Atividade_Fitness AS A ON A.Id_professor = P.Id_Professor
WHERE A.nome = 'Step';

-- Conhecer a sala onde a atividade é lecionada
SELECT A.sala FROM Atividade_Fitness AS A
WHERE A.Id_atividade = 7;

-- Consultar os planos realizados por um dado cliente
DROP PROCEDURE IF EXISTS planos_cliente

DELIMITER $$
CREATE PROCEDURE planos_cliente (nome_cliente VARCHAR(45)) 
BEGIN
SELECT P.Id_plano, P.Preco, P.data_inicio FROM Cliente AS C
INNER JOIN Plano AS P ON P.Id_cliente = C.Id_cliente
WHERE C.Nome = nome_cliente;
END $$
DELIMITER ;

CALL planos_cliente ('Ana Maria');

-- Identificar o Top 3 de clientes com maior número de planos associados
SELECT count(P.Id_plano) AS Nr_planos, P.Id_cliente FROM Plano AS P
GROUP BY P.Id_cliente
ORDER BY Nr_planos DESC
LIMIT 3;

-- Obter o Top 3 das atividades com mais alunos inscritos
SELECT count(P.Id_plano) AS Nr_inscritos, A.Nome FROM Plano AS P
INNER JOIN Plano_Atividade_Fitness AS PA ON PA.Id_plano = P.Id_plano
INNER JOIN Atividade_Fitness AS A ON A.Id_atividade = PA.Id_atividade
GROUP BY A.Id_atividade 
ORDER BY Nr_inscritos DESC
LIMIT 3;

-- Identificar os planos elaborados por cada professor 
SELECT count(P.Id_plano) AS Nr_planos, Id_professor FROM Plano AS P
GROUP BY P.Id_professor
ORDER BY Nr_planos DESC;

-- Reconhecer o professor que lecionou mais atividades
SELECT count(A.Id_professor) AS Nr_atividades, P.Nome FROM Atividade_Fitness AS A
INNER JOIN Professor AS P ON P.Id_professor = A.Id_professor
GROUP BY A.Id_professor
ORDER BY Nr_atividades DESC
LIMIT 1;

-- Atividade fitness mais frequentada por um determinado aluno
DROP PROCEDURE IF EXISTS atividade_frequentada
DELIMITER $$
CREATE PROCEDURE atividade_frequentada (nome_aluno VARCHAR(45)) 
BEGIN
SELECT C.Nome, sum(PA.Nr_aulas) AS Nr_aulas, A.Nome AS Atividade FROM Cliente AS C
INNER JOIN Plano AS P ON P.Id_cliente = C.Id_cliente
INNER JOIN Plano_Atividade_Fitness AS PA ON PA.Id_plano = P.Id_plano
INNER JOIN Atividade_Fitness AS A ON PA.Id_atividade = A.Id_atividade
WHERE C.Nome = nome_aluno
GROUP BY A.Nome, PA.Nr_aulas
ORDER BY PA.Nr_aulas DESC
LIMIT 1;
END $$
DELIMITER ;

CALL atividade_frequentada('Carolina Pinto');


-- Tipo e quantidade de maquinas em cada atividade 
SELECT A.Nome, sum(M.Quantidade) AS QuantidadeMaquina, M.Tipo AS TipoMaquina 
FROM Maquina AS M
INNER JOIN Atividade_Fitness_Maquina AS AM ON AM.Id_maquina = M.Id_maquina
INNER JOIN Atividade_Fitness AS A ON A.Id_atividade = AM.Id_atividade
GROUP BY A.Nome, M.Tipo, M.Quantidade;

-- Verificar o Top 3 dos alunos com maior número de aulas de uma determinada atividade fitness
SELECT sum(PA.Nr_aulas) AS Nr_aulas, C.Nome FROM Plano_Atividade_Fitness AS PA
INNER JOIN Plano AS P ON P.Id_plano = PA.Id_plano
INNER JOIN Atividade_Fitness AS A ON A.Id_atividade = PA.Id_atividade
INNER JOIN Cliente AS C ON C.Id_cliente = P.Id_cliente
WHERE A.Nome = 'Run'
GROUP BY P.Id_cliente
ORDER BY Nr_aulas DESC
LIMIT 3;

-- As atividades fitness dadas por um professor 
DROP PROCEDURE IF EXISTS atividades_professor;
DELIMITER $$
CREATE PROCEDURE atividades_professor (nome_professor VARCHAR(45)) 
BEGIN
SELECT A.Nome FROM Professor AS P
INNER JOIN Atividade_Fitness AS A ON A.Id_professor = P.Id_professor
WHERE P.Nome = nome_professor;
END $$
DELIMITER ;

CALL atividades_professor ('Andre Gonçalves');

-- Devolver os planos elaborados por um professor ordenados pelo preço
DROP PROCEDURE IF EXISTS planos_professor;

DELIMITER $$
CREATE PROCEDURE planos_professor (nome_professor VARCHAR(45)) 
BEGIN
SELECT PL.preco, C.Nome FROM Professor AS P
INNER JOIN Plano AS PL ON PL.Id_professor = P.Id_professor
INNER JOIN Cliente AS C ON C.Id_cliente = PL.Id_cliente
WHERE P.Nome = nome_professor
ORDER BY PL.preco DESC;
END $$
DELIMITER ;

CALL planos_professor ('Andre Gonçalves');

-- Nomes e contactos dos alunos que frequentam certa atividade
DROP PROCEDURE IF EXISTS alunos_atividade
DELIMITER $$
CREATE PROCEDURE alunos_atividade (nome_atividade VARCHAR(45)) 
BEGIN
SELECT C.Nome, C.Email, C.Telemovel FROM Atividade_Fitness AS A
INNER JOIN Plano_Atividade_Fitness AS PA ON PA.Id_atividade = A.Id_atividade
INNER JOIN Plano AS P ON P.Id_plano = PA.Id_plano
INNER JOIN Cliente AS C ON C.Id_cliente = P.Id_cliente
WHERE A.Nome = nome_atividade;
END $$
DELIMITER ;

CALL alunos_atividade('Cycling');