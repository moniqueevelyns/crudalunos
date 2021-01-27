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

