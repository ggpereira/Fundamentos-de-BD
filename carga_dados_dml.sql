/*Carga dos dados para as tabelas normalizadas*/

INSERT INTO battle(name, year, battle_number, attacker_outcome, battle_type, major_death, major_capture, attacker_size, defender_size, summer, note)
SELECT DISTINCT name, year, battle_number, attacker_outcome, battle_type, major_death, major_capture, attacker_size, defender_size, summer, note
FROM battles_desnormalizado;

INSERT INTO region(region)
SELECT DISTINCT region 
FROM battles_desnormalizado;


INSERT INTO numbers VALUE (1), (2), (3), (4), (5), (6), (7);


/*Tabela auxiliar*/

INSERT INTO tab_aux_location(battle_number, location)
SELECT battle_number, SUBSTRING_INDEX(SUBSTRING_INDEX(battles_desnormalizado.location,',', numbers.n), ',', -1) location
FROM numbers INNER JOIN battles_desnormalizado ON CHAR_LENGTH(battles_desnormalizado.location)
	-CHAR_LENGTH(replace(battles_desnormalizado.location, ',', '')) >= numbers.n - 1
WHERE battles_desnormalizado.location != ""
ORDER BY battle_number, n;

/*carga das regiões onde ocorreram batalhas*/
INSERT INTO region_battle(battle_number, id_region)
SELECT bd.battle_number, r.id_region FROM region AS r INNER JOIN battles_desnormalizado AS bd ON r.region = bd.region;

/*Carga para location*/
INSERT INTO location(location)
SELECT DISTINCT location 
FROM tab_aux_location;



/*Carrega os locais onde ocorreram batalhas*/
INSERT INTO location_battle(battle_number, id_location) 
SELECT battle_number, l.id_location
FROM tab_aux_location AS tab INNER JOIN location AS l ON tab.location = l.location; 



DROP TABLE tab_aux_location;
/*-------------------------------------------------*/
/*Table King*/
/*Carrega os dados na tabela auxiliar pois há defender_king e attacker_king*/

INSERT INTO tab_king_aux_attack(battle_number,king_name)
SELECT battle_number, SUBSTRING_INDEX(SUBSTRING_INDEX(battles_desnormalizado.attacker_king,'/', numbers.n), '/', -1) attacker_king
FROM numbers INNER JOIN battles_desnormalizado ON CHAR_LENGTH(battles_desnormalizado.attacker_king)
	-CHAR_LENGTH(REPLACE(battles_desnormalizado.attacker_king, '/', '')) >= numbers.n - 1
WHERE battles_desnormalizado.attacker_king != ""
ORDER BY battle_number, n;

INSERT INTO tab_king_aux_def(battle_number, king_name)
SELECT battle_number, SUBSTRING_INDEX(SUBSTRING_INDEX(battles_desnormalizado.defender_king,'/', numbers.n), '/', -1) defender_king
FROM numbers INNER JOIN battles_desnormalizado ON CHAR_LENGTH(battles_desnormalizado.defender_king)
	-CHAR_LENGTH(REPLACE(battles_desnormalizado.defender_king, '/', '')) >= numbers.n - 1
WHERE battles_desnormalizado.defender_king != ""
ORDER BY battle_number, n;

/*Carrega os dados da tabela auxiliar para a tabela principal king*/
INSERT INTO king(king_name) 
SELECT DISTINCT king_name 
FROM tab_king_aux_attack
UNION
SELECT DISTINCT king_name
FROM tab_king_aux_def;

/*Fim king*/

/*Tabela de reis que atacaram em batalhas*/

INSERT INTO attacker_king(battle_number, id_king)
SELECT battle_number, k.id_king FROM tab_king_aux_attack AS tab INNER JOIN king AS k ON tab.king_name = k.king_name;

/*Tabela de reis que defenderam em batalhas*/

INSERT INTO defender_king(battle_number, id_king)
SELECT battle_number, k.id_king FROM tab_king_aux_def AS tab INNER JOIN king AS k ON tab.king_name = k.king_name;

DROP TABLE tab_king_aux_attack;
DROP TABLE tab_king_aux_def;
/*-----------------------------------*/



/*Table Commander*/
/*Carrega os dados para a tabela auxiliar pois há defender_commander e attacker_commander -> commander*/

INSERT INTO tab_commander_aux_attack(battle_number, commander_name)
SELECT battle_number, SUBSTRING_INDEX(SUBSTRING_INDEX(battles_desnormalizado.attacker_commander,',', numbers.n), ',', -1) attacker_commander
FROM numbers INNER JOIN battles_desnormalizado ON CHAR_LENGTH(battles_desnormalizado.attacker_commander)
	-CHAR_LENGTH(REPLACE(battles_desnormalizado.attacker_commander, ',', '')) >= numbers.n - 1
WHERE battles_desnormalizado.attacker_commander != ""
ORDER BY battle_number, n;

INSERT INTO tab_commander_aux_def(battle_number, commander_name)
SELECT battle_number, SUBSTRING_INDEX(SUBSTRING_INDEX(battles_desnormalizado.defender_commander,',', numbers.n), ',', -1) defender_commander
FROM numbers INNER JOIN battles_desnormalizado ON CHAR_LENGTH(battles_desnormalizado.defender_commander)
	-CHAR_LENGTH(REPLACE(battles_desnormalizado.defender_commander, ',', '')) >= numbers.n - 1
WHERE battles_desnormalizado.defender_commander != ""
ORDER BY battle_number, n;

/*Carrega os dados da tabela auxiliar para a tabela commander*/
INSERT INTO commander(commander_name)
SELECT DISTINCT REPLACE(commander_name, ' ', '') 
FROM tab_commander_aux_attack
WHERE commander_name != " "
UNION
SELECT DISTINCT REPLACE(commander_name, ' ', '') 
FROM tab_commander_aux_def
WHERE commander_name != " ";

/*Fim commander*/

/*Tabela de comandantes que atacaram em batalhas*/
INSERT INTO attacker_commander(battle_number, id_commander)
SELECT battle_number, c.id_commander 
FROM tab_commander_aux_attack AS tab INNER JOIN commander AS c ON REPLACE(tab.commander_name, ' ','') = c.commander_name;

/*Tabela de comandantes que atacaram em batalhas*/
INSERT INTO defender_commander(battle_number, id_commander)
SELECT battle_number, c.id_commander 
FROM tab_commander_aux_def AS tab INNER JOIN commander AS c ON REPLACE(tab.commander_name, ' ', '') = c.commander_name;


/*Descarta as tabelas auxiliares*/
DROP TABLE tab_commander_aux_attack;
DROP TABLE tab_commander_aux_def;
DROP TABLE numbers;

/*------------------------------------------------------------*/

/*Table house*/

INSERT INTO house(house_name)
SELECT DISTINCT attacker_1
FROM battles_desnormalizado
WHERE attacker_1 != " "
UNION
SELECT DISTINCT attacker_2
FROM battles_desnormalizado
WHERE attacker_2 != " "
UNION
SELECT DISTINCT attacker_3
FROM battles_desnormalizado
WHERE attacker_3 != " "
UNION
SELECT DISTINCT attacker_4
FROM battles_desnormalizado
WHERE attacker_4 != " "
UNION
SELECT DISTINCT  defender_1
FROM battles_desnormalizado
WHERE defender_1 != " "
UNION
SELECT DISTINCT defender_2
FROM battles_desnormalizado
WHERE defender_2 != " "
UNION
SELECT DISTINCT defender_3
FROM battles_desnormalizado
WHERE defender_3 != " "
UNION
SELECT DISTINCT defender_4
FROM battles_desnormalizado
WHERE defender_4 != " ";

/*---------------------*/

/*Carga para a tabela attacker*/
INSERT INTO attacker(battle_number, id_house)
SELECT battle_number, h.id_house FROM battles_desnormalizado AS bd INNER JOIN house AS h ON bd.attacker_1 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado AS bd INNER JOIN house AS h ON bd.attacker_2 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado AS bd INNER JOIN house AS h ON bd.attacker_3 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado AS bd INNER JOIN house AS h ON bd.attacker_4 = h.house_name;

/*----------------------------------------------*/

/*Carga para a tabela defender*/
INSERT INTO defender(battle_number, id_house)
SELECT battle_number, h.id_house FROM battles_desnormalizado AS bd INNER JOIN house AS h ON bd.defender_1 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado AS bd INNER JOIN house AS h ON bd.defender_2 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado AS bd INNER JOIN house AS h ON bd.defender_3 = h.house_name
UNION
SELECT battle_number, h.id_house FROM battles_desnormalizado AS bd INNER JOIN house AS h ON bd.defender_4 = h.house_name;


/*----------------------------------------------*/

/*Ao longo do código é feito drop das tabelas auxiliares, portanto ao final, só ficam as tabelas normalizadas e a desnormalizada de onde foram 
extraídos os dados*/

/*Ao final temos os dados inseridos no banco normalizado*/
