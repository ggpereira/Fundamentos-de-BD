/*Tabelas auxiliares*/
create table numbers(
	n integer
);

create table tab_king_aux_attack(
	id_king integer auto_increment,
    battle_number integer,
	king_name varchar(64),
	PRIMARY KEY(id_king)
);

create table tab_king_aux_def(
	id_king integer auto_increment,
    battle_number integer,
	king_name varchar(64),
	PRIMARY KEY(id_king)
);

create table tab_commander_aux_attack(
	id_commander integer auto_increment,
    battle_number integer,
    commander_name varchar(64),
    PRIMARY KEY(id_commander)
);


create table tab_commander_aux_def(
	id_commander integer auto_increment,
    battle_number integer,
    commander_name varchar(64),
    PRIMARY KEY(id_commander)
);
