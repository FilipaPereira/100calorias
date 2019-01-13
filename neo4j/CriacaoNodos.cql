﻿USING PERIODIC COMMIT
LOAD CSV FROM "file:///localidade.csv" AS line
CREATE (l:Localidade { IdLocalidade: TOINTEGER(line[0]),
Nome: (line[1])});

USING PERIODIC COMMIT
LOAD CSV FROM "file:///cliente.csv" AS line
CREATE (c:Cliente { IdCliente: TOINTEGER(line[0]),
Nome: (line[1]),
DataNascimento: (line[2]),
Endereco: (line[3]),
IdLocalidade: TOINTEGER(line[4])});

USING PERIODIC COMMIT
LOAD CSV FROM "file:///telemovel.csv" AS line
CREATE (t:Telemovel { IdTelemovel: TOINTEGER(line[0]),
Tipo: (line[1]),
Numero: (line[2]),
IdCliente: TOINTEGER(line[3])});

USING PERIODIC COMMIT
LOAD CSV FROM "file:///limitacao_fisica.csv" AS line
CREATE (lf: Limitacao_Fisica { IdLimiticao: TOINTEGER(line[0]),
Nome: TOINTEGER(line[1])});

USING PERIODIC COMMIT
LOAD CSV FROM "file:///plano.csv" AS line
CREATE (pl:Plano { IdPlano:TOINTEGER (line[0]),
Preco: TOFLOAT(line[1]),
DataInicio: (line[2]),
Estado: (line[3]),
IdCliente: TOINTEGER(line[4]),
IdProfessor: TOINTEGER(line[5])});

USING PERIODIC COMMIT
LOAD CSV FROM "file:///professor.csv" AS line
CREATE (p:Professor { IdProfessor:TOINTEGER (line[0]),
Nome: (line[1]),
Endereco: (line[2]),
DataNascimento: (line[3]),
Telemovel: (line[4]),
Email:(line[5]),
Estado: (line[6]),
IdLocalidade: TOINTEGER(line[7])});

USING PERIODIC COMMIT
LOAD CSV FROM "file:///atividade_fitness.csv" AS line
CREATE (af: Atividade_Fitness { IdAtividade: TOINTEGER (line[0]),
MaxParticipantes: TOINTEGER(line[1]),
Nome: (line[2]),
Duração: (line[3]),
Sala: TOINTEGER(line[4]),
NrInscritos: TOINTEGER(line[5]),
IdProfessor: TOINTEGER(line[6])});

USING PERIODIC COMMIT
LOAD CSV FROM "file:///plano_atividade_fitness.csv" AS line
CREATE (pa:Plano_Atividade_Fitness { IdPlano:TOINTEGER (line[1]),
IdAtividade:TOINTEGER (line[2]),
NrAulas: TOINTEGER(line[0])});

USING PERIODIC COMMIT
LOAD CSV FROM "file:///maquina.csv" AS line
CREATE (m:Maquina { IdMaquina: TOINTEGER(line[0]),
Tipo: (line[1]),
Quantidade: TOINTEGER(line[2])});

USING PERIODIC COMMIT
LOAD CSV FROM "file:///atividade_fitness_maquina.csv" AS line
CREATE (am:Atividade_Fitness_Maquina { IdAtividade:TOINTEGER (line[1]),
IdMaquina:TOINTEGER (line[2]),
NrMaquinas:TOINTEGER (line[0])});

MATCH (c:Cliente),(l:Localidade)
WHERE c.IdLocalidade = l.IdLocalidade
CREATE(c)-[r:Habita]->(l);

MATCH (c:Cliente),(t:Telemovel)
WHERE c.IdCliente = t.IdCliente
CREATE(c)-[r:Indica]->(t);

MATCH (p:Professor),(l:Localidade)
WHERE p.IdLocalidade = l.IdLocalidade
CREATE(p)-[r:Reside]->(l);

MATCH (p:Professor),(a:Atividade_Fitness)
WHERE p.IdProfessor = a.IdProfessor
CREATE(p)-[r:Leciona]->(a);

MATCH (p:Professor),(pl:Plano)
WHERE p.IdProfessor = pl.IdProfessor
CREATE(p)-[r:Elabora]->(pl);

USING PERIODIC COMMIT
LOAD CSV FROM "file:///cliente_limitacao_fisica.csv" AS line
MATCH (c:Cliente), (l:Limitacao_Fisica)
WHERE c.IdCliente = TOINTEGER(line[0]) AND l.IdLimitacao = TOINTEGER(line[1])
CREATE(c)-[r:Sujeito]->(l);

MATCH (am: Atividade_Fitness_Maquina),(m:Maquina)
WHERE am.IdMaquina = m.IdMaquina
CREATE(am)-[r:Utiliza]->(m);

MATCH (a: Atividade_Fitness),(am: Atividade_Fitness_Maquina)
WHERE a.IdAtividade = am.IdAtividade
CREATE(a)-[r:Recorre]->(am);

MATCH (pa: Plano_Atividade_Fitness),(pl:Plano)
WHERE pa.IdPlano = pl.IdPlano
CREATE(pa)-[r:Contida]->(pl);

MATCH (a: Atividade_Fitness),(pa: Plano_Atividade_Fitness)
WHERE a.IdAtividade = pa.IdAtividade
CREATE(a)-[r:Possui]->(pa);

MATCH (c:Cliente),(pl:Plano)
WHERE c.IdCliente = pl.IdCliente
CREATE(c)-[r:Contem]->(pl);