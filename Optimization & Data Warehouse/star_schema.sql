drop table d_tempo cascade;
drop table d_instituicao cascade;
drop table f_presc_venda cascade;
drop table f_analise cascade;

CREATE TABLE d_tempo (
    id_tempo serial unique,
    dia int,
    dia_da_semana int,
    semana int,
    mes int,
    trimestre int,
    ano int
);

CREATE TABLE d_instituicao (
    id_inst serial unique,
    nome varchar,
    tipo varchar,
    num_regiao int,
    num_concelho int,
    FOREIGN KEY(nome) REFERENCES instituicao(nome) on delete cascade on update cascade,
    FOREIGN KEY(num_regiao) REFERENCES regiao(num_regiao) on delete cascade on update cascade,
    FOREIGN KEY(num_concelho) REFERENCES concelho(num_concelho) on delete cascade on update cascade
);

CREATE TABLE f_presc_venda (
    id_presc_venda serial unique,
    id_medico int,
    num_doente int,
    id_data_registo int,
    id_inst int,
    substancia varchar,
    quant int,
    PRIMARY KEY(id_presc_venda),
    FOREIGN KEY(id_presc_venda) REFERENCES prescricao_venda(num_venda) on delete cascade on update cascade,
    FOREIGN KEY(id_medico) REFERENCES medico(num_cedula) on delete cascade on update cascade,
    FOREIGN KEY(id_data_registo) REFERENCES d_tempo(id_tempo) on delete cascade on update cascade,
    FOREIGN KEY(id_inst) REFERENCES d_instituicao(id_inst) on delete cascade on update cascade
);

CREATE TABLE f_analise (
    id_analise serial unique,
    id_medico int,
    num_doente int,
    id_data_registo int,
    id_inst int,
    nome varchar,
    quant int,
    PRIMARY KEY(id_analise),
    FOREIGN KEY(id_analise) REFERENCES analise(num_analise) on delete cascade on update cascade,
    FOREIGN KEY(id_medico) REFERENCES medico(num_cedula) on delete cascade on update cascade,
    FOREIGN KEY(id_data_registo) REFERENCES d_tempo(id_tempo) on delete cascade on update cascade,
    FOREIGN KEY(id_inst) REFERENCES d_instituicao(id_inst) on delete cascade on update cascade
);
