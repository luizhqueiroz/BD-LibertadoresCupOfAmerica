.mode columns
.headers on
.nullvalue NULL

-- Quais os jogadores, com peso maior ou igual a 70kg, que receberam cartão vermelho em cada período?

SELECT p.nome as Name,
           p.shirt_number as N_SHIRT,
           S.nome as Stage
      FROM Cartao
           INNER JOIN
           Player AS p USING (
               player_id
           )
           INNER JOIN
           gameevent AS GE USING (
               event_id
           )
           INNER JOIN
           gamestage AS GS USING (
               game_id
           )
           INNER JOIN
           stage AS S USING (
               stage_id
           )
     WHERE color == 'RED' AND 
           p.peso >= 70
     ORDER BY S.period_id,
              p.peso;
