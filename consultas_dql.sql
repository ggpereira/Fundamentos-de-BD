USE gotbattles;

/* Número de batalhas que aconteceram em riverrun */
SELECT count(lb.battle_number) 
FROM location as l natural join location_battle as lb
WHERE l.location = "Riverrun" /*and l.id_location = lb.id_location??*/