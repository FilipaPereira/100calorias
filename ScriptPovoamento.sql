INSERT INTO cliente
	(Id_cliente, Nome, Data_nascimento, Rua, Codigo_postal, Telemovel, Email)
    VALUES
    (1, 'Ana Maria', '1980-02-13', 'Rua da Capela', '4700-780', '932343333', 'ana@gmail.com'),
    (2, 'João Moreira', '1988-04-24', 'Rua da Travessa', '4700-780', '963442211', 'joao@gmail.com'),
    (3, 'Carlos Silva', '1990-08-30', 'Rua 25 de abril', '4700-780', '926843322', 'carlos@gmail.com'),
    (4, 'Josefina Andrade', '1999-12-12', 'Avenida Central', '4700-780', '968471443', 'josefina@gmail.com'),
	(11,'Anabela Pereira', '1997-12-18', 'Rua de Camões', '4700-780', '920186234','belinha_pereira@gmail.com'),
    (12,'Rafael Martins', '1989-04-09', 'Avenida Central', '4700-780', '918073563','martins.rafa@live.com.pt'),
    (13,'Bruno Marques', '1998-11-12', 'Rua de Camões', '4700-780', '911275097', 'brmarques12@hotmail.com'),
    (14,'Joel Lima', '1996-07-17', 'Avenida da Liberdade', '4700-780', '960082744','jlima_96@gmail.com'),
    (15,'Maria Peixoto', '1993-01-29', 'Travessa do Carmo', '4700-780', '923581040','m_peixoto@hotmail.com'),
    (16,'Sara Gonçaves', '1992-12-09', 'Rua da Laje', '4700-780', '964520836','sarag@gmail.com'),
    (17,'Ricardo Oliveira', '1999-06-01', 'Rua da Boavista', '4700-780', '933815028','r_f_oliveira@gmail.com'),
    (18,'Carolina Pinto', '2000-10-21', 'Travessa do Carmo', '4700-780', '924138480', 'caropinto_2000@live.com.pt'),
    (19,'Daniela Silva','1998-03-10', 'Rua do Souto', '4700-780', '912910021','dani_silva@hotmail.com'),
    (20,'Paulo Barros', '1995-09-16', 'Praçeta do Vilar', '4700-780','937156039','plbarros34@gmail.com');

INSERT INTO limitacao_fisica
	(Id_limitacao, Nome, Id_cliente)
    VALUES
    (1, 'Insuficiencia cardiaca', '1'),
    (2, 'Paraplegico', '2');
    
INSERT INTO professor
	(Id_professor, Nome, Data_nascimento, Rua, Codigo_postal, Telemovel, Email)
    VALUES
    (1, 'Joana Antunes', '2000-02-13', 'Rua da Cruz', '4700-780', '916060454', 'joana@gmail.com'),
    (2, 'Carlos Sousa', '1970-06-13', 'Avenida da Liberdade', '4700-780', '968571332', 'carlosmsousa@gmail.com'),
    (3, 'Andre Gonçalves', '1990-03-02', 'Rua da Laje', '4700-780', '933423322', 'andreg@gmail.com'),
    (4, 'Diogo Costa', '1998-08-12', 'Rua da Cruz', '4700-780', '912345334', 'diogoCosta@gmail.com');
  
    
INSERT INTO atividade_fitness
	(Id_atividade, Nr_participantes, Nome, Duracao, Sala, Id_professor)
    VALUES
    (1, 20, 'Run', 45, 1, 1),
    (2, 25, 'Cycling', 40, 2, 2),
    (3, 10, 'Step', 45, 3, 3),
    (4, 10, 'Core', 40, 4, 4),
	(5, 10, 'Pilates', 45, 5, 3);
    
INSERT INTO maquina
	(Id_maquina, Tipo, Quantidade, Id_atividade)
    VALUES
    (1, 'Passadeira', '20', 1),
    (2, 'Bicicleta', '25', 2),
    (3, 'Step', '10', 3),
    (4, 'Halteres', '10', 4),
	(5, 'Bola de Pilates', '10', 5);
    
INSERT INTO plano 
	(Id_plano, Preco, Data_inicio, Id_professor, Id_cliente)
    VALUES
    (1, 30, '2018-01-01', 1, 1),
    (2, 40, '2018-02-01', 2, 2),
    (3, 50, '2018-03-01', 3, 3),
    (4, 40, '2018-04-01', 4, 4),
    (5, 35, '2018-10-25', 3, 18),
    (6, 52, '2017-10-28', 2, 12),
    (7, 45, '2018-07-12', 2, 20),
    (8, 37, '2017-09-06', 1, 13),
    (9, 40, '2018-08-14', 4, 17),
    (10, 29, '2018-10-03', 3, 15);
    
INSERT INTO plano_atividade_fitness
	(Nr_aulas, Id_plano, Id_atividade)
    VALUES
    (15, 1, 1),
    (10, 2, 2),
    (10, 3, 3),
    (8, 4, 4),
    (10, 8, 2),
    (12, 5, 3),
    (7, 10, 1),
    (10, 6, 4);
	
    

    
