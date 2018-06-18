<h1>Fundamentos de Banco de Dados</h1>
    <h2>Banco de dados - Batalhas em Game of Thrones</h2>

<h3>Esquema relacional da Tabela Desnormalizada</h3>
<p>
    battles(name, year, <strong>battle_number</strong>, attacker_king, defender_king, attacker_1, attacker_2, attacker_3, attacker_4, defender_1, defender_2, defender_3, defender_4 , attacker_outcome, battle_type, major_death, major_capture, attacker_size, defender_size, attacker_commander, defender_commander, summer, location, region, note)
</p>

<h2>Normalização</h2>
<h3>Esquema - 1FN</h3>
<p>  
battle(name, year, <u><strong>battle_number</strong></u>,  attacker_1, attacker_2, attacker_3, attacker_4, defender_1, defender_2, defender_3 defender_4, attacker_outcome, battle_type, major_death,  major_capture, attacker_size, defender_size, note)

attacker_king(__**battle_number, id_king**__</strong> , king_name)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;battle_number referencia battle<br/>
defender_king(<strong>battle_number,  id_king</strong> ,king_name)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;battle_number referencia battle<br/>
attacker_commander(<strong>battle_number, id_commander</strong>, commander_name)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;battle_number referencia battle<br/>
defender_commander(<strong>battle_number, id_commander</strong>, commander_name)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;battle_number referencia battle<br/>

</p>

<h4>Dependências funcionais</h4>
<p>Fazer</p>
<h3>Esquema - 2FN</h3>
<p> Fazer </p>

<h3>Esquema - 3FN </h3>
<p>?Fazer</p>
