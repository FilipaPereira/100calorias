-- Inserir um professor
DROP PROCEDURE IF EXISTS inserir_professor;

DELIMITER $$
CREATE PROCEDURE inserir_professor(IN nome VARCHAR(45), IN datanascimento DATE, IN Endereco VARCHAR(45),
		IN telemovel CHAR(9), IN email VARCHAR(45), IN localidade VARCHAR(45))

		BEGIN
		Declare erro Bool default 0;
		declare continue handler for SQLEXCEPTION set erro = 1; 
        start transaction;
        set @A:=0;
		SELECT @A:= L.Id_localidade FROM Localidade AS L where L.Nome = localidade;
		IF(@A = 0) THEN 
		INSERT INTO Localidade(Nome) VALUE (localidade);
		SELECT @A:= L.Id_localidade FROM Localidade AS L where L.Nome = localidade;
		END IF;
		INSERT INTO Professor(Nome, Endereco, Data_nascimento, Telemovel, Email, Estado, Id_localidade)
				VALUE (nome, endereco, datanascimento, telemovel, email, 'Ativo', @A);
        	if erro then ROLLBACK;
    else commit;
    
    END IF;
        
END $$  
DELIMITER ;

CALL inserir_professor('Claudia Cruz', '1993-09-01', 'Rua Penedo da Marca Nº39 4715-603', '928333999', 'claudiacruz@gmail.com', 'Braga');

select *
from Professor;

select *
from Localidade;

-- Inserir um cliente
DROP PROCEDURE IF EXISTS inserir_cliente;

DELIMITER $$
CREATE PROCEDURE inserir_cliente(IN nome VARCHAR(45), IN datanascimento DATE, IN endereco VARCHAR(45),
		IN localidade VARCHAR(45))

		BEGIN
		Declare erro Bool default 0;
		declare continue handler for SQLEXCEPTION set erro = 1; 
        start transaction;
        set @A:=0;
		SELECT @A:= L.Id_localidade FROM Localidade AS L where L.Nome = localidade;
		IF(@A = 0) THEN 
		INSERT INTO Localidade(Nome) VALUE (localidade);
		SELECT @A:= L.Id_localidade FROM Localidade AS L where L.Nome = localidade;
        END IF;
		INSERT INTO Cliente(Nome, Data_nascimento, Endereco, Id_localidade)
				VALUE (nome, datanascimento, endereco, @A);
        	if erro then ROLLBACK;
    else commit;
    
    END IF;
        
END $$  
DELIMITER ;

CALL inserir_cliente('Nadia Santos', '2018-09-12', 'Rua Santa Clar 4830-780', 'Souto');

select *
from Cliente;

-- Inserir um plano
DROP PROCEDURE IF EXISTS inserir_plano;

DELIMITER $$
CREATE PROCEDURE inserir_plano(IN preco DOUBLE, IN datainicio DATE, IN nomeprof VARCHAR(45), 
									IN nome VARCHAR(45))
		BEGIN
		Declare erro Bool default 0;
		declare continue handler for SQLEXCEPTION set erro = 1; 
        start transaction;
		set @A:=0;
		SELECT @A:= P.Id_professor FROM Professor AS P where P.Nome = nomeprof;
		set @B:=0;
		SELECT @B:= C.Id_cliente FROM Cliente AS C where C.Nome = nome;
		INSERT INTO Plano(Preco, Data_inicio, Estado, Id_professor, Id_cliente)
				VALUE (preco, datainicio, 'Ativo', @A, @B);
        	if erro then ROLLBACK;
    else commit;
    
    END IF;
        
END $$  
DELIMITER ;

CALL inserir_plano(35,'2018-02-01','Joana Antunes', 'Ana Maria');

select *
from Plano;