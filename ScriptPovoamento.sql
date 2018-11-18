INSERT INTO Cliente
	(Nome, Data_nascimento, Rua, Codigo_postal, Telemovel, Email)
    VALUES
    ('Ana Maria', '1980-02-13', 'Rua da Capela', '4700-800', '932343333', 'ana@gmail.com'),
    ('João Moreira', '1988-04-24', 'Rua da Travessa', '4700-801', '963442211', 'joao@gmail.com'),
    ('Carlos Silva', '1990-08-30', 'Rua 25 de abril', '4700-770', '926843322', 'carlos@gmail.com'),
    ('Josefina Andrade', '1999-12-12', 'Avenida Central', '4700-540', '968471443', 'josefina@gmail.com'),
    ('José Pereira', '1992-01-05', 'Rua das Veigas', '4700-700', '912376551', 'jose@gmail.com'),
	('Carolina Peixoto', '1986-02-12', 'Rua de Belomonte', '4700-705', '967389000', 'carol@gmail.com'),
    ('António Ferreira', '1984-05-25', 'Rua do Almada', '4700-704', '914465871', 'antonio@hotmail.com'),
    ('Catarina Cruz', '1985-07-27', 'Rua dos Caldeireiros', '4700-706', '965523412', 'catarina@gmail.com'),
    ('Pedro Meireles', '1986-06-02', 'Rua das Carmelitas', '4700-302', '915444397', 'pedro@hotmail.com'),
    ('Ricardo Carvalho', '1988-11-11', 'Rua do Carvalhido', '4700-703', '965111498', 'carvalho@gmail.com'),
    ('Anabela Pereira', '1997-12-18', 'Rua de Camões', '4700-680', '920186234','belinha_pereira@gmail.com'),
    ('Rafael Martins', '1989-04-09', 'Avenida Central', '4700-540', '918073563','martins.rafa@live.com.pt'),
    ('Bruno Marques', '1998-11-12', 'Rua de Camões', '4700-680', '911275097', 'brmarques12@hotmail.com'),
    ('Joel Lima', '1996-07-17', 'Avenida da Liberdade', '4700-370', '960082744','jlima_96@gmail.com'),
    ('Maria Peixoto', '1993-01-29', 'Travessa do Carmo', '4700-782', '923581040','m_peixoto@hotmail.com'),
    ('Sara Gonçaves', '1992-12-09', 'Rua da Laje', '4700-791', '964520836','sarag@gmail.com'),
    ('Ricardo Oliveira', '1999-06-01', 'Rua da Boavista', '4700-720', '933815028','r_f_oliveira@gmail.com'),
    ('Carolina Pinto', '2000-10-21', 'Travessa do Carmo', '4700-782', '924138480', 'caropinto_2000@live.com.pt'),
    ('Daniela Silva','1998-03-10', 'Rua do Souto', '4700-255', '912910021','dani_silva@hotmail.com'),
    ('Paulo Barros', '1995-09-16', 'Praçeta do Vilar', '4700-789','937156039','plbarros34@gmail.com'),
    ('Débora Morais', '1990-08-14', 'Rua de Penelas', '4700-739','911234235','debi_morais@gmail.com'),
    ('David Abreu', '1991-05-01', 'Rua do Salitre', '4700-229','966134123','dave.abreu@hotmail.com'),
    ('Pedro Oliveira', '1988-10-16', 'Rua Fernão Mendes Pinto', '4700-734','912345920','pedrocas.oliv@hotmail.com'),
    ('Margarida Vasconcelos', '1999-04-06', 'Rua de Penelas', '4700-933','966127540','vasconcelos.mar@gmail.com'),
    ('Vitor Barros', '1985-12-03', 'Avenida da República', '4700-489','914275902','vitor_barros_03@gmail.com'),
    ('Patrícia Vidrago', '1994-12-31', 'Rua do Rouxinol', '4700-219','914725094','patty.vid@gmail.com'),
	('Renato Pimentel', '1980-02-22', 'Rua do Fortunato', '4700-419','918920544','pimentel.22@live.com.pt'),
    ('Filipe Vaz', '1970-04-10', 'Rua do Mercadinho', '4700-550','931029746','vaz.lipe10@hotmail.com'),
    ('Rodrigo Moura', '1998-07-28', 'Rua do Salitre', '4700-229','937180781','rodrigo28moura@gmail.com'),
    ('Estér Rodrigues', '1974-11-24', 'Praçeta do Vilar', '4700-789','968152634','rodriguester24@gmail.com');
    
INSERT INTO Limitacao_Fisica
	(Id_limitacao, Nome, Id_cliente)
    VALUES
    (1, 'Insuficiencia cardiaca', '1'),
    (2, 'Paraplegico', '2'),
    (3, 'Tendinite', '4'),
    (4, 'Hérnea cervical', '5'),
    (5, 'Rompimento da cartilagem','7'),
    (6, 'Osteoperose', '8'),
    (7, 'Lesão meniscal', '10');
    
INSERT INTO Professor
	(Nome, Data_nascimento, Rua, Codigo_postal, Telemovel, Email)
    VALUES
    ('Joana Antunes', '2000-02-13', 'Rua da Cruz', '4700-880', '916060454', 'joana@gmail.com'),
    ('Carlos Sousa', '1970-06-13', 'Avenida da Liberdade', '4700-370', '968571332', 'carlosmsousa@gmail.com'),
    ('Andre Gonçalves', '1990-03-02', 'Rua da Laje', '4700-870', '933423322', 'andreg@gmail.com'),
    ('Diogo Costa', '1998-08-12', 'Rua da Cruz', '4700-880', '912345334', 'diogoCosta@gmail.com'),
	('Susana Esteves', '1988-04-30', 'Rua de Cedofeita', '4700-715', '965403215', 'susana@gmail.com'),
    ('Gonçalo Fernades', '1976-08-01', 'Rua do Rosário', '4706-888', '912564732', 'goncalo@gmail.com'),
    ('Afonso Vieira', '1980-12-02', 'Rua do Loureiro', '4700-620','913788014', 'afonso@hotmail.com'),
    ('Raquel Chaves', '1992-03-19', 'Rua de Trás', '4700-734', '967222514', 'raquel@gmail.com'),
	('Tiago Freitas', '1993-06-22', 'Rua das Flores', '4702-603', '962542361', 'tiago@gmail.com');
    
INSERT INTO Atividade_Fitness
	(Nr_participantes, Nome, Duracao, Sala, Id_professor)
    VALUES
    (20, 'Run', 45, 1, 1),
    (25, 'Cycling', 40, 2, 2),
    (10, 'Step', 45, 3, 3),
    (10, 'Core', 40, 4, 4),
	(10, 'Pilates', 45, 5, 3),
    (15, 'Crossfit', 40, 6, 5),
    (20, 'Body Pump', 45, 2, 9),
    (10, 'Powerjump', 50, 4, 6),
    (25, 'Body Combat', 40, 3, 7),
    (20, 'Hiit', 45, 5, 8);
    
INSERT INTO Maquina
	(Tipo, Quantidade)
    VALUES
    ('Passadeira', 20),
    ('Bicicleta', 25),
    ('Step', 15),
    ('Halteres', 20),
	('Bola de Pilates', 15),
    ('Cordas', 15),
    ('Mini-trampolim', 15),
    ('Pesos', 20),
    ('Kettlebell', 20),    
    ('Argolas', 16);
    
INSERT INTO Atividade_Fitness_Maquina
	(Nr_maquinas, Id_atividade, Id_maquina)
    VALUES
    (15,1,1),
    (20,2,2),
    (10,3,3),
    (10,4,4),
    (10,5,5),
    (10,10,6),
    (15,8,7),
    (15,7,8),
    (15,6,9),
    (15,6,10);
    
INSERT INTO Plano 
	(Preco, Data_inicio, Id_professor, Id_cliente)
    VALUES
    (30, '2018-01-01', 1, 1),
    (40, '2018-02-01', 2, 2),
    (50, '2018-03-01', 3, 3),
    (40, '2018-04-01', 4, 4),
    (35, '2018-10-25', 3, 18),
    (52, '2017-10-28', 2, 12),
    (45, '2018-07-12', 2, 20),
    (37, '2017-09-06', 1, 13),
    (40, '2018-08-14', 4, 17),
    (29, '2018-10-03', 3, 15),
    (25, '2018-09-21', 9, 21),
    (30, '2018-08-15', 5, 12),
    (32, '2018-03-13', 7, 29),
    (45, '2018-04-18', 6, 28),
    (30, '2018-05-01', 8, 22),
    (20, '2018-07-02', 5, 25),
    (35, '2018-01-05', 9, 12),
    (32, '2018-02-17', 4, 18),
    (40, '2018-04-24', 7, 24),
    (27, '2018-05-04', 6, 23),
    (34, '2018-08-11', 4, 5),
    (40, '2018-11-17', 5, 7),
    (25, '2018-06-11', 9, 11),
    (30, '2018-03-07', 1, 9),
    (45, '2018-01-12', 2, 27),
    (42, '2018-09-13', 7, 14),
    (21, '2018-10-06', 8, 26),
    (29, '2018-10-19', 3, 6),
    (35, '2018-11-04', 6, 10),
    (30, '2018-12-18', 7, 19),
    (24, '2018-03-21', 2, 16),
    (32, '2018-01-30', 9, 8),
    (55, '2018-07-01', 7, 30),
    (44, '2018-03-11', 6, 7),
    (28, '2018-09-09', 2, 18);
    
INSERT INTO Plano_Atividade_Fitness
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
    
