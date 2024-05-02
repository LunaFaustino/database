select * from modelo;
select * from marca;

-- having (SEMPRE COM O group by)
select avg(valor), ds_modelo from modelo group by ds_modelo having avg(valor)>20;

-- where
select avg(valor), ds_modelo from modelo where id_modelo <= 5 group by ds_modelo;

-- having + where
select avg(valor), ds_modelo from modelo where id_modelo <= 5 group by ds_modelo having avg(valor)>20;

-- criando view
create view media_veiculos as select avg(valor) as media, ds_modelo from modelo group by ds_modelo;

-- visualizando a view
select * from media_veiculos;

-- subquery
select ds_marca from marca where id_marca in (select id_marca from modelo where valor>40);

-- subquery com update
update modelo set valor = 45 where id_marca in (select id_marca from modelo where valor>40);

select * from modelo;

-- criando sequence nocycle
create sequence seq_cor minvalue 3 maxvalue 10 nocycle;

-- criando sequence cycle
create sequence seq_cor2 minvalue 3 maxvalue 50 cycle;

-- excluir sequence
drop sequence seq_cor;

-- criando tabela com sequence
create table cor_veiculo(
    id_cor int default seq_cor.nextval primary key,
    ds_cor varchar2(60)
);

-- visualizando o valor atual que a sequence se encontra
select seq_cor.currval from dual;
select seq_cor2.currval from dual;

-- insert
insert into cor_veiculo (ds_cor) values ('Verde');
insert into cor_veiculo (ds_cor) values ('Amarelo');
insert into cor_veiculo (ds_cor) values ('Vermelho');
insert into cor_veiculo (ds_cor) values ('Preto');
insert into cor_veiculo (ds_cor) values ('Prata');
insert into cor_veiculo (ds_cor) values ('Branco');

insert into cor_veiculo (id_cor) values (seq_cor2.nextval);

-- colocando mais um valor na sequence
select seq_cor.nextval from dual;
select seq_cor2.nextval from dual;

select * from cor_veiculo;

