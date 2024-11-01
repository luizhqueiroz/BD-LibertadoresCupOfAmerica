.mode columns
.headers on
.nullvalue NULL

-- Quantas substituições foram realizadas em cada estádio?

SELECT count(event_id) AS N_SUBSTITUTIONS,
           S.nome AS [STADIUM NAME],
           S.place AS PLACE
      FROM Substitution AS Su
           JOIN
           gameevent AS GE USING (
               event_id
           )
           JOIN
           Game Ga USING (
               game_id
           )
           JOIN
           Stadium S USING (
               stadium_id
           )
     GROUP BY stadium_id
     ORDER BY N_SUBSTITUTIONS DESC;
