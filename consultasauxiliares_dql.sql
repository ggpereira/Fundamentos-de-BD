USE gotbattles;

SELECT * FROM battle;

SELECT * FROM region;

SELECT * FROM tab_king_aux_attack;

SELECT * FROM tab_king_aux_def;

SELECT * FROM king;

SELECT * FROM tab_commander_aux;

SELECT * FROM commander;

SELECT * FROM house;

SELECT battle_number, k.id_king, tab.king_name FROM tab_king_aux_attack as tab inner join king as k on tab.king_name = k.king_name;

SELECT * FROM attacker_king;

SELECT battle_number, k.id_king, tab.king_name FROM tab_king_aux_def as tab inner join king as k on tab.king_name = k.king_name;

SELECT * FROM defender_king;


SELECT battle_number, h.id_house, h.house_name FROM battles_desnormalizado as bd inner join house as h on bd.attacker_1 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name FROM battles_desnormalizado as bd inner join house as h on bd.attacker_2 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name FROM battles_desnormalizado as bd inner join house as h on bd.attacker_3 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name FROM battles_desnormalizado as bd inner join house as h on bd.attacker_4 = h.house_name;


SELECT battle_number, h.id_house, h.house_name FROM battles_desnormalizado as bd inner join house as h on bd.defender_1 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name FROM battles_desnormalizado as bd inner join house as h on bd.defender_2 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name FROM battles_desnormalizado as bd inner join house as h on bd.defender_3 = h.house_name
UNION
SELECT battle_number, h.id_house, h.house_name FROM battles_desnormalizado as bd inner join house as h on bd.defender_4 = h.house_name;

SELECT * FROM attacker;

SELECT * FROM defender;


SELECT * FROM attacker_commander;

SELECT * FROM commander;

SELECT * FROM tab_commander_aux_attack;
