
-- outra forma do CREATE TABLE fiap.aluno

create table aluno(
	ra int primary key,
    nm_aluno varchar(100),
    dt_nascimento date,
    st_aluno char(1) check(st_aluno in('A','I'))
);

drop table aluno;

-- não procedural (inserir dados para todas as colunas, seguindo a ordem de criação)
insert into aluno values(1,'Luna','08-01-2000','A');

-- procedural (informo as colunas que quero inserir)
insert into aluno(ra,nm_aluno) values (2,'Leonardo');

-- consulta simples
select * from aluno;

-- não procedural (vai atualizar todas as linhas da coluna NOME ALUNO)
update aluno set nm_aluno='João';

-- procedural (informo que é para mudar o NOME ALUNO somente desse RA)
update aluno set nm_aluno='João Lima' where ra=1;

-- atualizando mais de uma linha usando o OR
update aluno set nm_aluno='Lucas Silva' where ra=1 or ra=2;

-- atualizando mais de uma linha usando o IN
update aluno set nm_aluno='Rafael Souza' where ra in(1,2);

-- atualizando onde RA é igual ou maior que 1
update aluno set nm_aluno='Pedro Ferreira' where ra>=1;

-- atualizando onde RA é maior que 1
update aluno set nm_aluno='Alan Silva' where ra>1;

-- atualizando onde RA é menor que 1, no caso, nenhum
update aluno set nm_aluno='Alan Souza' where ra<0;

-- atualizando onde RA maior que 1 e menor que 2, ou melhor, nenhum
update aluno set nm_aluno='Matheus Afonso' where ra>1 and ra<2;

-- atualizando onde RA igual maior que 1 e igual menor que 2
update aluno set nm_aluno='Mateus Afonso' where ra>=1 and ra<=2;

-- atualizando onde RA está ENTRE 1 e 2
update aluno set nm_aluno='Rafael Fontes' where ra between 1 and 2;

select * from aluno;

-- CENARIOS DE ERRO COM INSERT

-- 1: colunas a menos
insert into aluno values(1,'Luna','08-01-2000');

-- 2: chave primaria duplicada
insert into aluno values(1,'Luna','08-01-2000','A');

-- 3: constraint check não atende o valor padrão
insert into aluno values(1,'Luna','08-01-2000','S');

-- 4: tipo de dado incorreto para a coluna
insert into aluno values(1,Luna,'08-01-2000','A');
insert into aluno values('A3','Luna','08-01-2000','A');

-- SEQUENCE simples
create sequence SEQ_ALUNO;

-- testando sequence
-- currvel resgate o ultimo valor da sequence
-- dual tabela de objetos do oracle
select SEQ_ALUNO.currval from dual;

-- começar a sequence
select SEQ_ALUNO.nextval from dual;

-- insert com o sequence
insert into aluno values(SEQ_ALUNO.NEXTVAL,'Luna','08-01-2000','A');

select * from aluno;

create sequence SEQ_CONTATO;

create table contato(
	id_contato int default seq_contato.nextval  primary key,
    ddd int not null,
    nr_telefone int not null,
    ra int,
    foreign key (ra) references aluno(ra)
);

drop table contato;

insert into contato (ddd,nr_telefone,ra) values (11,988801691,1);

insert into contato (ddd,nr_telefone,ra) values (11,40028922,10);

select * from contato;

-- CENÁRIOS INCORRETOS

-- 1: coluna not null com valor vazio
insert into contato values(null,null,988801691,1);

-- 2
insert into contato values(null,11,988801691,5);

-- apagar dados
-- não procedural. apaga tudo da tabela
delete from contato;

delete from contato where id_contato=4;

select * from contato;

