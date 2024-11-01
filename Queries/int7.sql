.mode columns
.headers on
.nullvalue NULL


-- Quantos golos cada equipa marcou e quantos cartoes cada equipa recebeu?

select nome, card as 'Número de cartões', goals as 'Número de gols' 
from (select * from (select count(*) as "card", T.nome, T.team_id 
    from Cartao as C, Team as T, Player as P
    where C.player_id = P.player_id and P.team_id = T.team_id
    group by T.nome) as F 
join (select count(*) as "goals", T.nome, T.team_id
    from Goal as G, Team as T
    where G.team_id = T.team_id
    group by T.nome) as J on F.team_id = J.team_id)
    
