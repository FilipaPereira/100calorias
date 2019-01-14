USE ginasio;
filename = "C:/Users/Utilizador/Desktop/cvs/cliente.csv";
      f = new FileWriter(filename);
      query = "select * from Cliente";
      stm = conn.createStatement();
      rs = stm.executeQuery(query);
      f.append("IdCliente,Nome,DataNascimento,Endereco,IdLocalidade");
      f.append('\n');
      while(rs.next()){
        f.append(String.valueOf(rs.getInt(1)));
        f.append(',');
        f.append(rs.getString(2));
        f.append(',');
        f.append(rs.getString(3));
        f.append(',');
        f.append(rs.getString(4));
        f.append(',');
        f.append(String.valueOf(rs.getInt(5)));
        f.append('\n');
      }
      f.flush();
      f.close();
      System.out.println("CSV File is created!");

filename = "C:/Users/Utilizador/Desktop/cvs/atividade_fitness.csv";
      f = new FileWriter(filename);
      query = "select * from Atividade_Fitness";
      stm = conn.createStatement();
      rs = stm.executeQuery(query);
      f.append("IdAtividade,MaxParticipantes,Nome,Duracao,Sala,NrInscritos,IdProfessor");
      f.append('\n');
      while(rs.next()){
        f.append(String.valueOf(rs.getInt(1)));
        f.append(',');
        f.append(String.valueOf(rs.getInt(2)));
        f.append(',');
        f.append(rs.getString(3));
        f.append(',');
        f.append(rs.getString(4));
        f.append(',');
        f.append(String.valueOf(rs.getInt(5)));
        f.append(',');
        f.append(String.valueOf(rs.getInt(6)));
        f.append(',');
        f.append(String.valueOf(rs.getInt(7)));
        f.append('\n');
      }
      f.flush();
      f.close();
      System.out.println("CSV File is created!");

filename = "C:/Users/Utilizador/Desktop/cvs/limitacao_fisica.csv";
      f = new FileWriter(filename);
      query = "select * from Limitacao_Fisica";
      stm = conn.createStatement();
      rs = stm.executeQuery(query);
      f.append("IdLimitacao,Nome");
      f.append('\n');
      while(rs.next()){
        f.append(String.valueOf(rs.getInt(1)));
        f.append(',');
        f.append(rs.getString(2));
        f.append('\n');
      }
      f.flush();
      f.close();
      System.out.println("CSV File is created!");

filename = "C:/Users/Utilizador/Desktop/cvs/localidade.csv";
      f = new FileWriter(filename);
      query = "select * from Localidade";
      stm = conn.createStatement();
      rs = stm.executeQuery(query);
      f.append("IdLocalidade,Nome");
      f.append('\n');
      while(rs.next()){
        f.append(String.valueOf(rs.getInt(1)));
        f.append(',');
        f.append(rs.getString(2));
        f.append('\n');
      }
      f.flush();
      f.close();
      System.out.println("CSV File is created!");

select * FROM maquina
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/maquina.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

filename = "C:/Users/Utilizador/Desktop/cvs/plano.csv";
      f = new FileWriter(filename);
      query = "select * from Plano";
      stm = conn.createStatement();
      rs = stm.executeQuery(query);
      f.append("IdPlano,Preco,DataInicio,Estado,IdCliente,IdProfessor");
      f.append('\n');
      while(rs.next()){
        f.append(String.valueOf(rs.getInt(1)));
        f.append(',');
        f.append(rs.getString(2));
        f.append(',');
        f.append(rs.getString(3));
        f.append(',');
        f.append(rs.getString(4));
        f.append(',');
        f.append(String.valueOf(rs.getInt(5)));
        f.append(',');
        f.append(String.valueOf(rs.getInt(6)));
        f.append('\n');
      }
      f.flush();
      f.close();
      System.out.println("CSV File is created!");

filename="C:/Users/Utilizador/Desktop/cvs/telemovel.csv";
      f = new FileWriter(filename);
      query = "select * from Telemovel";
      stm = conn.createStatement();
      rs = stm.executeQuery(query);
      f.append("IdTelemovel,Tipo,Numero,IdCliente");
      f.append('\n');
      while(rs.next()){
        f.append(String.valueOf(rs.getInt(1)));
        f.append(',');
        f.append(rs.getString(2));
        f.append(',');
        f.append(rs.getString(3));
        f.append(',');
        f.append(String.valueOf(rs.getInt(4)));
        f.append('\n');
      }
      f.flush();
      f.close();
      System.out.println("CSV File is created!");

select * FROM professor
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/professor.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM atividade_fitness_maquina
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/atividade_fitness_maquina.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

select * FROM cliente_limitacao_fisica
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cliente_limitacao_fisica.csv'
fields enclosed by '"' terminated by ',' escaped by '' 
lines terminated by '\r\n';

filename = "C:/Users/Utilizador/Desktop/cvs/plano_atividade_fitness.csv";
      f = new FileWriter(filename);
      query = "select * from Plano_Atividade_Fitness";
      stm = conn.createStatement();
      rs = stm.executeQuery(query);
      f.append("NrAulas,IdPlano,IdAtividade");
      f.append('\n');
      while(rs.next()){
        f.append(String.valueOf(rs.getInt(1)));
        f.append(',');
        f.append(String.valueOf(rs.getInt(2)));
        f.append(',');
        f.append(String.valueOf(rs.getInt(3)));
        f.append('\n');
      }
      f.flush();
      f.close();
      conn.close();
      System.out.println("CSV File is created!");
    } catch (Exception e) {
      e.printStackTrace();
    }


