USE gotbattles;

LOAD DATA LOCAL INFILE 'C:/Users/gabri/Documents/Fundamentos-de-BD/battles2.csv'
INTO TABLE battles_desnormalizado
CHARACTER SET utf8
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    name, 
    year,
    battle_number, 
    attacker_king,  
    defender_king, 
    attacker_1,
    attacker_2, 
    attacker_3, 
    attacker_4, 
    defender_1, 
    defender_2, 
    defender_3, 
    defender_4, 
    attacker_outcome, 
    battle_type, 
    @major_death, 
    @major_capture,  
    @attacker_size, 
    @defender_size, 
    attacker_commander, 
    defender_commander, 
    @summer, 
    location,
    region,
    note
)

SET major_death = if(@major_death = "", null, @major_death)
, major_capture = if(@major_capture = "", null, @major_capture)
, attacker_size = if(@attacker_size = "", null, @attacker_size)
, defender_size = if(@defender_size = "", null, @defender_size)
, summer = if(@summer = "", null, @summer)



