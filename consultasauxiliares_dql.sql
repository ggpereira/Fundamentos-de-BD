USE gotbattles;

SELECT * FROM battle;

SELECT * FROM region;

SELECT * FROM tab_king_aux_attack;

SELECT * FROM tab_king_aux_def;

SELECT * FROM king;

SELECT * FROM tab_commander_aux_attack;

SELECT * FROM tab_commander_aux_def;


SELECT * FROM commander;

SELECT * FROM house;

SELECT battle_number, k.id_king, tab.king_name 
FROM tab_king_aux_attack as tab inner join king as k on tab.king_name = k.king_name;

SELECT * FROM attacker_king;

SELECT battle_number, k.id_king, tab.king_name 
FROM tab_king_aux_def as tab inner join king as k on tab.king_name = k.king_name;

SELECT * FROM defender_king;


SELECT battle_number, h.id_house, h.house_name 
FROM battles_desnormalizado as bd inner join house as h on bd.attacker_1 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name 
FROM battles_desnormalizado as bd inner join house as h on bd.attacker_2 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name 
FROM battles_desnormalizado as bd inner join house as h on bd.attacker_3 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name 
FROM battles_desnormalizado as bd inner join house as h on bd.attacker_4 = h.house_name;


SELECT battle_number, h.id_house, h.house_name 
FROM battles_desnormalizado as bd inner join house as h on bd.defender_1 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name 
FROM battles_desnormalizado as bd inner join house as h on bd.defender_2 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name 
FROM battles_desnormalizado as bd inner join house as h on bd.defender_3 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name 
FROM battles_desnormalizado as bd inner join house as h on bd.defender_4 = h.house_name;

SELECT * FROM attacker;

SELECT * FROM defender;


SELECT * FROM attacker_commander;

SELECT * FROM commander;

SELECT * FROM tab_commander_aux_attack;

SELECT * FROM location;

select region from region;

SELECT battle_number, c.id_commander 
FROM tab_commander_aux_attack as tab inner join commander as c on tab.commander_name = c.commander_name;

SELECT bd.battle_number, r.region, l.location 
FROM region as r inner join battles_desnormalizado as bd on r.region = bd.region 
	left join tab_aux_location as l on l.battle_number = bd.battle_number;

/*SELECT bd.battle_number, tab.location, FROM (tab_aux_location as tab inner join battles_desnormalizado as bd on  tab.battle_number = bd.battle_number) 
*/

SELECT * FROM location_battle;

SELECT * FROM tab_aux_location;

select bd.battle_number, tab.id_location
from tab_aux_location as tab  join battles_desnormalizado as bd on tab.battle_number = bd.battle_number;


/*UNION
select distinct REPLACE(commander_name, ' ', '') 
from tab_commander_aux_def
where commander_name != " ";*/