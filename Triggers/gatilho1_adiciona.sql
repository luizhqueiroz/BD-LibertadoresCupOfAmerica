--trigger to add

.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- trigger to block player from receiving any card after receiving a red card in the same game
CREATE TRIGGER add_player_card_red
AFTER INSERT ON Cartao
BEGIN
    SELECT CASE
        WHEN EXISTS (SELECT 1 FROM Cartao JOIN GameEvent ON Cartao.event_id = GameEvent.event_id WHERE Cartao.player_id = NEW.player_id AND Cartao.color = 'RED' AND GameEvent.game_id = (SELECT game_id FROM GameEvent WHERE event_id = NEW.event_id) GROUP BY Cartao.player_id HAVING COUNT(*) > 1)
        THEN RAISE(ABORT, 'Player already received a red card in this game')
    END;
END;

-- trigger to block player receiving more than 2 yellow cards in the same game
CREATE TRIGGER add_player_card_yellow
AFTER INSERT ON Cartao
BEGIN
    SELECT CASE
        WHEN EXISTS (SELECT 1 FROM Cartao JOIN GameEvent ON Cartao.event_id = GameEvent.event_id WHERE Cartao.player_id = NEW.player_id AND Cartao.color = 'YELLOW' AND GameEvent.game_id = (SELECT game_id FROM GameEvent WHERE event_id = NEW.event_id) GROUP BY Cartao.player_id HAVING COUNT(*) > 2)
        THEN RAISE(ABORT, 'Player already received 2 yellow cards in this game')
    END;
END;


