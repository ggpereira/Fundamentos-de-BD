drop database if exists gotbattles;

create database gotbattles DEFAULT CHARACTER SET = utf8;

use gotbattles;

create table battles_desnormalizado(
    name  varchar(45) not null,
    year integer not null,
    battle_number integer not null, 
    attacker_king varchar(45), 
    defender_king varchar(45),
    attacker_1 varchar(45),
    attacker_2 varchar(45),
    attacker_3 varchar(45),
    attacker_4 varchar(45),
    defender_1 varchar(45),
    defender_2 varchar(45),
    defender_3 varchar(45),
    defender_4 varchar(45),
    attacker_outcome varchar(5),
    battle_type varchar(30),
    major_death integer,
    major_capture integer, 
    attacker_size integer,
    defender_size integer, 
    attacker_commander varchar(45),
    defender_commander varchar(45),
    summer integer, 
    location varchar(45),
    region varchar(45),
    note text,
    primary key(battle_number)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
