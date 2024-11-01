.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- trigger to update player's team after new Registration
CREATE TRIGGER update_player_team
AFTER INSERT ON Registration
BEGIN
    UPDATE Player SET team_id = NEW.team_id WHERE player_id = NEW.player_id;
END;
