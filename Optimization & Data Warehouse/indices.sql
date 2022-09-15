/* 1st query */

create index index_num_cedula on consulta using hash(num_cedula);

/* Pode-se criar um índice hash, uma vez que se trata de uma igualdade simples,
em relação ao num_cedula da consulta, de modo a que a comparação "num_doente" = <um_valor> se torne mais eficiente */



/* 2nd query */

create index index_especialidade on medico using hash(especialidade);

/* Uma vez que se trata de uma igualdade podemos tratar com uma hash, de modo a
tornar mais eficiente a comparação "especialidade" = "Ei" */



/* 3rd query */

create index especialidade_index on medico using btree(especialidade);

/* Como o número de médicos por especialidade é o mesmo iriam-se fazer muitos
acessos aos blocos do disco, o que pode ser evitado usando uma btree ordenando
os médicos por especialidade */



/* 4th query */

create index index_num_cedula_consulta on consulta using hash(num_cedula);
create index index_num_cedula_medico on medico using hash(num_cedula);

/* Podem-se criar duas hashs nas tabelas medico e consulta de modo a tornar
mais eficiente a comparação "consulta.num_cedula = medico.num_cedula".
Relativamente à condição "consulta.data BETWEEN 'data_1' AND 'data_2'"
podemos organizar a coluna data na tabela consulta, pelo que usamos uma
btree visto que é mais eficiente para ranges (BETWEEN) */
