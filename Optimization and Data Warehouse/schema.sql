drop table regiao cascade;
drop table concelho cascade;
drop table instituicao cascade;
drop table medico cascade;
drop table consulta cascade;
drop table prescricao cascade;
drop table analise cascade;
drop table venda_farmacia cascade;
drop table prescricao_venda cascade;


CREATE TABLE regiao (
    num_regiao int NOT NULL unique,
    nome varchar CHECK (nome in ('Norte', 'Centro', 'Lisboa', 'Alentejo', 'Algarve')),
    num_habitantes int NOT NULL,
    PRIMARY KEY(num_regiao)
);

CREATE TABLE concelho (
    num_concelho int NOT NULL unique,
    num_regiao int NOT NULL,
    nome varchar CHECK (nome in ('Abrantes', 'Águeda', 'Aguiar da Beira', 'Alandroal',
'Albergaria-a-Velha', 'Albufeira', 'Alcácer do Sal', 'Alcanena', 'Alcobaça', 'Alcochete', 'Alcoutim', 'Alenquer', 'Alfândega da Fé', 'Alijó',
'Aljezur', 'Aljustrel', 'Almada', 'Almeida', 'Almeirim', 'Almodôvar', 'Alpiarça', 'Alter do Chão', 'Alvaiázere', 'Alvito', 'Amadora', 'Amarante',
'Amares', 'Anadia', 'Angra do Heroísmo', 'Ansião', 'Arcos de Valdevez', 'Arganil', 'Armamar', 'Arouca', 'Arraiolos', 'Arronches', 'Arruda dos Vinhos',
'Aveiro', 'Avis', 'Azambuja', 'Baião', 'Barcelos', 'Barrancos', 'Barreiro', 'Batalha', 'Beja', 'Belmonte', 'Benavente', 'Bombarral', 'Borba',
'Boticas', 'Braga', 'Bragança', 'Cabeceiras de Basto', 'Cadaval', 'Caldas da Rainha', 'Calheta', 'Caminha',
'Campo Maior', 'Cantanhede', 'Carrazeda de Ansiães', 'Carregal do Sal', 'Cartaxo', 'Cascais', 'Castanheira de Pêra', 'Castelo Branco', 'Castelo de Paiva',
'Castelo de Vide', 'Castro Daire', 'Castro Marim', 'Castro Verde', 'Celorico da Beira', 'Celorico de Basto', 'Chamusca', 'Chaves',
'Cinfães', 'Coimbra', 'Condeixa-a-Nova', 'Constância', 'Coruche', 'Corvo', 'Covilhã', 'Crato', 'Cuba', 'Câmara de Lobos', 'Elvas', 'Entroncamento',
'Espinho', 'Esposende', 'Estarreja', 'Estremoz', 'Évora', 'Fafe', 'Faro', 'Felgueiras', 'Ferreira do Alentejo', 'Ferreira do Zêzere', 'Figueira da Foz',
'Figueira de Castelo Rodrigo', 'Figueiró dos Vinhos', 'Fornos de Algodres', 'Freixo de Espada à Cinta', 'Fronteira', 'Funchal', 'Fundão',
'Gavião', 'Golegã', 'Gondomar', 'Gouveia', 'Grândola', 'Guarda', 'Guimarães', 'Góis', 'Horta', 'Idanha-a-Nova', 'Ílhavo', 'Lagoa',
'Lagoa', 'Lagos', 'Lajes das Flores', 'Lajes do Pico', 'Lamego', 'Leiria', 'Lisboa', 'Loulé', 'Loures', 'Lourinhã', 'Lousã',
'Lousada', 'Mação', 'Macedo de Cavaleiros', 'Machico', 'Madalena', 'Mafra', 'Maia', 'Mangualde', 'Manteigas', 'Marco de Canaveses', 'Marinha Grande',
'Marvão', 'Matosinhos', 'Mealhada', 'Meda', 'Melgaço', 'Mesão Frio', 'Mira', 'Miranda do Corvo', 'Miranda do Douro', 'Mirandela', 'Mogadouro',
'Moimenta da Beira', 'Moita', 'Monção', 'Monchique', 'Mondim de Basto', 'Monforte', 'Montalegre', 'Montemor-o-Novo', 'Montemor-o-Velho', 'Montijo',
'Mora', 'Mortágua', 'Moura', 'Mourão', 'Murça', 'Murtosa', 'Mértola', 'Nazaré', 'Nelas', 'Nisa', 'Nordeste', 'Óbidos', 'Odemira', 'Odivelas',
'Oeiras', 'Oleiros', 'Olhão', 'Oliveira de Azeméis', 'Oliveira de Frades', 'Oliveira do Bairro', 'Oliveira do Hospital', 'Ourique', 'Ourém',
'Ovar', 'Paços de Ferreira', 'Palmela', 'Pampilhosa da Serra', 'Paredes', 'Paredes de Coura', 'Pedrógão Grande', 'Penacova', 'Penafiel', 'Penalva do Castelo',
'Penamacor', 'Penedono', 'Penela', 'Peniche', 'Peso da Régua', 'Pinhel', 'Pombal', 'Ponta Delgada', 'Ponta do Sol', 'Ponte da Barca',
'Ponte de Lima', 'Ponte de Sor', 'Portalegre', 'Portel', 'Portimão', 'Porto', 'Porto Moniz', 'Porto Santo', 'Porto de Mós', 'Povoação',
'Praia da Vitória', 'Proença-a-Nova', 'Póvoa de Lanhoso', 'Póvoa de Varzim', 'Redondo', 'Reguengos de Monsaraz', 'Resende', 'Ribeira Brava', 'Ribeira Grande',
'Ribeira de Pena', 'Rio Maior', 'Sabrosa', 'Sabugal', 'Salvaterra de Magos', 'Santa Comba Dão', 'Santa Cruz', 'Santa Cruz da Graciosa',
'Santa Cruz das Flores', 'Santa Maria da Feira', 'Santa Marta de Penaguião', 'Santana', 'Santarém', 'Santiago do Cacém', 'Santo Tirso',
'São Brás de Alportel', 'São João da Madeira', 'São João da Pesqueira', 'São Pedro do Sul', 'São Roque do Pico', 'São Vicente', 'Sardoal', 'Sátão',
'Seia', 'Seixal', 'Sernancelhe', 'Serpa', 'Sertã', 'Sesimbra', 'Setúbal', 'Sever do Vouga', 'Silves', 'Sines', 'Sintra', 'Sobral de Monte Agraço',
'Soure', 'Sousel', 'Tábua', 'Tabuaço', 'Tarouca', 'Tavira', 'Terras de Bouro', 'Tomar', 'Tondela', 'Torre de Moncorvo', 'Torres Novas', '
Torres Vedras', 'Trancoso', 'Trofa', 'Vagos', 'Vale de Cambra', 'Valença', 'Valongo', 'Valpaços', 'Velas', 'Vendas Novas', 'Viana do Alentejo',
'Viana do Castelo', 'Vidigueira', 'Vieira do Minho', 'Vila Flor', 'Vila Franca de Xira', 'Vila Franca do Campo', 'Vila Nova da Barquinha', 'Vila Nova de Cerveira',
'Vila Nova de Famalicão', 'Vila Nova de Foz Côa', 'Vila Nova de Gaia', 'Vila Nova de Paiva', 'Vila Nova de Poiares', 'Vila Pouca de Aguiar',
'Vila Real', 'Vila Real de Santo António', 'Vila Velha de Ródão', 'Vila Verde', 'Vila Viçosa', 'Vila de Rei', 'Vila do Bispo',
'Vila do Conde', 'Vila do Porto', 'Vimioso', 'Vinhais', 'Viseu', 'Vizela')),
    num_habitantes int NOT NULL,
    PRIMARY KEY(num_concelho, num_regiao),
    FOREIGN KEY(num_regiao) REFERENCES regiao(num_regiao) on delete cascade on update cascade
);


CREATE TABLE instituicao (
    nome varchar NOT NULL unique,
    tipo varchar CHECK (tipo in ('farmacia', 'laboratorio', 'clinica', 'hospital')),
    num_regiao int NOT NULL,
    num_concelho int NOT NULL,

    PRIMARY KEY(nome),
    FOREIGN KEY(num_regiao, num_concelho) REFERENCES concelho(num_regiao, num_concelho) on delete cascade on update cascade

);

CREATE TABLE medico (
    num_cedula int NOT NULL unique,
    nome varchar NOT NULL,
    especialidade varchar NOT NULL,
    PRIMARY KEY(num_cedula)

);

CREATE TABLE consulta (
    num_cedula int NOT NULL,
    num_doente int NOT NULL,
    data date NOT NULL CHECK(extract(DOW from data) != 6 and extract(DOW from data) != 0),
    nome_instituicao varchar NOT NULL,
    PRIMARY KEY(num_cedula, num_doente, data),
    FOREIGN KEY(num_cedula) REFERENCES medico(num_cedula) on delete cascade on update cascade,
    FOREIGN KEY(nome_instituicao) REFERENCES instituicao(nome) on delete cascade on update cascade,
    unique(num_doente, data, nome_instituicao)
);


CREATE TABLE prescricao (
    num_cedula int NOT NULL,
    num_doente int NOT NULL,
    data date NOT NULL,
    substancia varchar NOT NULL,
    quant int NOT NULL,
    PRIMARY KEY(num_cedula, num_doente, data, substancia),
    FOREIGN KEY(num_cedula, num_doente, data) REFERENCES consulta(num_cedula, num_doente, data) on delete cascade on update cascade
);

CREATE TABLE analise (
    num_analise int NOT NULL unique,
    especialidade varchar NOT NULL,
    num_cedula int,
    num_doente int,
    data date,
    data_registo date NOT NULL,
    nome varchar NOT NULL,
    quant int NOT NULL,
    inst varchar NOT NULL,
    PRIMARY KEY(num_analise),
    FOREIGN KEY(num_cedula, num_doente, data) REFERENCES consulta(num_cedula, num_doente, data) on delete cascade on update cascade,
    FOREIGN KEY(inst) REFERENCES instituicao(nome) on delete cascade on update cascade
);

CREATE TABLE venda_farmacia (
    num_venda int NOT NULL unique,
    data_registo date NOT NULL,
    substancia varchar NOT NULL,
    quant int NOT NULL,
    preco int NOT NULL,
    inst varchar NOT NULL,
    PRIMARY KEY(num_venda),
    FOREIGN KEY(inst) REFERENCES instituicao(nome) on delete cascade on update cascade
);

CREATE TABLE prescricao_venda (
    num_cedula int NOT NULL,
    num_doente int NOT NULL,
    data date NOT NULL,
    substancia varchar NOT NULL,
    num_venda int NOT NULL unique,
    PRIMARY KEY(num_cedula, num_doente, data, substancia, num_venda),
    FOREIGN KEY(num_cedula, num_doente, data, substancia) REFERENCES prescricao(num_cedula, num_doente, data, substancia) on delete cascade on update cascade,
    FOREIGN KEY(num_venda) REFERENCES venda_farmacia(num_venda) on delete cascade on update cascade

);
