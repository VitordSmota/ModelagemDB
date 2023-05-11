-- Criar Banco
CREATE DATABASE db_projetobd1;
USE db_projetobd1;
-- Criar Tabelas
CREATE TABLE Departamento (
	ID_Departamento INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(20) NOT NULL
);
CREATE TABLE AreaConhecimento(
    ID_Departamento INT NOT NULL,
	ID_AreaConhecimento INT PRIMARY KEY AUTO_INCREMENT,
	CONSTRAINT fk_id_departamento FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento),
	Nome VARCHAR(20) NOT NULL,
	Descricao VARCHAR(40) 
);
CREATE TABLE Habilidade(
	ID_Habilidade INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(20) NOT NULL,
	Descricao VARCHAR(40) 
);
CREATE TABLE Projeto(
	ID_Projeto INT PRIMARY KEY AUTO_INCREMENT,
	Descricao VARCHAR(40) 
);
CREATE TABLE Colaborador(
    ID_Projeto INT,
	ID_Colaborador INT PRIMARY KEY AUTO_INCREMENT,
	CONSTRAINT fk_projeto_id FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
	Nome VARCHAR(20) NOT NULL,
	dataUltimaPromo DATE NOT NULL,
	dataContratacao DATE NOT NULL,
	dataNascimento DATE NOT NULL
);
CREATE TABLE Desempenho(
	ID_Projeto INT NOT NULL, 
	ID_Colaborador INT NOT NULL,
	PRIMARY KEY(ID_Projeto, ID_Colaborador),
	CONSTRAINT fk_ProjetoID FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
	CONSTRAINT fk_ColaboradorID FOREIGN KEY (ID_Colaborador) REFERENCES Colaborador(ID_Colaborador),
	Nota INT(2) NOT NULL,
	Descricao VARCHAR(40)  
);
CREATE TABLE Projeto_AreaConhecimento(
    ID_AreaConhecimento INT NOT NULL,
	ID_Projeto INT NOT NULL,
	CONSTRAINT fk_areaC_ID2 FOREIGN KEY (ID_AreaConhecimento) REFERENCES AreaConhecimento(ID_AreaConhecimento),
	CONSTRAINT fk_ProjID FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
	PRIMARY KEY(ID_Projeto, ID_AreaConhecimento)
);
CREATE TABLE AreaConhecimento_Habilidade(
	 ID_AreaConhecimento INT NOT NULL,
	 ID_Habilidade INT NOT NULL,
	 PRIMARY KEY(ID_AreaConhecimento, ID_Habilidade),
	 CONSTRAINT fk_Id_AreaConhecimento FOREIGN KEY (ID_AreaConhecimento) REFERENCES AreaConhecimento(ID_AreaConhecimento) ,
	 CONSTRAINT fk_Id_Habilidade FOREIGN KEY (ID_Habilidade) REFERENCES Habilidade(ID_Habilidade),
	 Descricao VARCHAR(40) 
);
CREATE TABLE Projeto_Habilidade(
	 ID_Projeto INT NOT NULL,
	 ID_Habilidade INT NOT NULL,
	 PRIMARY KEY(ID_Projeto, ID_Habilidade),
	 CONSTRAINT fk_ID_Proj FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
	 CONSTRAINT fk_ID_Hab FOREIGN KEY (ID_Habilidade) REFERENCES Habilidade(ID_Habilidade),
	 Funcao VARCHAR(40) 
);
CREATE TABLE Habilidade_Colaborador(
	ID_Colaborador INT NOT NULL,
	ID_Habilidade INT NOT NULL,
	PRIMARY KEY(ID_Colaborador, ID_Habilidade),
	CONSTRAINT fk_Id1_Colaborador FOREIGN KEY (ID_Colaborador) REFERENCES Colaborador(ID_Colaborador),
	CONSTRAINT fk_Id1_Habilidade FOREIGN KEY (ID_Habilidade) REFERENCES Habilidade(ID_Habilidade),
	Nivel VARCHAR(13) NOT NULL,
	Descricao VARCHAR(40) 
);
INSERT INTO Departamento (Nome) VALUES ('Desenvolvimento');
INSERT INTO AreaConhecimento (ID_Departamento,Nome) 
VALUES 
(1,'Back-End'),
(1,'Front-End'),
(1,'FullStack');
INSERT INTO Habilidade (Nome)
VALUES
('CSS'),
('HTML'),
('JavaScript'),
('Nodejs'),
('Angular'),
('Typescript'),
('MVC'),
('Teste Unitario'),
('Java'),
('JWT'),
('SpringBoot'),
('Security'),
('Negocios'),
('Arquitetura Limpa'),
('CX'),
('SO');
INSERT INTO Projeto(Descricao)
VALUES
('X1_BackEnd'),
('Y2_FrontEnd'),
('Z3_FullStack');
INSERT INTO Colaborador(ID_Projeto,Nome,dataUltimaPromo,dataContratacao,dataNascimento)
VALUES
(1,'Oscar','2021-05-12','2005-08-23','1991-01-08'),
(1,'João','2021-05-13','2006-02-22','1992-02-08'),
(2,'André','2021-05-14','2008-04-21','1993-03-08'),
(3,'Fernanda','2021-05-16','2015-11-19','1995-04-08');

INSERT INTO Colaborador(Nome,dataUltimaPromo,dataContratacao,dataNascimento)
VALUES
('Maria','2021-05-15','2010-03-20','1994-04-08');

INSERT INTO Projeto_AreaConhecimento(ID_Projeto, ID_AreaConhecimento)
VALUES
(1,1),
(2,2),
(3,3);


INSERT INTO Projeto_Habilidade(ID_Projeto, ID_Habilidade)
VALUES
(1,4),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(1,16);

INSERT INTO Projeto_Habilidade(ID_Projeto, ID_Habilidade)
VALUES
(2,1),
(2,2),
(2,3),
(2,4),
(2,5),
(2,6),
(2,7),
(2,12),
(2,13),
(2,15);

INSERT INTO Projeto_Habilidade(ID_Projeto, ID_Habilidade)
VALUES
(3,1),
(3,2),
(3,3),
(3,4),
(3,5),
(3,6),
(3,7),
(3,8),
(3,9),
(3,10),
(3,11),
(3,12),
(3,13),
(3,14),
(3,15),
(3,16);


INSERT INTO Habilidade_Colaborador(ID_Colaborador, ID_Habilidade, Nivel)
VALUES
(1,1,'Intermediario'),
(1,2,'Básico'),
(1,3,'Avancado'),
(1,4,'Intermediario'),
(1,6,'Básico'),
(1,12,'Avancado'),
(2,4,'Intermediario'),
(2,5,'Básico'),
(2,6,'Avancado'),
(2,12,'Intermediario'),
(2,15,'Básico'),
(2,16,'Avancado'),
(3,3,'Intermediario'),
(3,8,'Básico'),
(3,9,'Avancado'),
(3,4,'Intermediario'),
(3,1,'Básico'),
(3,13,'Avancado'),
(3,14,'Intermediario'),
(3,15,'Básico'),
(4,1,'Intermediario'),
(4,2,'Básico'),
(4,3,'Avancado'),
(4,4,'Intermediario'),
(4,5,'Básico'),
(4,6,'Avancado'),
(4,14,'Intermediario'),
(4,15,'Básico'),
(5,1,'Intermediario'),
(5,2,'Intermediario'),
(5,3,'Intermediario'),
(5,4,'Intermediario'),
(5,5,'Intermediario'),
(5,6,'Avancado'),
(5,14,'Intermediario'),
(5,15,'Básico');

INSERT INTO AreaConhecimento_Habilidade(ID_AreaConhecimento, ID_Habilidade)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,6),
(2,7),
(2,8),
(2,9),
(2,10),
(3,12),
(3,14),
(3,5),
(3,6),
(3,7),
(3,8),
(3,9),
(3,10),
(3,13),
(3,15),
(3,16);

INSERT INTO Desempenho(ID_Projeto, ID_Colaborador, Nota)
VALUES
(1,2,7),
(1,4,9),
(1,5,10),
(2,1,6),
(2,5,9),
(2,3,7),
(3,1,8),
(3,5,8),
(3,4,7),
(3,3,6);

 -- 1. Liste as Habilidades do Colaborador Oscar
SELECT Habilidade.*, Colaborador.Nome FROM Habilidade
INNER JOIN Habilidade_Colaborador ON Habilidade.ID_Habilidade = Habilidade_Colaborador.ID_Habilidade
INNER JOIN Colaborador ON Habilidade_Colaborador.ID_Colaborador = Colaborador.ID_Colaborador
WHERE Colaborador.Nome = 'Oscar';

-- 2.Qual o Nome e Data de Nascimento dos colaboradores associados ao projeto X1_BackEnd?
SELECT Colaborador.Nome, Colaborador.dataNascimento FROM Colaborador
INNER JOIN Projeto ON Colaborador.ID_Projeto = Projeto.ID_Projeto
WHERE Projeto.Descricao = 'X1_BackEnd';

-- 3.Qual o nome e a data da última promoção do colaborador que está sem Projeto?
SELECT Nome, dataUltimaPromo FROM Colaborador
WHERE ID_Projeto IS NULL
ORDER BY dataContratacao DESC
LIMIT 1;
-- 4. Qual o nome, data de contratação a Habilidades e níveis do colaborador que está sem Projeto?
SELECT Colaborador.Nome, Colaborador.dataContratacao, Habilidade.Nome, Habilidade_Colaborador.Nivel 
FROM Colaborador
LEFT JOIN Habilidade_Colaborador ON Colaborador.ID_Colaborador = Habilidade_Colaborador.ID_Colaborador
LEFT JOIN Habilidade ON Habilidade_Colaborador.ID_Habilidade = Habilidade.ID_Habilidade
WHERE Colaborador.ID_Projeto IS NULL
ORDER BY Colaborador.dataContratacao DESC;

-- 5. Qual o Desempenho dos ultimos Projetos do colaborador desalocado? 
SELECT Colaborador.Nome, Colaborador.dataContratacao, Desempenho.Nota
FROM Colaborador
LEFT JOIN Desempenho ON Colaborador.ID_Colaborador = Desempenho.ID_Colaborador
WHERE Colaborador.ID_Projeto IS NULL
ORDER BY Colaborador.dataContratacao DESC;

-- 6.Quais são as áreas de conhecimento e projetos associados a habilidade 'SO (Sistema Operacionais)'?
SELECT AreaConhecimento.Nome AS Nome_Area, Projeto.Descricao AS Nome_Projeto, Habilidade.Nome FROM AreaConhecimento
INNER JOIN AreaConhecimento_Habilidade ON AreaConhecimento.ID_AreaConhecimento = AreaConhecimento_Habilidade.ID_AreaConhecimento
INNER JOIN Habilidade ON AreaConhecimento_Habilidade.ID_Habilidade = Habilidade.ID_Habilidade
INNER JOIN Projeto_Habilidade ON Habilidade.ID_Habilidade = Projeto_Habilidade.ID_Habilidade
INNER JOIN Projeto ON Projeto_Habilidade.ID_Projeto = Projeto.ID_Projeto
WHERE Habilidade.Nome = 'SO';
-- 7. Quais os colaboradores receberam avaliação menor ou igual a 8 no Projeto Z3_FullStack
SELECT Colaborador.Nome , Desempenho.Nota
FROM Colaborador
INNER JOIN Desempenho ON Colaborador.ID_Colaborador = Desempenho.ID_Colaborador
INNER JOIN Projeto ON Desempenho.ID_Projeto = Projeto.ID_Projeto
WHERE Projeto.Descricao = 'Z3_FullStack' AND Desempenho.Nota <= 8;

-- 8. Quals são os colaboradores que possui habilidades de nivel avançado no Projeto Y2_FrontEnd?
SELECT Colaborador.Nome, Habilidade.Nome AS NomeHabilidade
FROM Colaborador
INNER JOIN Habilidade_Colaborador ON Colaborador.ID_Colaborador = Habilidade_Colaborador.ID_Colaborador
INNER JOIN Habilidade ON Habilidade_Colaborador.ID_Habilidade = Habilidade.ID_Habilidade
INNER JOIN Projeto ON Colaborador.ID_Projeto = Projeto.ID_Projeto
WHERE Projeto.Descricao = 'Y2_FrontEnd' AND Habilidade_Colaborador.Nivel = 'Avançado';

-- 9. Liste a idade dos colaboradores 
SELECT Nome, TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) AS Idade
FROM Colaborador;
-- 10. Qual o tempo de registro na empresa de todos os colaboradores?
SELECT Nome, 
       TIMESTAMPDIFF(YEAR, dataContratacao, CURDATE()) AS Anos,
       TIMESTAMPDIFF(MONTH, dataContratacao, CURDATE()) % 12 AS Meses
FROM Colaborador;

-- 11. Colaboradores que poderão ser promovidos apartir dos seguintes critérios:
 -- Desempenho >= 8 | conter 2 habilidades de nível intermediário e 1 habilidade de nível Avançado
SELECT Nome
FROM Colaborador
INNER JOIN Desempenho ON Colaborador.ID_Colaborador = Desempenho.ID_Colaborador
INNER JOIN Habilidade_Colaborador ON Colaborador.ID_Colaborador = Habilidade_Colaborador.ID_Colaborador
WHERE Nota >= 8 AND Habilidade_Colaborador.Nivel IN ('Intermediário', 'Avançado')
GROUP BY Colaborador.ID_Colaborador
HAVING COUNT(CASE WHEN Nivel = 'Intermediário' THEN 1 END) >= 2 AND COUNT(CASE WHEN Nivel = 'Avançado' THEN 1 END) >= 1;

