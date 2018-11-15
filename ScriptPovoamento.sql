INSERT INTO cliente
	(Id_cliente, Nome, Data_nascimento, Rua, Codigo_postal, Telemovel, Email)
    VALUES
    (1, 'Ana Maria', '1980-02-13', 'Rua da Capela', '4700-780', '902343333', 'ana@gmail.com'),
    (2, 'João Moreira', '1988-04-24', 'Rua da Travessa', '4700-780', '993442211', 'joao@gmail.com'),
    (3, 'Carlos Silva', '1990-08-30', 'Rua 25 de abril', '4700-780', '906843322', 'carlos@gmail.com'),
    (4, 'Josefina Andrade', '1999-12-12', 'Avenida Central', '4700-780', '968471443', 'josefina@gmail.com');

INSERT INTO limitacao_fisica
	(Id_limitacao, Nome, Id_cliente)
    VALUES
    (1, 'Insuficiencia cardiaca', '1'),
    (2, 'Paraplegico', '2');
    
INSERT INTO professor
	(Id_professor, Nome, Data_nascimento, Rua, Codigo_postal, Telemovel, Email)
    VALUES
    (1, 'Joana Antunes', '2000-02-13', 'Rua da Cruz', '4700-780', '916060454', 'joana@gmail.com'),
    (2, 'Carlos Sousa', '1970-06-13', 'Avenida da Liberdade', '4700-780', '968571332', 'carlos@gmail.com'),
    (3, 'Andre Gonçalves', '1990-03-02', 'Rua da Laje', '4700-780', '933423322', 'andreg@gmail.com'),
    (4, 'Diogo Costa', '1998-08-12', 'Rua da Cruz', '4700-780', '912345334', 'diogoCosta@gmail.com');
    
INSERT INTO maquina
	(Id_maquina, Tipo, Quantidade, Id_atividade)
    VALUES
    (1, 'Passadeira', '20', 1),
    (2, 'Bicicleta', '25', 2),
    (3, 'Step', '10', 3),
    (4, 'Halteres', '10', 4),
	(5, 'Bola de Pilates', '10', 5);
    
INSERT INTO atividade_fitness
	(Id_atividade, Nr_participantes, Nome, Duracao, Sala, Id_professor)
    VALUES
    (1, 20, 'Run', 45, 1, 1),
    (2, 25, 'Cycling', 40, 2, 2),
    (3, 10, 'Step', 45, 3, 3),
    (4, 10, 'Core', 40, 4, 4),
	(5, 10, 'Pilates', 45, 5, 3);
    
INSERT INTO plano 
	(Id_plano, Preco, Data_inicio, Id_professor, Id_cliente)
    VALUES
    (1, 30, '2018-01-01', 1, 1),
    (2, 40, '2018-02-01', 2, 2),
    (3, 50, '2018-03-01', 3, 3),
    (4, 40, '2018-04-01', 4, 4);
    
INSERT INTO plano_atividade_fitness
	(Nr_aulas, Id_plano, Id_atividade)
    VALUES
    (15, 1, 1),
    (10, 2, 2),
    (10, 3, 3),
    (8, 4, 4);
	
    

    
