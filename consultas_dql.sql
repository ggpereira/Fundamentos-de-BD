USE gotbattles;

/* Número de batalhas que aconteceram em riverrun */

SELECT count(lb.battle_number) 
FROM location as l natural join location_battle as lb
WHERE l.location = "Riverrun";

/*Retorna o nome das batalhas em que Robb Stark atuou como rei e/ou comandante*/

SELECT b.name
FROM battle as b join (
	SELECT list_k.battle_number /* Se extrai as batalhas com as especificações abaixo*/
	FROM king as k join (
		SELECT * /* Junta-se a lista de reis atacantes e defensor */
		FROM attacker_king
		UNION
		SELECT *
		FROM defender_king) as list_k
	WHERE k.id_king = list_k.id_king and k.king_name = "Robb Stark" /* Se isola apenas as batalhas onde Robb Stark atua (como rei) */
	UNION /* Junta-se a lista de reis com a lista de comandantes */
	SELECT list_c.battle_number
	FROM commander as c join (
		SELECT * /* Junta-se a lista de comandantes atacantes e defensor */
		FROM attacker_commander
		UNION
		SELECT *
		FROM defender_commander) as list_c 
	WHERE c.id_commander = list_c.id_commander and c.commander_name = "RobbStark" /* Se isola apenas as batalhas onde Robb Stark atua (como rei) */
) as robb_battles /* Retorna uma lista de batalhas (battle_numbers) em que Robb Stark fez parte */
WHERE b.battle_number = robb_battles.battle_number
ORDER BY robb_battles.battle_number;
/*
(SELECT *
FROM house as h natural join attacker as atk
WHERE )*/

SELECT *
FROM battles_desnormalizado
