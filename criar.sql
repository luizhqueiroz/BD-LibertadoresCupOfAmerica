PRAGMA foreign_keys = on;

DROP TABLE IF EXISTS Substitution;
DROP TABLE IF EXISTS Goal;
DROP TABLE IF EXISTS Cartao;
DROP TABLE IF EXISTS GameEvent;
DROP TABLE IF EXISTS Registration;
DROP TABLE IF EXISTS Position;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS GameStage;
DROP TABLE IF EXISTS Stage;
DROP TABLE IF EXISTS RegistrationPeriod;
DROP TABLE IF EXISTS AwayTeam;
DROP TABLE IF EXISTS HomeTeam;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS SponsorPlacement;
DROP TABLE IF EXISTS Sponsorship;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Stadium;

-- Table Stadium

CREATE TABLE Stadium(
    stadium_id  INTEGER PRIMARY KEY,
    nome        TEXT CONSTRAINT nn_stadium_name NOT NULL,
    place       TEXT CONSTRAINT nn_stadium_place NOT NULL,
    capacity    INTEGER CONSTRAINT nn_stadium_capacity NOT NULL
    CONSTRAINT capacity CHECK(capacity >= 0)
);


-- Table TEAM

CREATE TABLE Team(
    team_id     INTEGER PRIMARY KEY,
    nome        TEXT CONSTRAINT nn_team_name NOT NULL,
    country     TEXT CONSTRAINT nn_team_country NOT NULL,
    city        TEXT CONSTRAINT nn_team_city NOT NULL,
    stadium_id  INTEGER CONSTRAINT nn_team_stadium_id NOT NULL 
                        CONSTRAINT fk_team_stadium REFERENCES Stadium(stadium_id)  ON DELETE SET NULL
                                                                                   ON UPDATE CASCADE 
);                      


-- Table Sponsorship

CREATE TABLE Sponsorship(
    sponsor_id INTEGER PRIMARY KEY,
    sponsor_name TEXT CONSTRAINT nn_sponsor_name NOT NULL
);


-- Table SponsorPlacement

CREATE TABLE SponsorPlacement(
    team_id     INTEGER CONSTRAINT fk_splacement_teamid REFERENCES Team(team_id)            ON DELETE CASCADE
                                                                                            ON UPDATE CASCADE,
    sponsor_id  INTEGER CONSTRAINT fk_splacement_sponsorid REFERENCES Sponsorship(sponsor_id)  ON DELETE CASCADE
                                                                                                ON UPDATE CASCADE,
    placement   TEXT,
    PRIMARY KEY (
        team_id,
        sponsor_id
    )                                                       
);

-- Table Game


CREATE TABLE Game(
    game_id     INTEGER PRIMARY KEY,
    dia         DATE CONSTRAINT nn_game_day NOT NULL,
    jornada     INTEGER CONSTRAINT nn_game_jornada NOT NULL,
    stadium_id  INTEGER CONSTRAINT nn_game_stadiumid NOT NULL 
                        CONSTRAINT fk_game_stadiumid REFERENCES Stadium(stadium_id)  ON DELETE SET NULL
                                                        ON UPDATE CASCADE
    CONSTRAINT jornadaGE0 CHECK(jornada >= 0)
);


-- Table HomeTeam

CREATE TABLE HomeTeam(
    game_id INTEGER PRIMARY KEY CONSTRAINT fk_hometeam_gameid REFERENCES Game(game_id)  ON DELETE CASCADE
                                                                                        ON UPDATE CASCADE,
    team_id INTEGER CONSTRAINT nn_hometeam_teamid NOT NULL 
                    CONSTRAINT fk_hometeam_teamid REFERENCES Team(team_id)  ON DELETE SET NULL
                                                                            ON UPDATE CASCADE
);

-- Table AwayTeam

CREATE TABLE AwayTeam(
    game_id INTEGER PRIMARY KEY CONSTRAINT fk_awayteam_gameid REFERENCES Game(game_id)  ON DELETE CASCADE
                                                                                        ON UPDATE CASCADE,
    team_id INTEGER CONSTRAINT nn_awayteam_teamid NOT NULL 
                    CONSTRAINT fk_awayteam_teamid REFERENCES Team(team_id)  ON DELETE SET NULL
                                                                            ON UPDATE CASCADE
);


-- Table RegistrationPeriod

CREATE TABLE RegistrationPeriod(
    period_id INTEGER PRIMARY KEY,
    dateBegin DATE CONSTRAINT nn_period_datebegin NOT NULL,
    dateEnd   DATE CONSTRAINT nn_period_dateend NOT NULL,
    CONSTRAINT period_datebegin_dateend CHECK (dateBegin < dateEnd)
);

-- Table Stage

CREATE TABLE Stage(
    stage_id    INTEGER PRIMARY KEY,
    nome        TEXT CONSTRAINT nn_stage_name NOT NULL
                     CONSTRAINT stage_name_unique UNIQUE,
    period_id   INTEGER CONSTRAINT nn_stage_periodid NOT NULL 
                        CONSTRAINT fk_stage_periodid REFERENCES RegistrationPeriod(period_id)  ON DELETE SET NULL
                                                                                                ON UPDATE CASCADE
);


-- Table GameStage

CREATE TABLE GameStage(
    game_id INTEGER PRIMARY KEY CONSTRAINT fk_gamestage_gameid REFERENCES Game(game_id)  ON DELETE CASCADE
                                                                                            ON UPDATE CASCADE,
    stage_id INTEGER CONSTRAINT nn_gamestage_stageid NOT NULL 
                     CONSTRAINT fk_gamestage_stageid REFERENCES Stage(stage_id)  ON DELETE SET NULL
                                                                                 ON UPDATE CASCADE
);

-- Table Player

CREATE TABLE Player(
    player_id       INTEGER PRIMARY KEY,
    nome            TEXT CONSTRAINT nn_player_name NOT NULL,
    shirt_name      TEXT,
    shirt_number    INTEGER CONSTRAINT nn_player_shirtnumber NOT NULL,
    height          REAL CONSTRAINT nn_player_height NOT NULL,  
    peso            REAL CONSTRAINT nn_player_weight NOT NULL,
    team_id INTEGER CONSTRAINT nn_player_teamid NOT NULL 
                    CONSTRAINT fk_player_teamid REFERENCES Team(team_id)  ON DELETE SET NULL
                                                                            ON UPDATE CASCADE,
    CONSTRAINT player_shirtnumber_teamid UNIQUE (shirt_number, team_id),
    CONSTRAINT player_shirtnumber_between0_100 CHECK (shirt_number < 100 and shirt_number > 0),
    CONSTRAINT player_weight CHECK(peso > 0),
    CONSTRAINT player_height CHECK(height > 0)
);

-- Table Position

CREATE TABLE Position(
    game_id     INTEGER CONSTRAINT fk_position_gameid REFERENCES Game(game_id)  ON DELETE CASCADE
                                                                                ON UPDATE CASCADE,
    player_id   INTEGER CONSTRAINT fk_position_playerid REFERENCES Player(player_id)  ON DELETE CASCADE
                                                                                      ON UPDATE CASCADE,
    positionName    TEXT CONSTRAINT nn_position_name NOT NULL,
    PRIMARY KEY (
        game_id,
        player_id
    )                                                       
);

-- Table Registration

CREATE TABLE Registration(
    player_id   INTEGER CONSTRAINT fk_registration_playerid REFERENCES Player(player_id)  ON DELETE CASCADE
                                                                                            ON UPDATE CASCADE,
    period_id   INTEGER CONSTRAINT fk_registration_periodid REFERENCES RegistrationPeriod(period_id)  ON DELETE CASCADE
                                                                                                    ON UPDATE CASCADE,
    team_id     INTEGER CONSTRAINT nn_registration_teamid NOT NULL 
                    CONSTRAINT fk_registration_teamid REFERENCES Team(team_id)  ON DELETE SET NULL
                                                                                ON UPDATE CASCADE,      
    PRIMARY KEY (
        player_id,
        period_id
    )                                                       
);

-- Table GameEvent 

CREATE TABLE GameEvent(
    event_id    INTEGER PRIMARY KEY,
    minute      TIME CONSTRAINT nn_gameevent_minute NOT NULL,
    game_id     INTEGER CONSTRAINT nn_gameevent_gameid NOT NULL 
                        CONSTRAINT fk_gameevent_gameid REFERENCES Game(game_id)  ON DELETE SET NULL
                                                                                ON UPDATE CASCADE
    CONSTRAINT minuteGE0 CHECK(minute >= 0)
);

-- Table Cartao

CREATE TABLE Cartao(
    event_id    INTEGER PRIMARY KEY,
    minute      TIME CONSTRAINT nn_cartao_minute NOT NULL,
    color       TEXT CONSTRAINT nn_cartao_color NOT NULL,
    player_id   INTEGER CONSTRAINT nn_cartao_playerid NOT NULL 
                        CONSTRAINT fk_cartao_playerid REFERENCES Player(player_id)  ON DELETE SET NULL
                                                                                    ON UPDATE CASCADE
    CONSTRAINT cartao_color CHECK (color = 'YELLOW' OR color = 'RED'),
    CONSTRAINT minuteGE0 CHECK(minute >= 0)
);

-- Table Goal

CREATE TABLE Goal(
    event_id    INTEGER PRIMARY KEY,
    minute      TIME CONSTRAINT nn_goal_minute NOT NULL,
    player_id   INTEGER CONSTRAINT nn_goal_playerid NOT NULL 
                        CONSTRAINT fk_goal_playerid REFERENCES Player(player_id)  ON DELETE SET NULL
                                                                                ON UPDATE CASCADE,
    team_id     INTEGER CONSTRAINT nn_goal_teamid NOT NULL 
                        CONSTRAINT fk_goal_teamid REFERENCES Team(team_id)  ON DELETE SET NULL
                                                                            ON UPDATE CASCADE
    CONSTRAINT minuteGE0 CHECK(minute >= 0)
);


-- Table Substitution

CREATE TABLE Substitution(
    event_id    INTEGER PRIMARY KEY,
    minute      TIME CONSTRAINT nn_substitution_minute NOT NULL,
    playerIn   INTEGER CONSTRAINT nn_substitutionin_playerid NOT NULL 
                        CONSTRAINT fk_substitutionin_playerid REFERENCES Player(player_id)  ON DELETE SET NULL
                                                                                            ON UPDATE CASCADE,
    playerOut   INTEGER CONSTRAINT nn_substitutionout_playerid NOT NULL 
                        CONSTRAINT fk_substitutionout_playerid REFERENCES Player(player_id)  ON DELETE SET NULL
                                                                                              ON UPDATE CASCADE
    CONSTRAINT minuteGE0 CHECK(minute >= 0)                                                                                       
);
