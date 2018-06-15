drop database if exists gotbattles;

create database gotbattles;

use gotbattles;

create table battles(
    name  varchar(45) not null,
    year int not null,
    battle_number int not null, 
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
    major_death int,
    major_capture int, 
    attacker_size int,
    defender_size int, 
    attacker_commander varchar(45),
    defender_commander varchar(45),
    summer int, 
    location varchar(45),
    region varchar(45),
    note text,
    primary key(battle_number)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
