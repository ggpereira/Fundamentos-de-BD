USE gotbattles;
/*Tabelas auxiliares*/
CREATE TABLE numbers(
	n integer
);

CREATE TABLE tab_king_aux_attack(
	id_king integer auto_increment,
    battle_number integer,
	king_name varchar(64),
	PRIMARY KEY(id_king)
);

CREATE TABLE tab_king_aux_def(
	id_king integer auto_increment,
    battle_number integer,
	king_name varchar(64),
	PRIMARY KEY(id_king)
);

CREATE TABLE tab_commander_aux_attack(
	id_commander integer auto_increment,
    battle_number integer,
    commander_name varchar(64),
    PRIMARY KEY(id_commander)
);


CREATE TABLE tab_commander_aux_def(
	id_commander integer auto_increment,
    battle_number integer,
    commander_name varchar(64),
    PRIMARY KEY(id_commander)
);

CREATE TABLE tab_aux_location(
	id_location integer auto_increment, 
	battle_number integer,
    location varchar(64),
    PRIMARY KEY(id_location)
);
