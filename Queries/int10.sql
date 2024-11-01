.mode columns
.headers on
.nullvalue NULL

-- Quais os dois jogadores que tem um numero de golos mais parecido entre si?
SELECT a.nome AS NomeA,
           b.nome AS NomeB,
           abs(a.goals - b.goals) AS DIFF,
           a.goals AS GoalsA,
           b.goals AS GoalsB
      FROM (
               SELECT P.nome,
                      count(event_id) AS goals
                 FROM Player P
                      JOIN
                      Goal G USING (
                          player_id
                      )
                GROUP BY player_id
           )
           AS a,
           (
               SELECT P.nome,
                      count(event_id) AS goals
                 FROM Player P
                      JOIN
                      Goal G USING (
                          player_id
                      )
                GROUP BY player_id
           )
           AS b
     WHERE a.nome < b.nome
     ORDER BY abs(a.goals - b.goals),
              GoalsA DESC,
              NomeA;
