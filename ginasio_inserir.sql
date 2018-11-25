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

DROP PROCEDURE arquivar_professor;

DELIMITER $$
CREATE PROCEDURE arquivar_professor(IN nome VARCHAR(45))
		BEGIN
		Declare erro Bool default 0;
		declare continue handler for SQLEXCEPTION set erro = 1; 
        start transaction;
        set @H:=0;
		SELECT @H:= P.Id_professor FROM Professor AS P where P.Nome = nome;
        UPDATE Professor
        SET Professor.Estado = 'Inativo'
        Where Professor.Id_professor = @H;
        	if erro then ROLLBACK;
    else commit;
    
    END IF;
        
END $$  
DELIMITER ;

CALL arquivar_professor('Diogo Costa');

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

CALL inserir_cliente('Nadia Santos', '1998-09-12', 'Rua Santa Clara 4700-522', 'Souto');

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
from Telemovel;

-- Inserir limitação física
DROP PROCEDURE IF EXISTS inserir_limitacao;

DELIMITER $$
CREATE PROCEDURE inserir_limitacao(IN nomeLimitacao VARCHAR(45), IN nomeCliente VARCHAR(45))
		BEGIN
		Declare erro Bool default 0;
		declare continue handler for SQLEXCEPTION set erro = 1; 
		start transaction;
        set @A:=0;
        SELECT @A:= L.Id_Limitacao FROM Limitacao_Fisica AS L where L.Nome = nomeLimitacao;
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

CALL inserir_limitacao('Tendinite', 'Marco Paulo');

select * FROM Cliente;

select * FROM Cliente AS C 
INNER JOIN Cliente_Limitacao_Fisica AS CL ON CL.Id_cliente = C.Id_cliente
INNER JOIN Limitacao_Fisica AS L ON L.Id_Limitacao = CL.Id_limitacao
where C.Nome = 'Marco Paulo';

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
		set @E:=0;
		SELECT @B:= C.Id_cliente, @E:= P.Id_plano FROM Cliente AS C
		INNER JOIN Plano AS P ON P.Id_cliente = C.Id_cliente
		where C.Nome = nome AND P.Estado = 'Ativo';
		INSERT INTO Plano(Preco, Data_inicio, Estado, Id_professor, Id_cliente)
				VALUE (preco, datainicio, 'Ativo', @A, @B);
        	if erro then ROLLBACK;
    else commit;
    
    END IF;
        
END $$  
DELIMITER ;

CALL inserir_plano(35,'2018-10-19','Joana Antunes', 'Ana Maria');

DROP PROCEDURE arquivar_plano;

DELIMITER $$
CREATE PROCEDURE arquivar_plano(IN id INT)
		BEGIN
		Declare erro Bool default 0;
		declare continue handler for SQLEXCEPTION set erro = 1; 
        start transaction;
        set @K = id;
        UPDATE Plano
        SET Plano.Estado = 'Inativo'
        Where Plano.Id_plano = id AND Plano.Estado = 'Ativo';
        	if erro then ROLLBACK;
    else commit;
    
    END IF;
        
END $$  
DELIMITER ;

CALL arquivar_plano(7);

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
			INSERT INTO Plano_Atividade_Fitness
				(Nr_aulas, Id_plano, Id_atividade)
				VALUE (numAulas, id_plano, @A);
		END IF;
        	if erro then ROLLBACK;
			else commit;
    END IF;
        
END $$  
DELIMITER ;

CALL inserir_atividade_plano(10,45,'Cycling');

select * 
from Plano_Atividade_Fitness;

DROP trigger IF EXISTS update_participantesIncrementa

DELIMITER $$
CREATE TRIGGER update_participantesIncrementa
AFTER INSERT ON Plano_Atividade_Fitness
FOR EACH ROW
BEGIN
	UPDATE Atividade_Fitness
    SET Nr_inscritos = Nr_inscritos + 1
    WHERE Id_atividade = @A;
END
$$
DELIMITER ;

DROP PROCEDURE IF EXISTS decrementaInscritos;

DELIMITER $$
CREATE PROCEDURE decrementaInscritos (id_plano INT) 
BEGIN
	declare contador INT;
	SET @I := 1;
	while(@I <= (SELECT MAX(Id_atividade) FROM Plano_Atividade_Fitness)) DO
        SELECT count(PA.Id_atividade) into contador FROM Plano_Atividade_Fitness AS PA 
			where PA.Id_plano = id_plano AND PA.Id_atividade = @I;
		IF (contador>0) THEN
			UPDATE Atividade_Fitness
			SET Nr_inscritos = Nr_inscritos - 1
			WHERE Id_atividade =@I ;
        END IF;
        SET @I := @I +1;
        END WHILE;
END
$$
DELIMITER ;

DROP trigger IF EXISTS update_participantesDecrementa;

DELIMITER $$
CREATE TRIGGER update_participantesDecrementa
AFTER UPDATE ON Plano
for each row
BEGIN
     CALL decrementaInscritos(@K);
END
$$
DELIMITER ;

CALL arquivar_plano(7);
select *from Plano;

SELECT A.Nome, A.Nr_inscritos FROM Plano AS P
INNER JOIN Plano_Atividade_Fitness AS PA ON PA.Id_plano = P.Id_plano
INNER JOIN Atividade_Fitness AS A ON A.Id_atividade = PA.Id_atividade
WHERE P.Id_plano = 7;

DROP PROCEDURE IF EXISTS aumentarQt_maquina;

DELIMITER $$
CREATE PROCEDURE aumentarQt_maquina(IN tipo VARCHAR(45), IN qt INT)
		BEGIN
        SELECT @F:= Maquina.Id_maquina FROM Maquina WHERE Maquina.Tipo = tipo; 
        UPDATE Maquina
		SET Maquina.Quantidade = Maquina.Quantidade + qt  
        WHERE Maquina.Id_maquina = @F; 
        
END $$  
DELIMITER ;

CALL aumentarQt_maquina('Passadeira', 20);

select *from Maquina;

DROP PROCEDURE IF EXISTS diminuirQt_maquina;

DELIMITER $$
CREATE PROCEDURE diminuirQt_maquina(IN tipo VARCHAR(45), IN qt INT)
		BEGIN
        SELECT @F:= Maquina.Id_maquina FROM Maquina WHERE Maquina.Tipo = tipo; 
        UPDATE Maquina
		SET Maquina.Quantidade = Maquina.Quantidade - qt  
        WHERE Maquina.Id_maquina = @F; 
        
END $$  
DELIMITER ;

CALL diminuirQt_maquina('Passadeira', 20);

-- Altera a quantidade de uma máquina utilizada numa para uma certa atividade
DROP PROCEDURE IF EXISTS alterarQt_maquinaAtividade;

DELIMITER $$
CREATE PROCEDURE alterarQt_maquinaAtividade(IN atividade VARCHAR(45), IN maquina VARCHAR(45), IN qt INT)
	BEGIN
	SELECT @G:= Atividade_Fitness.Id_atividade, @J:= Maquina.Id_maquina FROM Atividade_Fitness 
	INNER JOIN Atividade_Fitness_Maquina ON Atividade_Fitness_Maquina.Id_atividade=Atividade_Fitness.Id_atividade
	INNER JOIN Maquina ON Maquina.Id_maquina = Atividade_Fitness_Maquina.Id_maquina
	WHERE Atividade_Fitness.Nome = atividade AND  Maquina.Tipo = maquina;
	UPDATE Atividade_Fitness_Maquina
	SET Atividade_Fitness_Maquina.Nr_maquinas = qt  
	WHERE Atividade_Fitness_Maquina.Id_atividade = @G
	AND Atividade_Fitness_Maquina.Id_maquina = @J; 
        
END $$  
DELIMITER ;

CALL alterarQt_maquinaAtividade('Run', 'Passadeira', 16);
select *from Atividade_Fitness_Maquina;