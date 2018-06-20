USE gotbattles;


create table battle(
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

create table king(
	id_king integer not null auto_increment,
    king_name varchar(64),
    PRIMARY KEY(id_king)
);

create table commander(
	id_commander integer not null auto_increment, 
    commander_name varchar(64),
	PRIMARY KEY(id_commander)
);

create table region(
	id_region integer not null auto_increment,
    region varchar(64),
    PRIMARY KEY(id_region)
);

create table location(
	id_location integer  not null auto_increment, 
    location varchar(64),
    id_region integer,
    FOREIGN KEY (id_region) references region(id_region),
    PRIMARY KEY(id_location)
);

create table attacker_king(
	battle_number integer not null, 
    id_king integer not null,
	foreign key(battle_number) references battle(battle_number), 
    foreign key(id_king) references king(id_king),
    PRIMARY KEY(battle_number, id_king)
);

create table defender_king(
	battle_number integer not null, 
    id_king integer not null,
	foreign key(battle_number) references battle(battle_number), 
    foreign key(id_king) references king(id_king),
    PRIMARY KEY(battle_number, id_king)
);

create table attacker_commander(
	battle_number integer not null, 
    id_commander integer not null,
	foreign key(battle_number) references battle(battle_number), 
    foreign key(id_commander) references commander(id_commander),
    PRIMARY KEY(battle_number, id_commander)
);

create table defender_commander(
	battle_number integer not null, 
    id_commander integer not null,
	foreign key(battle_number) references battle(battle_number), 
    foreign key(id_commander) references commander(id_commander),
    PRIMARY KEY(battle_number, id_commander)
);

create table tab_location_battle(
	battle_number integer not null,
    id_location integer not null, 
    foreign key(battle_number) references battle(battle_number),
    foreign key(id_location) references location(id_location),
    PRIMARY KEY(battle_number, id_location)
);

create table house(
	id_house integer not null auto_increment, 
    house_name varchar(64),
    PRIMARY KEY(id_house)
);

create table attacker(
	battle_number integer not null,
    id_house integer not null,
	foreign key(battle_number) references battle(battle_number),
    foreign key(id_house) references house(id_house),
	PRIMARY KEY(battle_number, id_house)
);

create table defender(
	battle_number integer not null,
    id_house integer not null,
	foreign key(battle_number) references battle(battle_number),
    foreign key(id_house) references house(id_house),
	PRIMARY KEY(battle_number, id_house)
);

