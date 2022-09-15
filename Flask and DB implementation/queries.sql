/*1st query*/

select num_concelho
from instituicao inner join venda_farmacia on nome = inst
where data_registo = current_date
group by num_concelho
having sum(preco) >= all(select sum(preco)
                        from instituicao inner join venda_farmacia on nome = inst
                        where data_registo = current_date
                        group by num_concelho);

/*2nd query*/

select num_regiao, medico.nome
from ((medico natural join prescricao) natural join consulta)
inner join instituicao inst1 on inst1.nome = nome_instituicao
where extract(MONTH from prescricao.data) <= 6 and extract(YEAR from prescricao.data) = 2019
group by medico.nome, num_regiao
having count(medico.nome) >= all(select count(medico.nome)
					from ((medico natural join prescricao) natural join consulta)
					inner join instituicao inst2 on inst2.nome = nome_instituicao
					where inst2.num_regiao = inst1.num_regiao and
					extract(MONTH from prescricao.data) <= 6 and extract(YEAR from prescricao.data) = 2019
					group by medico.nome, num_regiao)
order by num_regiao;
/*3rd query*/

select medico.nome
from medico natural join prescricao_venda natural join venda_farmacia venda1
where not exists(
	select instituicao.nome
	from instituicao inner join concelho on instituicao.num_concelho = concelho.num_concelho
	where concelho.num_concelho = 4 and instituicao.tipo = 'farmacia'
	except
	select instituicao.nome
	from instituicao inner join venda_farmacia on instituicao.nome = venda_farmacia.inst
	where venda_farmacia.num_venda = venda1.num_venda)
and extract(year from data) = extract(year from current_date)
and substancia = 'aspirina';

/*4th query*/

select num_doente
from consulta natural join analise
except
select num_doente
from consulta natural join prescricao natural join prescricao_venda;

