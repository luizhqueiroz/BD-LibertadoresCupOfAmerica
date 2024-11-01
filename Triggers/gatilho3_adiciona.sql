.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- trigger to check if player substitution is valid
CREATE TRIGGER check_player_substitution
BEFORE INSERT ON Substitution
BEGIN
    SELECT CASE
        WHEN (SELECT team_id FROM Player WHERE player_id = NEW.playerIn) <> (SELECT team_id FROM Player WHERE player_id = NEW.playerOut)
        THEN RAISE(ROLLBACK, 'Player substitution is not valid')
    END;
END;
