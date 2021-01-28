DROP DATABASE BD2Final;
CREATE SCHEMA IF NOT EXISTS BD2Final;
USE BD2Final;

CREATE TABLE IF NOT EXISTS Curso (
  NumCurso INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  TotalCreditos INT NOT NULL,
  PRIMARY KEY (NumCurso));

CREATE TABLE IF NOT EXISTS Aluno (
  NumAluno INT NOT NULL,
  Nome VARCHAR(100) NOT NULL,
  Endereco VARCHAR(100) NOT NULL,
  Cidade VARCHAR(45) NOT NULL,
  Telefone VARCHAR(45) NOT NULL,
  NumCurso INT NOT NULL,
  PRIMARY KEY (NumAluno),
  CONSTRAINT fk_Aluno_Curso
    FOREIGN KEY (NumCurso)
    REFERENCES Curso (NumCurso));

CREATE TABLE IF NOT EXISTS Disciplina (
  NumDisciplina INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  QuantCreditos INT NOT NULL,
  PRIMARY KEY (NumDisciplina));

CREATE TABLE IF NOT EXISTS Professor (
  NumProfessor INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Admissao DATE NOT NULL,
  AreaPesquisa VARCHAR(45) NOT NULL,
  PRIMARY KEY (NumProfessor));

CREATE TABLE IF NOT EXISTS Aula (
  NumAluno INT NOT NULL,
  NumDisciplina INT NOT NULL,
  NumProfessor INT NOT NULL,
  Semestre VARCHAR(100) NOT NULL,
  Nota FLOAT NOT NULL,
  PRIMARY KEY (NumAluno, NumDisciplina, NumProfessor, Semestre),
  CONSTRAINT fk_Aluno_has_Disciplina_Aluno1
    FOREIGN KEY (NumAluno)
    REFERENCES Aluno (NumAluno),
  CONSTRAINT fk_Aluno_has_Disciplina_Disciplina1
    FOREIGN KEY (NumDisciplina)
    REFERENCES Disciplina (NumDisciplina),
  CONSTRAINT fk_Aula_Professor1
    FOREIGN KEY (NumProfessor)
    REFERENCES Professor (NumProfessor));

CREATE TABLE IF NOT EXISTS DisciplinaCurso (
  NumDisciplina INT NOT NULL,
  NumCurso INT NOT NULL,
  PRIMARY KEY (NumDisciplina, NumCurso),
  CONSTRAINT fk_Disciplina_has_Curso_Curso1
    FOREIGN KEY (NumCurso)
    REFERENCES Curso (NumCurso),
  CONSTRAINT fk_Disciplina_has_Curso_Disciplina1
    FOREIGN KEY (NumDisciplina)
    REFERENCES Disciplina (NumDisciplina));

insert into Professor values (45675, 'Abgair Simoes Ferreira', '1992-04-10', 'Banco de Dados');
insert into Professor values (45690, 'Ramon Travanti', '1993-05-20', 'Direito Romano');
insert into Professor values (45691, 'Gustavo Gouveia Neto', '1993-04-05', 'Sociologia');
insert into Professor values (45692, 'Marcus Salvador', '1993-03-31', 'Matemática Financeira');
insert into Professor values (45693, 'Cintia Falcão', '1993-02-15', 'Engenharia de Software');
insert into Curso values (2142, 'Engenharia Civil', 1500);
insert into Curso values (2143, 'Engenharia Computacao', 2000);
insert into Curso values (2144, 'Direito', 1750);
insert into Curso values (2145, 'Pedagoria', 1500);
insert into Curso values (2146, 'Odontologia', 1600);
insert into Disciplina values (1, 'Banco de dados', 30);
insert into Disciplina values (2, 'Estrutura de dados', 30);
insert into Disciplina values (3, 'Direito Penal', 25);
insert into Disciplina values (4, 'Cálculo Numétrico', 30);
insert into Disciplina values (5, 'Pscicologia Infantil', 25);
insert into Disciplina values (6, 'Direito Tribunal', 33);
insert into Disciplina values (7, 'Engenharia de Software', 27);
insert into Aluno values (111, 'Edvaldo Carlos Silva', 'Av. São Carlos, 186', 'São Carlos - SP', '(017)276-9999', 2143);
insert into Aluno values (112, 'João Benedito Scapin', 'R. José Bonifácio, 70', 'São Carlos - SP', '(017)273-8974', 2142);
insert into Aluno values (113, 'Carol Antonia silveira', 'R. Luiz Camões, 120', 'Ibaté - SP', '(017)278-8568', 2145);
insert into Aluno values (114, 'Marcos João Casanova', 'Av. São Carlos, 176', 'São Carlos - SP', '(017)274-9874', 2143);
insert into Aluno values (115, 'Somone Cristina Lima', 'R. Raul Junior, 180', 'São Carlos - SP', '(017)273-9865', 2144);
insert into Aluno values (116, 'Ailton Castro', 'R. Antonio Carlos, 120', 'Ibaté - SP', '(017)278-8563', 2142);
insert into Aluno values (117, 'Jose Paulo Figueira', 'R. XV Novembro, 871', 'São Carlos - SP', '(017)274-9873', 2145);
insert into DisciplinaCurso values (1, 2143);
insert into DisciplinaCurso values (2, 2143);
insert into DisciplinaCurso values (3, 2144);
insert into DisciplinaCurso values (4, 2143);
insert into DisciplinaCurso values (4, 2142);
insert into DisciplinaCurso values (5, 2145);
insert into DisciplinaCurso values (6, 2144);
insert into DisciplinaCurso values (7, 2143);
insert into DisciplinaCurso values (7, 2142);
insert into Aula values (111, 1, 45675, '01/1998', 8.5);
insert into Aula values (111, 2, 45675, '01/1998', 6.0);
insert into Aula values (111, 2, 45675, '02/1998', 7.0);
insert into Aula values (115, 3, 45690, '01/1998', 4.5);
insert into Aula values (115, 3, 45690, '02/1998', 7.5);
insert into Aula values (111, 4, 45692, '01/1998', 8.0);
insert into Aula values (112, 4, 45692, '01/1998', 7.0);
insert into Aula values (113, 5, 45691, '01/1998', 7.5);
insert into Aula values (115, 6, 45690, '01/1998', 9);
insert into Aula values (111, 7, 45693, '01/1998', 10.0);
insert into Aula values (112, 7, 45693, '01/1998', 5.5);
insert into Aula values (112, 7, 45693, '02/1998', 10.0);
insert into Aula values (114, 1, 45675, '01/1998', 7.0);
insert into Aula values (114, 2, 45675, '01/1998', 8.0);
insert into Aula values (114, 4, 45692, '01/1998', 6.5);
insert into Aula values (114, 4, 45692, '02/1998', 8.5);
insert into Aula values (116, 4, 45692, '01/1998', 3.5);
insert into Aula values (116, 4, 45692, '02/1998', 9.5);
insert into Aula values (114, 7, 45693, '01/1998', 9.5);
insert into Aula values (116, 7, 45693, '01/1998', 8.5);