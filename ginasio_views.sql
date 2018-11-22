-- VIEW informações das máquinas utilizadas em cada atividade, bem como a quantidade disponível
DROP VIEW IF EXISTS view_maquinas;

DELIMITER $$
CREATE VIEW view_maquinas
AS
	SELECT A.Nome, M.Tipo, AM.Nr_maquinas AS QtUtilizada, M.Quantidade AS QtDisponivel FROM maquina AS M
    INNER JOIN atividade_fitness_maquina AS AM ON AM.Id_maquina = M.Id_maquina
    INNER JOIN atividade_fitness AS A ON A.Id_atividade = AM.Id_atividade;
$$
DELIMITER ;
    
SELECT * FROM view_maquinas;

-- VIEW limitações físicas de cada aluno 
DROP VIEW IF EXISTS view_limitacao_fisica;

DELIMITER $$
CREATE VIEW view_limitacao_fisica
AS
	SELECT C.Nome, L.Nome AS Limitação FROM Cliente AS C
    INNER JOIN Cliente_Limitacao_Fisica AS CL ON CL.Id_cliente = C.Id_cliente
    INNER JOIN Limitacao_Fisica AS L ON L.Id_limitacao = CL.Id_limitacao
$$
DELIMITER ;
    
SELECT * FROM view_limitacao_fisica;

-- VIEW alunos
DROP VIEW IF EXISTS view_alunos;

DELIMITER $$
CREATE VIEW view_alunos
AS
	SELECT C.Nome, T.Numero, C.Data_nascimento, L.Nome AS Localidade, C.Endereco FROM Cliente AS C
    INNER JOIN Telemovel AS T ON T.Id_cliente = C.Id_cliente
    INNER JOIN Localidade AS L ON L.Id_localidade = C.Id_localidade
$$
DELIMITER ;
    
SELECT * FROM view_alunos;

-- VIEW atividades

DROP VIEW IF EXISTS view_atividades;

DELIMITER $$
CREATE VIEW view_atividades
AS
	SELECT A.Nr_participantes AS NumeroParticipantes, A.Nome AS Atividade,
    A.Duracao AS Duracao, A.Sala AS Sala FROM Atividade_Fitness AS A
    INNER JOIN Professor AS P ON P.Id_professor = A.Id_professor
$$
DELIMITER ;
    
SELECT * FROM view_atividades;

-- VIEW planos
DROP VIEW IF EXISTS view_plano;

DELIMITER $$
CREATE VIEW view_plano
AS
	SELECT P.Id_plano AS Id_Plano, P.preco AS Preco, P.data_inicio AS Data_Inicio,
	PR.Nome AS Professor, C.Nome AS Cliente FROM Plano AS P
    INNER JOIN Professor AS PR ON PR.Id_professor = P.Id_professor
    INNER JOIN Cliente AS C ON C.Id_cliente = P.Id_cliente
$$
DELIMITER ;
    
SELECT * FROM view_plano;

-- VIEW nome professor por nome de atividade
DROP VIEW IF EXISTS view_atividade_professor;

DELIMITER $$
CREATE VIEW view_atividade_professor
AS
	SELECT A.Nome AS Nome_Atividade, P.Nome FROM Atividade_Fitness AS A
    INNER JOIN Professor AS P ON P.Id_professor = A.Id_professor
    ORDER BY Nome_Atividade
$$
DELIMITER ;
    
SELECT * FROM view_atividade_professor;