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

