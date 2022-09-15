create or replace function check_especialidade_analise() returns trigger as $$
  begin
    if new.num_doente is not null and new.num_cedula is not null and new.data is not null then
      if (select especialidade from medico where num_cedula = new.num_cedula) = new.especialidade then
        return new;
      else
        raise exception 'A especialidade da analise nao e a mesma da do medico';
      end if;
    end if;
    return new;
  end;
$$ language plpgsql;

create trigger analise_trigger before insert on analise for each row execute procedure check_especialidade_analise();
create trigger analise_trigger2 before update on analise for each row execute procedure check_especialidade_analise();


create or replace function check_consulta() returns trigger as $$
  begin
    if (select count(*) from consulta where num_cedula = new.num_cedula and nome_instituicao = new.nome_instituicao and extract(week from data) = extract(week from new.data)) < 100 then
      return new;
    else
      raise exception 'Medico com mais de 100 consultas numa semana na mesma instituicao';
    end if;
  end;
$$ language plpgsql;

create trigger consulta_trigger before insert on consulta for each row execute procedure check_consulta();
create trigger consulta_trigger2 before update on consulta for each row execute procedure check_consulta();
