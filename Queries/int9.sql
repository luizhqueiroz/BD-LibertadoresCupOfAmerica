.mode columns
.headers on
.nullvalue NULL

-- Qual o numero de cartoes que cada posicao recebeu?

select count(*) as "Número de cartões", positionName as "Posição" 
from Cartao as C, Player as P, Position as Pos 
where C.player_id = P.player_id and P.player_id = Pos.player_id
group by positionName;
