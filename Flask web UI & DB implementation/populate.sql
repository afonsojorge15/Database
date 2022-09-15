insert into regiao values(1, 'Norte', 3000000);
insert into regiao values(2, 'Centro', 2000000);
insert into regiao values(3, 'Lisboa', 2000000);
insert into regiao values(4, 'Alentejo', 500000);
insert into regiao values(5, 'Algarve', 99999999);

insert into concelho values(1, 5, 'Faro', 9999999);
insert into concelho values(2, 3, 'Palmela', 2);
insert into concelho values(3, 2, 'Coimbra', 3);
insert into concelho values(4, 1, 'Arouca', 22);
insert into concelho values(5, 1, 'Porto', 2000000);
insert into concelho values(6, 5, 'Portimão', 1);
insert into concelho values(7, 5, 'Olhão', 1);
insert into concelho values(8, 1, 'Braga', 10);
insert into concelho values(9, 2, 'Castelo Branco', 100);
insert into concelho values(10, 2, 'Covilhã', 1000);

insert into instituicao values('Hospital Pediatrico Kevin Spacey', 'hospital', 5, 6);
insert into instituicao values('Hospital Pediatrico Jeffrey Epstein', 'hospital', 5, 7);
insert into instituicao values('Farmacia Juice WRLD', 'farmacia',1, 4);
insert into instituicao values('Laboratorio Walter White', 'laboratorio', 1, 5);
insert into instituicao values('Clinica Divoc', 'clinica', 1, 4);
insert into instituicao values('Farmacia Amy Winehouse', 'farmacia', 1, 4);
insert into instituicao values('Farmacia Irobiso', 'farmacia', 1, 5);
insert into instituicao values('Clinica Maionese', 'clinica', 1, 8);
insert into instituicao values('Farmacia Mac Miller', 'farmacia', 1, 4);
insert into instituicao values('Hospital Das Pessoas Extremamente Inteligentes', 'hospital', 2, 9);

insert into medico values(1, 'Jacinto Leite', 'otorrinolaringologia');
insert into medico values(2, 'Tomás Taveira', 'clinica geral');
insert into medico values(3, 'Hugo Strada', 'pediatria');
insert into medico values(4, 'António Malteser', 'estomatologia');
insert into medico values(5, 'Fernando Madureira', 'monke');


insert into consulta values(3, 1, '2019-3-18', 'Hospital Pediatrico Kevin Spacey');
insert into consulta values(2, 2, '2019-3-18', 'Hospital Pediatrico Jeffrey Epstein');
insert into consulta values(1, 3, '2019-3-18', 'Clinica Divoc');
insert into consulta values(1, 2, '2019-3-18', 'Clinica Divoc');
insert into consulta values(2, 1, '2019-3-18', 'Laboratorio Walter White');
insert into consulta values(2, 3, '2019-3-18', 'Hospital Pediatrico Jeffrey Epstein');
insert into consulta values(2, 3, '2019-3-13', 'Hospital Pediatrico Kevin Spacey');
insert into consulta values(3, 3, '2019-3-11', 'Hospital Pediatrico Jeffrey Epstein');
insert into consulta values(1, 2, '2019-3-12', 'Hospital Pediatrico Kevin Spacey');
insert into consulta values(4, 2, '2019-3-19', 'Hospital Das Pessoas Extremamente Inteligentes');
insert into consulta values(4, 3, '2019-3-25', 'Hospital Das Pessoas Extremamente Inteligentes');
insert into consulta values(4, 1, '2019-3-20', 'Hospital Das Pessoas Extremamente Inteligentes');
insert into consulta values(4, 1, '2019-3-21', 'Hospital Das Pessoas Extremamente Inteligentes');
insert into consulta values(5, 2, '2019-3-20', 'Farmacia Mac Miller');
insert into consulta values(4, 3, '2019-3-22', 'Clinica Maionese');
insert into consulta values(5, 3, '2019-3-22', 'Clinica Divoc');
insert into consulta values(5, 5, '2019-5-27', 'Hospital Pediatrico Kevin Spacey');


insert into prescricao values(2, 2, '2019-3-18', 'aspirina', 1000);
insert into prescricao values(2, 3, '2019-3-18', 'Lysergic acid diethylamide', 1000);
insert into prescricao values(3, 1, '2019-3-18', 'Codeine', 1000);
insert into prescricao values(1, 2, '2019-3-18', 'aspirina', 1000);
insert into prescricao values(2, 3, '2019-3-13', '4-ACO-DMT', 10);
insert into prescricao values(3, 3, '2019-3-11', 'Xanax', 30);
insert into prescricao values(1, 2, '2019-3-12', 'Halibut Dermacare', 20);
insert into prescricao values(4, 2, '2019-3-19', 'Lysergic acid diethylamide', 1500);
insert into prescricao values(4, 3, '2019-3-25', 'Codeine', 1000);
insert into prescricao values(4, 1, '2019-3-20', 'Molly', 1);
insert into prescricao values(4, 1, '2019-3-21', '4-ACO-DMT', 50);
insert into prescricao values(5, 2, '2019-3-20',  'Xanax', 500);
insert into prescricao values(4, 3, '2019-3-22', 'Halibut Dermacare', 24);
insert into prescricao values(5, 5, '2019-5-27', 'Halibut Dermacare', 26);


insert into analise values(1, 'pediatria', 3, 1, '2019-3-18', '2019-3-19', 'Colonoscopia', 1, 'Hospital Pediatrico Kevin Spacey');
insert into analise values(2, 'otorrinolaringologia', 1, 3, '2019-3-18', '2019-3-19', 'Endoscopia', 1, 'Clinica Divoc');
insert into analise values(3, 'clinica geral', 2, 2, '2019-3-18', '2019-3-19', 'Colonoscopia', 1, 'Hospital Pediatrico Jeffrey Epstein');
insert into analise values(4, 'clinica geral', 2, 3, '2019-3-13', '2019-3-14', 'Endoscopia', 1, 'Hospital Pediatrico Kevin Spacey');
insert into analise values(5, 'estomatologia', 4, 2, '2019-3-19', '2019-3-20', 'Mentaloscopia', 1, 'Hospital Das Pessoas Extremamente Inteligentes');
insert into analise values(6, 'estomatologia', 4, 1, '2019-3-20', '2019-3-21', 'Mentaloscopia', 1, 'Hospital Das Pessoas Extremamente Inteligentes');
insert into analise values(7, 'estomatologia', 4, 1, '2019-3-21', '2019-3-22', 'Colonoscopia', 1, 'Hospital Das Pessoas Extremamente Inteligentes');
insert into analise values(8, 'monke', 5, 2, '2019-3-20', '2019-3-21', 'Mentaloscopia', 1, 'Farmacia Mac Miller');
insert into analise values(9, 'monke', 5, 3, '2019-3-22', '2019-3-25', 'Colonoscopia', 1, 'Clinica Maionese');
insert into analise values(10, 'estomatologia', 4, 3,'2019-3-22', '2019-3-25', 'Mentaloscopia', 1, 'Hospital Das Pessoas Extremamente Inteligentes');
insert into analise values(11, 'monke', 5, 5, '2019-5-27', '2019-3-28', 'Colonoscopia', 1, 'Hospital Pediatrico Kevin Spacey');


insert into venda_farmacia values(1, '2019-3-18', 'aspirina', 1000, 5000, 'Farmacia Juice WRLD');
insert into venda_farmacia values(2, '2019-3-18', 'aspirina', 1000, 5000, 'Farmacia Juice WRLD');
insert into venda_farmacia values(3, '2019-3-18', 'Codeine', 1000, 3000, 'Farmacia Amy Winehouse');
insert into venda_farmacia values(5, '2019-3-13', '4-ACO-DMT', 900, 5000, 'Farmacia Irobiso');
insert into venda_farmacia values(4, '2019-3-12', 'Xanax', 200, 5000, 'Farmacia Mac Miller');
insert into venda_farmacia values(6, '2019-3-12', 'Halibut Dermacare', 380, 16300, 'Farmacia Irobiso');
insert into venda_farmacia values(7, '2019-3-19', 'Lysergic acid diethylamide', 10000, 9000, 'Farmacia Amy Winehouse');
insert into venda_farmacia values(8, '2019-3-21', '4-ACO-DMT', 450, 2300, 'Farmacia Mac Miller');
insert into venda_farmacia values(9, '2019-3-20', 'molly', 50, 7000, 'Farmacia Irobiso');
insert into venda_farmacia values(10, '2019-3-22', 'Halibut Dermacare', 200, 867, 'Farmacia Mac Miller');


insert into prescricao_venda values(2, 2, '2019-3-18', 'aspirina', 1);
insert into prescricao_venda values(3, 1, '2019-3-18', 'Codeine', 3);
insert into prescricao_venda values(1, 2, '2019-3-18', 'aspirina', 2);
insert into prescricao_venda values(2, 3, '2019-3-13', '4-ACO-DMT', 4);
insert into prescricao_venda values(3, 3, '2019-3-11', 'Xanax', 5);
insert into prescricao_venda values(1, 2, '2019-3-12', 'Halibut Dermacare', 6);
insert into prescricao_venda values(4, 2, '2019-3-19', 'Lysergic acid diethylamide',7);
insert into prescricao_venda values(4, 1, '2019-3-21', '4-ACO-DMT', 8);
insert into prescricao_venda values(4, 1, '2019-3-20', 'Molly', 9);
insert into prescricao_venda values(4, 3, '2019-3-22', 'Halibut Dermacare', 10);