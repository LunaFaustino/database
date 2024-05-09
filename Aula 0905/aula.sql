insert into marca (ds_marca) values ('VM');
select * from marca;
rollback;

insert into marca (ds_marca) values ('VM');
select * from marca;

commit;
select * from marca;

select categoria, count(*) as num_modelos from modelo group by categoria;