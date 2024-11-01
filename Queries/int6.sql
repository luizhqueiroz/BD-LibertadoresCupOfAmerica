.mode columns 
.headers on 
.nullvalue NULL

-- Quais os jogadores que foram inscritos em todos os períodos?

SELECT T1.P AS PLAYERID,
           P.nome AS NAME
      FROM (
               SELECT count( * ) AS PERIOD,
                      player_id AS P
                 FROM Registration,
                      (
                          SELECT count( * ) AS C
                            FROM registrationperiod
                      )
                      AS V
                GROUP BY player_id
               HAVING PERIOD == V.C
           )
           T1,
           Player P
     WHERE P.player_id == T1.P
     ORDER BY PLAYERID;
