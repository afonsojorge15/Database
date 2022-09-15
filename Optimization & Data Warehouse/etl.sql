insert into d_instituicao(nome, tipo, num_regiao, num_concelho)
select nome, tipo, num_regiao, num_concelho
from instituicao;

insert into d_tempo(dia, dia_da_semana, semana, mes, trimestre, ano)
select extract(day from data) as dia, extract(DOW from data) as dia_da_semana, extract(week from data) as semana, extract(month from data) as mes, extract(month from data)/4 as trimestre, extract(year from data) as ano
from analise;

insert into d_tempo(dia, dia_da_semana, semana, mes, trimestre, ano)
select extract(day from data) as dia, extract(DOW from data) as dia_da_semana, extract(week from data) as semana, extract(month from data) as mes, extract(month from data)/4 as trimestre, extract(year from data) as ano
from prescricao_venda;

insert into f_presc_venda(id_medico, num_doente, id_data_registo, id_inst, substancia, quant)
select num_cedula as id_medico, num_doente, id_tempo as id_data_registo, id_inst, substancia, quant
from prescricao_venda inner join d_tempo on (extract(day from data) = dia and extract(DOW from data) = dia_da_semana and extract(week from data) = semana and extract(month from data) = mes and extract(month from data)/4 = trimestre and extract(year from data) = ano)
natural join prescricao natural join consulta natural join instituicao natural join d_instituicao;

insert into f_analise(id_medico, num_doente, id_data_registo, id_inst, nome, quant)
select num_cedula as id_medico, num_doente, id_tempo as id_data_registo, id_inst, nome, quant
from analise inner join d_tempo on (extract(day from data) = dia and extract(DOW from data) = dia_da_semana and extract(week from data) = semana and extract(month from data) = mes and extract(month from data)/4 = trimestre and extract(year from data) = ano)
natural join consulta natural join instituicao natural join d_instituicao;
