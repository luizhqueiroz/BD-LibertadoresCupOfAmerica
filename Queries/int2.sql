.mode columns
.headers on
.nullvalue NULL

-- Quais sao os jogos de cada jornada?

SELECT G.jornada AS ROUND,
           G.dia AS DATE,
           (
               SELECT nome
                 FROM Team AS T
                WHERE T.team_id == HT.team_id
           )
           AS [HOME TEAM],
           (
               SELECT nome
                 FROM Team AS T
                WHERE T.team_id == AT.team_id
           )
           AS [AWAY TEAM],
           (
               SELECT place
                 FROM Stadium AS S
                WHERE S.stadium_id == G.stadium_id
           )
           AS PLACE
      FROM Game G,
           HomeTeam HT,
           AwayTeam AT
     WHERE G.game_id = HT.game_id AND 
           G.game_id = AT.game_id
     ORDER BY jornada;
