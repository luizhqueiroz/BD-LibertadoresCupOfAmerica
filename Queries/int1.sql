.mode columns 
.headers on 
.nullvalue NULL

-- Qual a equipa vencedora em cada jogo?

SELECT F.game_id,
           F.AWname AS [AWAY TEAM],
           F.HMname AS [HOME TEAM],
           Team.nome AS WINNER
      FROM (
               SELECT G.game_id,
                      T1.nome AS AWname,
                      T2.nome AS HMname
                 FROM Game G,
                      AwayTeam AW,
                      HomeTeam HM,
                      Team T1,
                      Team T2
                WHERE G.game_id = AW.game_id AND 
                      G.game_id = HM.game_id AND 
                      T1.team_id = AW.team_id AND 
                      T2.team_id = HM.team_id
           )
           AS F,
           (
               SELECT game_id,
                      team_id,
                      max(gol) 
                 FROM (
                          SELECT GameEvent.game_id,
                                 Goal.team_id,
                                 count(Goal.event_id) AS gol
                            FROM GameEvent,
                                 Goal
                           WHERE GameEvent.event_id = Goal.event_id
                           GROUP BY GameEvent.game_id,
                                    Goal.team_id
                      )
                GROUP BY game_id
           )
           AS S,
           Team
     WHERE F.game_id = S.game_id AND 
           Team.team_id = S.team_id;