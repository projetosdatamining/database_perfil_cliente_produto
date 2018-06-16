/* modelo_fisico_cliente_perfil_v4_com_data_aquisicao_estoque: */
drop table if exists compra;
drop table if exists produto;
drop table if exists cliente;
drop table if exists perfil;


CREATE TABLE PRODUTO (
    cod_produto int PRIMARY KEY,
    nome varchar(80),
    preco_venda float,
    data_aquisicao date,
    preco_aquisicao float,
    qtd_estoque int
);

CREATE TABLE CLIENTE (
    cod_cliente int PRIMARY KEY,
    nome varchar(100),
    email varchar(80),
    FK_PERFIL int,
    sexo char(1)
);

CREATE TABLE PERFIL (
    cod_perfil int PRIMARY KEY,
    descricao varchar(80),
    desconto_percentual float
);

CREATE TABLE Compra (
    cod_compra serial PRIMARY KEY,
    FK_PRODUTO int,
    FK_CLIENTE int,
    data date,
    hora time,
    qtd int,
    preco_compra float
);
 
ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_1
    FOREIGN KEY (FK_PERFIL)
    REFERENCES PERFIL (cod_perfil)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Compra ADD CONSTRAINT FK_Compra_1
    FOREIGN KEY (FK_PRODUTO)
    REFERENCES PRODUTO (cod_produto)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Compra ADD CONSTRAINT FK_Compra_2
    FOREIGN KEY (FK_CLIENTE)
    REFERENCES CLIENTE (cod_cliente)
    ON DELETE SET NULL ON UPDATE CASCADE;


         -- inserts

 insert into perfil (cod_perfil,descricao,desconto_percentual) 
values 	(1000,'Diamante',30),
	(2000,'Ouro',20),
	(3000,'Prata',15),
	(4000,'Bronze',10),
	(5000,'Comum',0);
-- OBS: aqui e importante lembrar que zero e diferente de NULL (null nao computa calculos, por isso deve-se utilizar o zero)

insert into cliente values (10,'Bernardo Silva','bernardo@gmail.com',2000,'M'),
(20,'Laura Correa','laura@hotmail.com',3000,'F'),
(30,'Lucas Rocha','lrocha@yahoo.com',2000,'M'),
(40,'Luiza Souza','luiza@gmail.com',1000,'F'),
(50,'Heitor Gomes','heitor@yahoo.com',1000,'M'),
(60,'Beatriz Quitério','bea@gmail.com',5000,'F'),
(70,'Helena Augusta','helena@gmail.com',3000,'F'),
(80,'Enzo Pedra','enzo@gmail.com',4000,'M');



insert into produto (cod_produto,nome,preco_venda,data_aquisicao,preco_aquisicao,qtd_estoque)
values 	(110,'Violão Tagima',780.00,'10/04/2018',500.00,5),
	(120,'Simulador Surf',250.00,'11/04/2018',150.00,4),
	(130,'Prancha Surf',980.00,'11/04/2018',600.00,6),
	(140,'Guitarra Ibanez',2750.00,'15/04/2018',1500.00,2),
	(150,'TV 49P LG',2499.00,'15/04/2018',1600.00,5),
	(160,'Notebook Dell i7',4150.00,'25/04/2018',2700.00,3),
	(170,'Fone HyperX',500.00,'25/04/2018',310.00,22),
	(180,'Drone Phantom 4 Pro+',7999.00,'25/04/2018',5499.00,2),
	(190,'Robô Aspirador de Poeira',800.00,'25/04/2018',500.00,1);



insert into compra (cod_compra,FK_PRODUTO,FK_CLIENTE,data,hora,qtd,preco_compra)
values (1,150,20,'12/05/2017','12:00',2,2124.15),	
(2,130,50,'12/05/2017','12:55',1,686),
(3,160,10,'13/05/2017','10:15',1,3320),
(4,110,60,'14/05/2017','8:00',2,780),
(5,180,50,'14/05/2017','17:10',2,5599.3),
(6,120,20,'15/05/2017','11:35',1,212.5),
(7,170,80,'15/05/2017','14:20',4,450),
(8,150,50,'15/05/2017','15:45',1,1749.3),
(9,120,40,'15/05/2017','18:00',1,175),
(10,160,30,'16/05/2017','13:00',1,3320),
(11,190,10,'17/05/2017','9:00',2,640),
(12,130,30,NULL,NULL,1,784),
(13,110,20,'17/05/2017','18:00',3,663);

