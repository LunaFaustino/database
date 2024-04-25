--sequence (contador automático)
create sequence seq_marca;
create sequence seq_modelo;

--nextval: prox valor
--currval: valor atual

create table marca(
    id_marca int default seq_marca.nextval primary key,
    ds_marca varchar2(100) not null
);

create table modelo(
    id_modelo int default seq_modelo.nextval primary key,
    ds_modelo varchar2(100) not null,
    cor varchar2(30),
    ano date,
    cambio varchar2(10) check(cambio in('Aut','Manual','Semi')),
    categoria varchar2(10) check(categoria in('Hatch','Sedan','SUV')),
    id_marca int references marca (id_marca)
);

insert into marca (ds_marca) values ('Fiat');
insert into marca (ds_marca) values ('Ford');
insert into marca (ds_marca) values ('Jeep');

select * from marca;

insert into modelo(ds_modelo, cor, ano, cambio, categoria, id_marca) values('Uno','Verde',to_date('2010','YYYY'), 'Manual', 'Hatch', 1);
insert into modelo(ds_modelo, cor, ano, cambio, categoria, id_marca) values('Siena','Vermelho',to_date('2015','YYYY'), 'Manual', 'Sedan', 1);
insert into modelo(ds_modelo, cor, ano, cambio, categoria, id_marca) values('KA','Preto',to_date('2018','YYYY'), 'Manual', 'Hatch', 2);
insert into modelo(ds_modelo, cor, ano, cambio, categoria, id_marca) values('Ecosport','Cinza',to_date('2024','YYYY'), 'Aut', 'SUV', 1);
insert into modelo(ds_modelo, cor, ano, cambio, categoria, id_marca) values('C4','Verde',to_date('2022','YYYY'), 'Aut', 'SUV', 3);
insert into modelo(ds_modelo, cor, ano, cambio, categoria, id_marca) values('Fusca','Amarelo',to_date('1970','YYYY'), 'Manual', 'Hatch', 4);

update modelo set id_marca=4 where id_modelo=7 or id_modelo=8;

select * from modelo;

--cross join
select * from marca, modelo;

-- equi join
select * from marca, modelo where marca.id_marca = modelo.id_marca;

-- alias/apelido
select * from marca ma, modelo mo where ma.id_marca = mo.id_marca;

-- ordenada ascendente TEXTO
select * from marca order by ds_marca asc;
-- ordenada ascendente NUMERO
select * from marca order by id_marca asc;
-- ordenada ascendente DATA
select * from modelo order by ano asc;

-- ordenada descendente TEXTO
select * from marca order by ds_marca desc;
-- ordenada descendente NUMERO
select * from marca order by id_marca desc;
-- ordenada ascendente DATA
select * from modelo order by ano desc;

-- smples com agrupamento
select ds_modelo from modelo group by ds_modelo;

-- agrupada com funcoes
--avg - média
select avg(valor) from modelo;
select avg(valor), ds_modelo from modelo group by ds_modelo;
select avg(valor), cambio from modelo group by cambio;

-- min - menor valor
select min(valor) from modelo;
select min(valor), ds_modelo from modelo group by ds_modelo;

-- max - maior valor
select max(valor) from modelo;
select max(valor), ds_modelo from modelo group by ds_modelo;

-- count - contagem de linhas
select count(valor) from modelo;
select count(valor), ds_modelo from modelo group by ds_modelo;

-- sum - soma os valores da linha
select sum(valor) from modelo;
select sum(valor) valor, ds_modelo from modelo group by ds_modelo order by valor asc;

-- stddev - desvio padrao
select stddev(valor) from modelo;
select stddev(valor), ds_modelo from modelo group by ds_modelo;

