-- VIEW informações das máquinas utilizadas em cada atividade, bem como a quantidade disponível
DROP VIEW IF EXISTS view_maquinas;

DELIMITER $$
CREATE VIEW view_maquinas
AS
	SELECT A.Nome, M.Tipo, M.Quantidade FROM maquina AS M
    INNER JOIN atividade_fitness AS A ON A.Id_atividade = M.Id_atividade;
$$
DELIMITER ;
    
SELECT * FROM view_maquinas;

-- VIEW limitações físicas de cada aluno 
DROP VIEW IF EXISTS view_limitacao_fisica;

DELIMITER $$
CREATE VIEW view_limitacao_fisica
AS
	SELECT L.Nome AS Nome_Limitação, C.Nome AS Nome_cliente FROM limitacao_fisica AS L
    INNER JOIN cliente AS C ON C.Id_cliente = L.Id_cliente
$$
DELIMITER ;
    
SELECT * FROM view_limitacao_fisica;