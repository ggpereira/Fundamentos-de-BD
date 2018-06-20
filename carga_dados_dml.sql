/*Carga dos dados para as tabelas normalizadas*/

insert into battle(name, year, battle_number, attacker_outcome, battle_type, major_death, major_capture, attacker_size, defender_size, summer, note)
select distinct name, year, battle_number, attacker_outcome, battle_type, major_death, major_capture, attacker_size, defender_size, summer, note
from battles_desnormalizado;

insert into region(region)
select distinct region 
from battles_desnormalizado;


insert into numbers values (1), (2), (3), (4), (5), (6), (7);

/*Table King*/
/*Carrega os dados na tabela auxiliar pois há defender_king e attacker_king*/

insert into tab_king_aux_attack(battle_number,king_name)
select battle_number, substring_index(substring_index(battles_desnormalizado.attacker_king,'/', numbers.n), '/', -1) attacker_king
from numbers inner join battles_desnormalizado on char_length(battles_desnormalizado.attacker_king)
	-char_length(replace(battles_desnormalizado.attacker_king, '/', '')) >= numbers.n - 1
where battles_desnormalizado.attacker_king != ""
order by battle_number, n;

insert into tab_king_aux_def(battle_number, king_name)
select battle_number, substring_index(substring_index(battles_desnormalizado.defender_king,'/', numbers.n), '/', -1) defender_king
from numbers inner join battles_desnormalizado on char_length(battles_desnormalizado.defender_king)
	-char_length(replace(battles_desnormalizado.defender_king, '/', '')) >= numbers.n - 1
where battles_desnormalizado.defender_king != ""
order by battle_number, n;

/*Carrega os dados da tabela auxiliar para a tabela principal king*/
insert into king(king_name) 
select distinct king_name 
from tab_king_aux_attack
UNION
select distinct king_name
from tab_king_aux_def;

/*Fim king*/

/*Tabela de reis que atacaram em batalhas*/

insert into attacker_king(battle_number, id_king)
SELECT battle_number, k.id_king FROM tab_king_aux_attack as tab inner join king as k on tab.king_name = k.king_name;

/*Tabela de reis que defenderam em batalhas*/

insert into defender_king(battle_number, id_king)
SELECT battle_number, k.id_king FROM tab_king_aux_def as tab inner join king as k on tab.king_name = k.king_name;

drop table tab_king_aux_attack;
drop table tab_king_aux_def;
/*-----------------------------------*/



/*Table Commander*/
/*Carrega os dados para a tabela auxiliar pois há defender_commander e attacker_commander -> commander*/

insert into tab_commander_aux_attack(battle_number, commander_name)
select battle_number, substring_index(substring_index(battles_desnormalizado.attacker_commander,',', numbers.n), ',', -1) attacker_commander
from numbers inner join battles_desnormalizado on char_length(battles_desnormalizado.attacker_commander)
	-char_length(replace(battles_desnormalizado.attacker_commander, ',', '')) >= numbers.n - 1
where battles_desnormalizado.attacker_commander != ""
order by battle_number, n;

insert into tab_commander_aux_def(battle_number, commander_name)
select battle_number, substring_index(substring_index(battles_desnormalizado.defender_commander,',', numbers.n), ',', -1) defender_commander
from numbers inner join battles_desnormalizado on char_length(battles_desnormalizado.defender_commander)
	-char_length(replace(battles_desnormalizado.defender_commander, ',', '')) >= numbers.n - 1
where battles_desnormalizado.defender_commander != ""
order by battle_number, n;

/*Carrega os dados da tabela auxiliar para a tabela commander*/
insert into commander(commander_name)
select distinct REPLACE(commander_name, ' ', '') 
from tab_commander_aux_attack
where commander_name != " "
UNION
select distinct REPLACE(commander_name, ' ', '') 
from tab_commander_aux_def
where commander_name != " ";

/*Fim commander*/

/*Tabela de comandantes que atacaram em batalhas*/
insert into attacker_commander(battle_number, id_commander)
SELECT battle_number, c.id_commander FROM tab_commander_aux_attack as tab inner join commander as c on REPLACE(tab.commander_name, ' ','') = c.commander_name;

/*Tabela de comandantes que atacaram em batalhas*/
insert into defender_commander(battle_number, id_commander)
SELECT battle_number, c.id_commander FROM tab_commander_aux_def as tab inner join commander as c on REPLACE(tab.commander_name, ' ', '') = c.commander_name;


/*drop table tab_commander_aux_attack;
drop table tab_commander_aux_def;*/
/*------------------------------------------------------------*/

/*Table house*/

insert into house(house_name)
select distinct attacker_1
from battles_desnormalizado
where attacker_1 != " "
UNION
select distinct attacker_2
from battles_desnormalizado
where attacker_2 != " "
UNION
select distinct attacker_3
from battles_desnormalizado
where attacker_3 != " "
UNION
select distinct attacker_4
from battles_desnormalizado
where attacker_4 != " "
UNION
select distinct defender_1
from battles_desnormalizado
where defender_1 != " "
UNION
select distinct defender_2
from battles_desnormalizado
where defender_2 != " "
UNION
select distinct defender_3
from battles_desnormalizado
where defender_3 != " "
UNION
select distinct defender_4
from battles_desnormalizado
where defender_4 != " ";

/*---------------------*/

/*Carga para a tabela attacker*/
INSERT INTO attacker(battle_number, id_house)
SELECT battle_number, h.id_house FROM battles_desnormalizado as bd inner join house as h on bd.attacker_1 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado as bd inner join house as h on bd.attacker_2 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado as bd inner join house as h on bd.attacker_3 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado as bd inner join house as h on bd.attacker_4 = h.house_name;

/*----------------------------------------------*/

/*Carga para a tabela defender*/
INSERT INTO defender(battle_number, id_house)
SELECT battle_number, h.id_house FROM battles_desnormalizado as bd inner join house as h on bd.defender_1 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado as bd inner join house as h on bd.defender_2 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado as bd inner join house as h on bd.defender_3 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado as bd inner join house as h on bd.defender_4 = h.house_name;


/*----------------------------------------------*/
