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

-- Inserir um telemovel
DROP PROCEDURE IF EXISTS inserir_telemovel;

DELIMITER $$
CREATE PROCEDURE inserir_telemovel(IN tipo VARCHAR(45), IN numero CHAR(9), IN nome VARCHAR(45))

		BEGIN
		Declare erro Bool default 0;
		declare continue handler for SQLEXCEPTION set erro = 1; 
        start transaction;
        set @A:=0;
		SELECT @A:= C.Id_cliente FROM Cliente AS C where C.Nome = nome;
		INSERT INTO Telemovel(Tipo, Numero, Id_cliente)
				VALUE (tipo, numero, @A);
        	if erro then ROLLBACK;
    else commit;
    
    END IF;
        
END $$  
DELIMITER ;

CALL inserir_telemovel('Pessoal', '968471446', 'Ana Maria');

select *
from telemovel;

-- Inserir limitação física
DROP PROCEDURE IF EXISTS inserir_limitacao;

DELIMITER $$
CREATE PROCEDURE inserir_limitacao(IN nomeLimitacao VARCHAR(45), IN nomeCliente VARCHAR(45))
		BEGIN
		Declare erro Bool default 0;
		declare continue handler for SQLEXCEPTION set erro = 1; 
		start transaction;
        set @A:=0;
        SELECT @A:= L.Id_Limitacao FROM Limitacao_fisica AS L where L.Nome = nomeLimitacao;
		IF(@A = 0) THEN 
		INSERT INTO Limitacao_Fisica(Nome)
				VALUE (nomeLimitacao);
		SELECT @A:= L.Id_Limitacao FROM Limitacao_fisica AS L where L.Nome = nomeLimitacao;
		END IF;
		SELECT @B:= C.Id_cliente FROM Cliente AS C where C.Nome = nomeCliente;
        INSERT INTO Cliente_Limitacao_Fisica(Id_cliente, Id_Limitacao)
				VALUE (@B,@A);
        	if erro then ROLLBACK;
    else commit;
    
    END IF;
        
END $$  
DELIMITER ;

CALL inserir_limitacao('Tendinite', 'Ana Maria');

select * FROM cliente AS C 
INNER JOIN cliente_limitacao_fisica AS CL ON CL.Id_cliente = C.Id_cliente
INNER JOIN limitacao_fisica AS L ON L.Id_Limitacao = CL.Id_limitacao
where C.Nome = 'Ana Maria';

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

-- Inserir atividade ao plano
DROP PROCEDURE IF EXISTS inserir_atividade_plano;

DELIMITER $$
CREATE PROCEDURE inserir_atividade_plano(IN numAulas INT, IN id_plano INT, IN nome VARCHAR(45))
		BEGIN
		Declare erro Bool default 0;
		declare continue handler for SQLEXCEPTION set erro = 1; 
        start transaction;
		set @A:=0;
        set @B:=0;
        set @C:=0;
		SELECT @A:= AF.Id_atividade, @B:= AF.Max_participantes, @C:= AF.Nr_inscritos FROM Atividade_Fitness AS AF where AF.Nome = nome;
		IF(@B > @C) THEN
			INSERT INTO Plano_Atividade_Fitness(Nr_aulas, Id_plano, Id_atividade)
				VALUE (numAulas, id_plano, @A);
		END IF;
        	if erro then ROLLBACK;
			else commit;
    END IF;
        
END $$  
DELIMITER ;

CALL inserir_atividade_plano(20,2,'Hiit');

select * 
from plano_atividade_fitness;

DROP trigger update_participantes

DELIMITER $$
CREATE TRIGGER update_participantes
AFTER INSERT ON plano_atividade_fitness
FOR EACH ROW
BEGIN
	UPDATE Atividade_fitness
    SET Nr_inscritos = Nr_inscritos + 1
    WHERE Id_atividade = @A;
END
$$

select *
from atividade_fitness;