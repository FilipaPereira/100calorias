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