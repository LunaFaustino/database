create table T_SGDD_CLIENTE_PF(
    cpf VARCHAR2(14) primary key,
    profissao varchar2(50),
    escolaridade varchar2(20),
    dtNascimento varchar2(10),
    sexo varchar2(20)
);

drop TABLE T_SGDD_CLIENTE_PF;

SELECT * FROM T_SGDD_CLIENTE_PF;