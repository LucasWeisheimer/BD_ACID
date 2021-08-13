create database APONTAMENTOS;
use APONTAMENTOS;


drop table if exists Usuarios;
create table Usuarios(
	IdUsuario int auto_increment NOT NULL,
    Nome Varchar(60) NOT NULL,
	Email Varchar(60) NOT NULL,
    Telefone Varchar(14) NOT NULL,
    Situacao Char NOT NULL,
    
    primary key(IdUsuario)
);
insert into Usuarios values(1, 'LUCAS', 'l@gmail.com', '1231231', 'A'),
						   (2, 'Gabriel', 'g@gmail.com', '123123', 'I'),
                           (3, 'Lisa', 'll@gmail.com', '12312312', 'A');
--
--
--
--
--
--
--
--
--
--
--
--
drop table if exists Maquinas;
create table Maquinas(
	IdMaquinas int auto_increment NOT NULL,
    Descricao Varchar(60) NOT NULL,
    Situacao Char NOT NULL,
    Localizacao Varchar(60) NOT NULL,
    
    primary key(IdMaquinas)
);
insert into Maquinas value(1, 'Torno', 'A', 'São Leopoldo'),
						  (2, 'Plaina', 'I', 'Porto Alegre'),
                          (3, 'Fresadora', 'A', 'Rio Grande');
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
drop table if exists Apontamentos;
create table Apontamentos(
	IdApontamentos int auto_increment,
    MaquinasID int,
    DataInicio date,
    DataFim date,
    UsuarioID int,
    IdEmpresa int,
    
    primary key(IdApontamentos),
    foreign key(MaquinasID) references Maquinas(IdMaquinas),
    foreign key(UsuarioID) references Usuarios(IdUsuario)
);

insert into Apontamentos values(1, 1, '2020-01-01', '2020-01-12', 1, 3),
							  (2, 2, '2019-06-06', '2020-32-12', 2, 5),
                              (3, 3, '2020-02-04', '2020-06-11', 3, 6); 
--
--
--
--
--
--
--
--
--
--
--
--
--
--
-- Um Consulta de apontamentos realizados no periodo 01/01/2020 a 01/12/2020
--
select Nome, Email, DataInicio, DataFim, Descricao, Localizacao from Apontamentos
inner join Usuarios on UsuarioID = IdUsuario
inner join Maquinas on MaquinasID = idMaquinas
where Usuarios.Situacao = 'A' and Maquinas.Situacao = 'A' 
and DataInicio >= '2020-01-01' and DataFim >= '2020-01-12';

--
-- Consulta que apresenta o total de apontamentos realizados no periodo 01/01/2020 a 01/12/2020
--
select COUNT(*) from Apontamentos where DataInicio >= '2020-01-01' and DataFim >= '2020-01-12';

--
-- Apresenta a descrição da máquina e o total de apontamentos
--
select Descricao, COUNT(MaquinasID) from Apontamentos inner join
Maquinas on MaquinasID = IdMaquinas group by Descricao order by
COUNT(MaquinasID) DESC;






























-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------

































CREATE database Vendas;
USE Vendas;


--
-- Criação da tabela CLIENTE
--
drop table if exists Cliente;
create table Cliente (
	Cod_Cliente int NOT NULL AUTO_INCREMENT,
    Nome varchar(30) NOT NULL,
    Cidade varchar(30) NOT NULL,
    Uf varchar(4) NOT NULL,
    Telefone varchar(30) NULL,
    Estado varchar(10) NOT NULL,
    Limite int NULL,

	primary key(Cod_Cliente)
);
--
-- INSERT da tabela CLIENTE
--
insert into Cliente values(1, 'Super Merco', 'Porto Alegre', 'RS', '36517897', 'OTIMO', 3300),
						  (2, 'Shop LTDA', 'Canoas', 'RS', '37821354', 'BOM', 1650),
						  (3, 'Cia Limpar', 'Criciuma', 'SC', '32193842', 'RUIM', NULL),
						  (4, 'Clean LTDA', 'Porto Alegre', 'RS', NULL, 'MEDIO', 880),
						  (5, 'Mini Merco', 'Guaiba', 'RS', NULL, 'MEDIO', 990),
						  (6, 'Free Shop', 'Reveira', 'RS', '32873929', 'BOM', 1980);
--
--
--
--
--
--
--
--
--
--
--
--				  
--
-- Criação da table PEDIDO
--
drop table if exists Pedido;
create table Pedido(
	Numero_Pedido int  NOT NULL AUTO_INCREMENT,
    Data_Emissao varchar(15) NOT NULL,
    Data_Entrega varchar(15) NULL,
    IDCod_Cliente int NOT NULL,
    
    primary key(Numero_Pedido),
    foreign key (IDCod_Cliente) references Cliente(Cod_Cliente)
);
--
-- INSERT da tabela PEDIDO
--
insert into Pedido values (1, '2008-01-02', '2008-01-12', 6),
						  (2, '2008-01-05', '2008-01-15', 3),
						  (3, '2008-02-15', '2008-02-28', 5),
						  (4, '2008-02-27', '2008-03-12', 6),
						  (5, '2008-03-21', NULL, 1),
						  (6, '2008-04-27', '2008-05-07', 1);
--
--
--
--
--
--
--
--
--
--
--
--
--
-- Criação da tabela PRODUTO
--
drop table if exists Produto;
create table Produto(
	Nome_Produto varchar(30) NOT NULL,
    Preco double NOT NULL,
    Categoria varchar(30) NOT NULL,
    Cod_Produto int NOT NULL,
    
    primary key(Cod_Produto)
);
--
-- INSERT da tabela PRODUTO
--
insert into Produto values('OMO', 6.50, 'SABAO', 1),
						  ('CONFORT', 4.50, 'AMACIANTE', 2),
                          ('PINHO SOL', 3.50, 'DESINFETANTE', 3),
                          ('ACE', 5.00, 'SABAO', 4),
                          ('YPE', 3.50, 'AMACIANTE', 5),
                          ('FOFO', 4.00, 'AMACIANTE', 6);
--
--
--
--
--
--
--
--
--
--
--
--
--
-- Criação da tabela MOVIMENTO
--
drop table if exists Movimento;
create table Movimento(
	ID_Numero_Pedido int NOT NULL,
	ID_Cod_Produto int NOT NULL,
    Quantidade int NOT NULL,
    Valor_Total double NOT NULL,
	
	foreign key(ID_Cod_Produto) references Produto(Cod_Produto),
    foreign key(ID_Numero_Pedido) references Pedido(Numero_Pedido)
);
--
-- INSERT da tabela MOVIMENTO
--
insert into Movimento values(1, 3, 50, 175.00),
							(1, 4, 100, 500.00),
							(2, 6, 10, 40.00),
							(2, 5, 5, 17.50),
							(2, 2, 10, 45.00),
							(2, 3, 10, 35.00),
							(3, 1, 100, 650.00),
							(3, 4, 150, 750.00),
							(3, 5, 120, 420.00),
							(4, 1, 130, 845.00),
							(5, 2, 50, 250.00),
							(5, 1, 70, 455.00),
							(5, 4, 60, 300.00),
							(6, 1, 130, 845.00),
							(6, 4, 110, 550.00),
							(6, 6, 100, 400.00);
--
--
--
--
--
--
--
--
--
--
--
--
--
-- SELECIONA OS NOMES DO CLIENTES COM LIMITE MAIOR OU IGUAL A 1200 COM O ESTADO OTIMO
--
select Nome from cliente where Limite >= 1200 and Estado = 'OTIMO';

--
-- SELECIONA O COD_CLIENTE E O NOME SE FOREM LTDA
--
select Cod_Cliente, Nome from Cliente where Nome like '%LTDA';

--
-- SELECIONA O NUMERO DO PRODUTO COM O CODIGO 3
--
select Nome_Produto from Produto where Cod_Produto = 3;

--
-- SELECIONA O NOME E O NUMERO_PEDIDO 
--
select Nome,Numero_Pedido from Cliente,Pedido where Cliente.Cod_Cliente = Pedido.IDCod_Cliente;






























-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------

































CREATE database VOO;
use VOO;



--
-- Criação da tabela CLIENTE
--
drop table if exists Cliente;
create table Cliente (
	Cod_Cliente varchar(7) NOT NULL,
    Nomes_Cli varchar(10) NOT NULL,
    Endereco varchar(50) DEFAULT NULL,
    Telefone varchar(30) DEFAULT NULL,

	primary key(Cod_Cliente)
);
--
-- INSERT da tabela CLIENTE
--
insert into Cliente (Cod_Cliente, Nomes_Cli, Endereco, Telefone)
	values('c1', 'João', 'Rua Freire Alemao, 83/501', '339-8909'),
	('c2', 'Luis', 'Rua Anita Garibaldi, 1001/703', '223-9876'),
    ('c3', 'Carlos', 'Av.Carazinho, 120', '341-9056'),
	('c4', 'Maria', 'Av.Protasio Alves, 3244/303', '221-0987');
--
--
--
--
--
--
--
--
--
--
--
--
-- Criação da tabela PILOTO
--
drop table if exists Piloto;
Create table Piloto (
	Cod_Piloto varchar(7) NOT NULL,
    Nomes_Pi varchar(10) NOT NULL,
    Endereco varchar(50) NOT NULL,
    Data_Admissao varchar(15) NOT NULL,

	primary key(Cod_Piloto)
);
--
-- INSERT da tabela PILOTO
--
insert into Piloto value('p1', 'Pedro', 'Rua Carlos Gomes, 607', '03-MAR-89'),
						('p2', 'Ronaldo', 'Rua 24 de outubro, 312/201', '20-APR-80'),
						('p3', 'Paulo', 'Rua Nilo Peçanha, 804/203', '13-NOV-90'),
						('p4', 'Marcos', 'Rua Mariland, 645/302', '12-JUL-88');
--
--
--
--
--
--
--
--
--
--
--
--
-- Criação da tabela VOO
--
drop table if exists Voo;
Create table Voo (
	Num_Voo varchar(7),
    Hora_Partida int,
    Hora_Chegada int,
    Cidade_Partida varchar(30),
    Cidade_Chegada varchar(30),
    
    primary key(Num_Voo)
    
);

insert into Voo value('v1', 800, 845, 'São Paulo', 'Rio de Janeiro'),
					 ('v2', 1000, 1330, 'São Paulo', 'Salvador'),
                     ('v3', 2200, 2330, 'Porto Alegre', 'São Paulo'),
                     ('v5', 1200, 1345, 'Porto Alegre', 'Rio de Janeiro'),
                     ('v4', 1100, 1150, 'Porto Alegre', 'Florianopolis');
--
--
--
--
--
--
--
--
--
--
--
--
-- Criação da tabela Execucao_Voo
--
drop table if exists Execucao_Voo;
create table Execucao_Voo (
	Numero_Voo varchar(7) NOT NULL,
    Data_Voo varchar(15) NOT NULL,
    ID_Piloto varchar(7) NOT NULL,
    num_Lugares int NOT NULL,
    
    foreign key(Numero_Voo) references Voo(Num_Voo),
    foreign key(ID_Piloto) references Piloto(Cod_Piloto)
);
--
-- INSERT da tabela EXECUCAO_VOO
--
insert into Execucao_Voo valueS('v1', '18-jun-02', 'p2', 70),
							  ('v1', '20-sep-02', 'p2', 200),
                              ('v3', '10-aug-02', 'p2', 140),
                              ('v4', '20-sep-02', 'p4', 100),
                              ('v3', '11-nov-02', 'p2', 300),
                              ('v1', '22-sep-02', 'p1', 110),
                              ('v5', '20-sep-02', 'p3', 145),
                              ('v2', '01-sep-02', 'p4', 350),
                              ('v1', '23-sep-02', 'p4', 290),
                              ('v1', '11-nov-02', 'p4', 125),
                              ('v5', '10-nov-02', 'p4', 185);
--
--
--
--
--
--
--
--
--
--
--
drop table if exists Passagem;
create table Passagem (
	Numero_Voo varchar(7) NOT NULL,
    Data_ varchar(15) NOT NULL,
    Poltrona varchar(5),
    ID_Cli varchar(7),
	Data_Reserva varchar(15),
    Valor double,
    
    foreign key(Numero_Voo) references Voo(Num_Voo),
    foreign key(ID_Cli) references Cliente(Cod_Cliente)
);

insert into Passagem value('v5', '20-sep-02', '16a', 'c3', '12-mar-02', 250.00),
                          ('v1', '20-sep-02', '16b', 'c4', '15-may-02', 300.00),
                          ('v1', '18-jun-02', '24b', 'c3', '12-mar-02', 350.00),
                          ('v3', '10-aug-02', '13a ', 'c4', '10-may-02', 380.00),
                          ('v4', '20-sep-02', '19c ', 'c3', '13-jun-02', 450.00),
                          ('v3', '10-aug-02', '1a ', 'c1', '20-mar-02', 380.00),
                          ('v3', '11-nov-02', '2a', 'c2', '12-sep-02', 380.00),
                          ('v5', '20-sep-02', '21a ', 'c1', '05-apr-02', 250.00),
                          ('v5', '10-nov-02', '11a', 'c3', '14-apr-02', 250.00),
                          ('v4', '10-nov-02', '19a', 'c2', '02-jun-02', 450.00),
                          ('v1', '11-nov-02', '5a', 'c3', '23-jun-02', 300.00);
--
--
--
--
--
--
--
--
--
--
--
--
-- ADICIONA uma nova coluna em PASSAGEM
--
Alter table Passagem add Cod_Passagem varchar(7);

--
-- Atualiza o TELEFONE do cliente 2
--
update Cliente set Telefone = '32266133' where Cod_Cliente = 'c2';

--
-- Nome do cliente e do Piloto
--
select Nomes_Cli, Nomes_Pi from Cliente, Piloto;
  
--
-- Retorna as datas dos voos do piloto p2
--
select Data_Voo from Execucao_Voo where ID_Piloto = 'p2';  

--
-- EXCLUI as DATA_RESERVAs repetidas
--
SET SQL_SAFE_UPDATES=0;

DELETE d1 from Passagem as d1, Passagem as d2
where d1.Cod_Passagem < d2.Cod_Passagem and d1.Data_Reserva = d2.Data_Reserva;  
  
--
-- SELECIONA OS NOMES E O NUMERO DO VOO
--
select c.Nomes_Cli, p.Numero_Voo from Cliente as c
inner join Passagem as p on c.Cod_Cliente = p.ID_Cli;

--
-- SELECIONA O NUMERO DO VOO COM O VALOR MENOR QUE 300
--
select Numero_Voo from Passagem where Valor < 300;

--
-- Seleciona a pessoa que voará com pedro
--
Select Nomes_Cli from Passagem 
inner join Voo on Numero_Voo = Num_Voo
inner join Cliente on ID_Cli = Cod_Cliente
where Num_Voo = 'V1';
--
--
--

