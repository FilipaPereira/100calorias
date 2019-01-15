CREATE CONSTRAINT ON (l:Localidade) ASSERT l.IdLocalidade IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///localidade.csv" AS line
CREATE (l:Localidade {IdLocalidade: TOINTEGER(line.IdLocalidade),
Nome: line.Nome});

CREATE CONSTRAINT ON (c:Cliente) ASSERT c.IdCliente IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///cliente.csv" AS line
CREATE (c:Cliente { IdCliente: TOINTEGER(line.IdCliente),
Nome: (line.Nome),
DataNascimento: (line.DataNascimento),
Endereco: (line.Endereco),
IdLocalidade: TOINTEGER(line.IdLocalidade)});

CREATE CONSTRAINT ON (t:Telemovel) ASSERT t.IdTelemovel IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///telemovel.csv" AS line
CREATE (t:Telemovel { IdTelemovel: TOINTEGER(line.IdTelemovel),
Tipo: (line.Tipo),
Numero: (line.Numero),
IdCliente: TOINTEGER(line.IdCliente)});

CREATE CONSTRAINT ON (lf:Limitacao_Fisica) ASSERT lf.IdLimitacao IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///limitacao_fisica.csv" AS line
CREATE (lf: Limitacao_Fisica { IdLimitacao: TOINTEGER(line.IdLimitacao),
Nome: (line.Nome)});

CREATE CONSTRAINT ON (pl:Plano) ASSERT pl.IdPlano IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///plano.csv" AS line
CREATE (pl:Plano { IdPlano:TOINTEGER (line.IdPlano),
Preco: TOFLOAT(line.Preco),
DataInicio: (line.DataInicio),
Estado: (line.Estado),
IdCliente: TOINTEGER(line.IdCliente),
IdProfessor: TOINTEGER(line.IdProfessor)});

CREATE CONSTRAINT ON (p:Professor) ASSERT p.IdProfessor IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///professor.csv" AS line
CREATE (p:Professor { IdProfessor:TOINTEGER (line.IdProfessor),
Nome: (line.Nome),
Endereco: (line.Endereco),
DataNascimento: (line.DataNascimento),
Telemovel: (line.Telemovel),
Email:(line.Email),
Estado: (line.Estado),
IdLocalidade: TOINTEGER(line.IdLocalidade)});

CREATE CONSTRAINT ON (a:Atividade_Fitness) ASSERT a.IdAtividade IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///atividade_fitness.csv" AS line
CREATE (af: Atividade_Fitness { IdAtividade: TOINTEGER (line.IdAtividade),
MaxParticipantes: TOINTEGER(line.MaxParticipantes),
Nome: (line.Nome),
Duracao: (line.Duracao),
Sala: TOINTEGER(line.Sala),
NrInscritos: TOINTEGER(line.NrInscritos),
IdProfessor: TOINTEGER(line.IdProfessor)});

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///plano_atividade_fitness.csv" AS line
CREATE (pa:Plano_Atividade_Fitness { IdPlano:TOINTEGER (line.IdPlano),
IdAtividade:TOINTEGER (line.IdAtividade),
NrAulas: TOINTEGER(line.NrAulas)});

CREATE CONSTRAINT ON (m:Maquina) ASSERT m.IdMaquina IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///maquina.csv" AS line
CREATE (m:Maquina { IdMaquina: TOINTEGER(line.IdMaquina),
Tipo: (line.Tipo),
Quantidade: TOINTEGER(line.Quantidade)});

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///atividade_fitness_maquina.csv" AS line
CREATE (am:Atividade_Fitness_Maquina { IdAtividade:TOINTEGER (line.IdAtividade),
IdMaquina:TOINTEGER (line.IdMaquina),
NrMaquinas:TOINTEGER (line.Nr_Maquinas)});

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
LOAD CSV WITH HEADERS FROM "file:///cliente_limitacao_fisica.csv" AS line
MATCH (c:Cliente {IdCliente: TOINTEGER(line.IdCliente)})
MATCH (l:Limitacao_Fisica {IdLimitacao: TOINTEGER(line.IdLimitacao)})
MERGE (c)-[r:Sujeito]->(l);

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
