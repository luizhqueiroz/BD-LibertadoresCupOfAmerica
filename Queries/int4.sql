.mode columns
.headers on
.nullvalue NULL

-- Quais os eventos que aconteceram no primeiro tempo de cada jogo?

SELECT game_id AS Game_ID,
           G.minute AS Time,
           (
               SELECT nome
                 FROM Player P
                WHERE P.player_id == Substitution.playerIn
           )
           AS None,
           (
               SELECT nome
                 FROM Player P
                WHERE P.player_id == Substitution.playerOut
           )
           AS None
      FROM Substitution
           JOIN
           GameEvent G USING (
               event_id
           )
     WHERE G.minute < '00:45:00'
    UNION
    SELECT game_id,
           C.minute,
           color,
           P.nome
      FROM Cartao C
           JOIN
           Player P USING (
               player_id
           )
           JOIN
           GameEvent USING (
               event_id
           )
     WHERE C.minute < '00:45:00'
    UNION
    SELECT game_id,
           G.minute,
           nome,
           (
               SELECT nome
                 FROM Team
                WHERE Team.team_id == G.team_id
           )
      FROM Goal G
           JOIN
           Player P USING (
               player_id
           )
           JOIN
           GameEvent USING (
               event_id
           )
     WHERE G.minute < '00:45:00';
