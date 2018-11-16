INSERT INTO cliente
	(Id_cliente, Nome, Data_nascimento, Rua, Codigo_postal, Telemovel, Email)
    VALUES
    (1, 'Ana Maria', '1980-02-13', 'Rua da Capela', '4700-780', '932343333', 'ana@gmail.com'),
    (2, 'João Moreira', '1988-04-24', 'Rua da Travessa', '4700-780', '963442211', 'joao@gmail.com'),
    (3, 'Carlos Silva', '1990-08-30', 'Rua 25 de abril', '4700-780', '926843322', 'carlos@gmail.com'),
    (4, 'Josefina Andrade', '1999-12-12', 'Avenida Central', '4700-780', '968471443', 'josefina@gmail.com'),
    (5, 'José Pereira', '1992-01-05', 'Rua das Veigas', '4700-700', '912376551', 'jose@gmail.com'),
	(6, 'Carolina Peixoto', '1986-02-12', 'Rua de Belomonte', '4700-705', '967389000', 'carol@gmail.com'),
    (7, 'António Ferreira', '1984-05-25', 'Rua do Almada', '4700-704', '914465871', 'antonio@hotmail.com'),
    (8, 'Catarina Cruz', '1985-07-27', 'Rua dos Caldeireiros', '4700-706', '965523412', 'catarina@gmail.com'),
    (9, 'Pedro Meireles', '1986-06-02', 'Rua das Carmelitas', '4700-704', '915444397', 'pedro@hotmail.com'),
    (10, 'Ricardo Carvalho', '1988-11-11', 'Rua do Carvalhido', '4700-703', '965111498', 'carvalho@gmail.com'),
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
    (2, 'Paraplegico', '2'),
    (3, 'Tendinite', '4'),
    (4, 'Hérnea cervical', '5'),
    (5, 'Rompimento da cartilagem','7'),
    (6, 'Osteoperose', '8'),
    (7, 'Lesão meniscal', '10');
    
INSERT INTO professor
	(Id_professor, Nome, Data_nascimento, Rua, Codigo_postal, Telemovel, Email)
    VALUES
    (1, 'Joana Antunes', '2000-02-13', 'Rua da Cruz', '4700-780', '916060454', 'joana@gmail.com'),
    (2, 'Carlos Sousa', '1970-06-13', 'Avenida da Liberdade', '4700-780', '968571332', 'carlosmsousa@gmail.com'),
    (3, 'Andre Gonçalves', '1990-03-02', 'Rua da Laje', '4700-780', '933423322', 'andreg@gmail.com'),
    (4, 'Diogo Costa', '1998-08-12', 'Rua da Cruz', '4700-780', '912345334', 'diogoCosta@gmail.com'),
	(5, 'Susana Esteves', '1988-04-30', 'Rua de Cedofeita', '4700-715', '965403215', 'susana@gmail.com'),
    (6, 'Gonçalo Fernades', '1976-08-01', 'Rua do Rosário', '4706-800', '912564732', 'goncalo@gmail.com'),
    (7, 'Afonso Vieira', '1980-12-02', 'Rua do Loureiro', '4700-720','913788014', 'afonso@hotmail.com'),
    (8, 'Raquel Chaves', '1992-03-19', 'Rua de Trás', '4700-730', '967222514', 'raquel@gmail.com'),
	(9, 'Tiago Freitas', '1993-06-22', 'Rua das Flores', '4702-703', '962542361', 'tiago@gmail.com');
    
INSERT INTO atividade_fitness
	(Id_atividade, Nr_participantes, Nome, Duracao, Sala, Id_professor)
    VALUES
    (1, 20, 'Run', 45, 1, 1),
    (2, 25, 'Cycling', 40, 2, 2),
    (3, 10, 'Step', 45, 3, 3),
    (4, 10, 'Core', 40, 4, 4),
	(5, 10, 'Pilates', 45, 5, 3),
    (6, 15, 'Crossfit', 40, 6, 5),
    (7, 20, 'Body Pump', 45, 2, 9),
    (8, 10, 'Powerjump', 50, 4, 6),
    (9, 25, 'Body Combat', 40, 3, 7),
    (10, 20, 'Hiit', 45, 5, 8);
    
INSERT INTO maquina
	(Id_maquina, Tipo, Quantidade, Id_atividade)
    VALUES
    (1, 'Passadeira', '20', 1),
    (2, 'Bicicleta', '25', 2),
    (3, 'Step', '10', 3),
    (4, 'Halteres', '10', 4),
	(5, 'Bola de Pilates', '10', 5),
    (6, 'Cordas', '12', 10),
    (7, 'Mini-trampolim', '15',8),
    (8, 'Pesos', '20', 7),
    (9, 'Kettlebell', '20', 6),    
    (10, 'Argolas', '16',6);
    
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
    (10, 6, 4),
    (12, 5, 6),
    (5, 6, 7),
    (15, 7, 8),
    (10, 8, 9),
    (14, 9, 10),
    (12, 10, 5);
	
    

    
