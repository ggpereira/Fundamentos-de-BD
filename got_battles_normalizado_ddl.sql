USE gotbattles;


CREATE TABLE battle(
	name varchar(64), 
    year integer not null,
	battle_number integer not null,
    attacker_outcome varchar(5),
	battle_type varchar(64),
	major_death integer, 
    major_capture integer, 
    attacker_size integer,
    defender_size integer,
    summer integer,
    note text,
    PRIMARY KEY(battle_number)
);	

CREATE TABLE king(
	id_king integer not null auto_increment,
    king_name varchar(64),
    PRIMARY KEY(id_king)
);

CREATE TABLE commander(
	id_commander integer not null auto_increment, 
    commander_name varchar(64),
	PRIMARY KEY(id_commander)
);

CREATE TABLE region(
	id_region integer not null auto_increment,
    region varchar(64),
    PRIMARY KEY(id_region)
);

CREATE TABLE location(
	id_location integer  not null auto_increment, 
    location varchar(64),
    PRIMARY KEY(id_location)
);

CREATE TABLE attacker_king(
	battle_number integer not null, 
    id_king integer not null,
	foreign key(battle_number) references battle(battle_number), 
    foreign key(id_king) references king(id_king),
    PRIMARY KEY(battle_number, id_king)
);

CREATE TABLE defender_king(
	battle_number integer not null, 
    id_king integer not null,
	foreign key(battle_number) references battle(battle_number), 
    foreign key(id_king) references king(id_king),
    PRIMARY KEY(battle_number, id_king)
);

CREATE TABLE attacker_commander(
	battle_number integer not null, 
    id_commander integer not null,
	foreign key(battle_number) references battle(battle_number), 
    foreign key(id_commander) references commander(id_commander),
    PRIMARY KEY(battle_number, id_commander)
);

CREATE TABLE defender_commander(
	battle_number integer not null, 
    id_commander integer not null,
	foreign key(battle_number) references battle(battle_number), 
    foreign key(id_commander) references commander(id_commander),
    PRIMARY KEY(battle_number, id_commander)
);

CREATE TABLE location_battle(
	battle_number integer not null,
    id_location integer not null,
    foreign key(battle_number) references battle(battle_number),
    foreign key(id_location) references location(id_location),
    PRIMARY KEY(battle_number, id_location)
);

CREATE TABLE region_battle(
	battle_number integer not null,
    id_region integer not null,
    foreign key(battle_number) references battle(battle_number),
    foreign key(id_region) references region(id_region),
    PRIMARY KEY(battle_number, id_region)
);


CREATE TABLE house(
	id_house integer not null auto_increment, 
    house_name varchar(64),
    PRIMARY KEY(id_house)
);

CREATE TABLE attacker(
	battle_number integer not null,
    id_house integer not null,
	foreign key(battle_number) references battle(battle_number),
    foreign key(id_house) references house(id_house),
	PRIMARY KEY(battle_number, id_house)
);

CREATE TABLE defender(
	battle_number integer not null,
    id_house integer not null,
	foreign key(battle_number) references battle(battle_number),
    foreign key(id_house) references house(id_house),
	PRIMARY KEY(battle_number, id_house)
);

