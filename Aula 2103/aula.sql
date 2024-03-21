create database FIAP; -- cria um banco de dados

use fiap; -- selecionando o banco

-- outra forma é CREATE TABLE fiap.aluno

create table aluno(
	ra int primary key,
    nm_aluno varchar(100),
    dt_nascimento date,
    st_aluno char(1) check(st_aluno in("A","I"))
);

drop table aluno;

-- não procedural (para todas as colunas)
insert into aluno values(1,"Luna","2000-01-08","A");

-- procedural (informo as colunas que quero mudar)
insert into aluno(ra,nm_aluno) values (2,"Leonardo");

-- consulta simples
select * from aluno;

-- não procedural (vai atualizar todas as linhas da coluna NOME ALUNO)
update aluno set nm_aluno="João";

-- procedural (informo que é para mudar o NOME ALUNO somente desse RA)
update aluno set nm_aluno="João Lima" where ra=1;

-- CENARIOS DE ERRO COM INSERT

-- 1: colunas a menos
insert into aluno values(1,"Luna","2000-01-08");

-- 2: chave primaria duplicada
insert into aluno values(1,"Luna","2000-01-08","A");

-- 3: constraint check não atende o valor padrão
insert into aluno values(1,"Luna","2000-01-08","S");

-- 4: tipo de dado incorreto para a coluna
insert into aluno values("A","Luna","2000-01-08","A");

-- auto increment é um contador automárico de numerais em inteiros
create table contato(
	id_contato int primary key auto_increment,
    ddd int not null,
    nr_telefone int not null,
    ra int,
    foreign key (ra) references aluno(ra)
);

drop table contato;

insert into contato values(null,11,988801691,1);

select * from contato;

-- CENÁRIOS INCORRETOS

-- 1: coluna not null com valor vazio
insert into contato values(null,null,988801691,1);

-- 2
insert into contato values(null,11,988801691,5);