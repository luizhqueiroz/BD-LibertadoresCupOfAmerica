PRAGMA foreign_keys = ON;

.mode columns
.header on

--Insert stadiums

INSERT INTO Stadium (stadium_id, nome, place, capacity) VALUES
(1, 'Maracanã', 'Rio de Janeiro', 78000), -- fla e flu
(2, 'Mineirão', 'Belo Horizonte', 60000), -- galo e cruzeiro
(3, 'Allianz Parque', 'São Paulo', 45000), --palmeiras
(4, 'Ilha do Retiro', 'Recife', 25000), -- sport
(5, 'Arena do Grêmio', 'Porto Alegre', 60000), -- gremio
(6, 'Arena Corinthians', 'São Paulo', 49000), -- corinthians
(7, 'Arena da Baixada', 'Curitiba', 42000), -- cap
(8, 'La Bombonera', 'Buenos Aires', 54000), -- boca
(9, 'Estádio Monumental', 'Buenos Aires', 72000), -- river
(10, 'Estadio Campeón Del Siglo', 'Montevideo', 40700),--penarol
(11, 'Estadio Gran Parque Central', 'Montevideo', 34000),--nacional
(12, 'Estádio Nacional', 'Santiago', 50000),--universidad de chile
(13, 'Estádio Monumental David Arellano', 'Macul', 47000), --colocolo
(14, 'Estádio George Capwell', 'Guayaquil', 40000), --emelec 
(15, 'Estádio Polideportivo de Pueblo Nuevo', 'Táchira', 42500), -- deportivo tachira
(16, 'Estádio Olímpico Patria', 'Sucre', 30700), --indepiendente petrolero
(17, 'Estádio General Pablo Rojas', 'Asunción', 45000); -- cerro porteno


-- Insert teams

INSERT INTO Team(team_id, nome, country, city, stadium_id) VALUES
(1, 'Sport Club do Recife', 'Brazil', 'Recife', 4),
(2, 'Sociedade Esportiva Palmeiras', 'Brazil', 'São Paulo', 3),
(3, 'Clube Atlético Mineiro', 'Brazil', 'Belo Horizonte', 2),
(4, 'Clube de Regatas do Flamengo', 'Brazil', 'Rio de Janeiro', 1),
(5, 'Fluminense Foot-ball Club', 'Brazil', 'Rio de Janeiro', 1),
(6, 'Cruzeiro Esporte Clube', 'Brazil', 'Belo Horizonte', 2),
(7, 'Grêmio Foot-Ball Porto Alegrense', 'Brazil', 'Porto Alegre', 5),
(8, 'Corinthians Paulista', 'Brazil', 'São Paulo', 6),
(9, 'Clube Atlético Paranaense', 'Brazil', 'Curitiba', 7),
(10, 'Boca Juniors', 'Argentina', 'Buenos Aires', 8),
(11, 'Club Atlético River Plate', 'Argentina', 'Buenos Aires', 9),
(12, 'Club Atlético Peñarol', 'Uruguay', 'Montevideo', 10),
(13, 'Club Nacional de Football', 'Uruguay', 'Montevideo', 11),
(14, 'Universidad de Chile', 'Chile', 'Santiago', 12),
(15, 'Club Deportivo Colo-Colo', 'Chile', 'Macul', 13),
(16, 'Club Sport Emelec', 'Ecuador', 'Guayaquil', 14),
(17, 'Deportivo Táchira', 'Venezuela', 'Táchira', 15),
(18, 'Club Deportivo Independiente Petrolero', 'Bolivia', 'Sucre', 16),
(19, 'Club Cerro Porteño', 'Paraguay', 'Asunción', 17);


-- Insert sponsorship

INSERT INTO Sponsorship(sponsor_id, sponsor_name) VALUES
(1, 'Coca-Cola'),
(2, 'Banco do Brasil'),
(3, 'Itaú'),
(4, 'Petrobras'),
(5, 'Banco Bradesco'),
(6, 'Banco Santander'),
(7, 'Banco do Nordeste'),
(8, 'Qatar Airways'),
(9, 'BBVA');

-- Insert SponsorPlacement
INSERT INTO SponsorPlacement(team_id, sponsor_id, placement) VALUES 
(1, 1, 'Uniform'),
(2, 3, 'Uniform'),
(3, 4, 'Uniform'),
(4, 2, 'Uniform and Stadium'),
(5, 6, 'Uniform'),
(6, 3, 'Uniform'),
(8, 7, 'Uniform and Stadium'),
(9, 2, 'Uniform'),
(11, 9, 'Stadium'),
(10, 1, 'Uniform'),
(15, 2, 'Uniform'),
(1, 9, 'Uniform and Stadium'),
(13, 4, 'Stadium'),
(18, 8, 'Uniform'),
(18, 9, 'Stadium'),
(17, 5, 'Uniform'),
-- Insert Game

INSERT INTO Game(game_id, dia, jornada, stadium_id) VALUES
(1, '2022-03-02', 1, 1),
(2, '2022-03-03', 1, 15),
(3, '2022-03-14', 2, 13),
(4, '2022-04-15', 2, 5),
(5, '2022-04-22', 3, 4),
(6, '2022-04-23', 4, 7),
(7, '2022-04-26', 4, 6),
(8, '2022-04-27', 4, 10),
(9, '2022-05-19', 5, 14),
(10, '2022-05-20', 5, 1),
(11, '2022-05-21', 6, 9),
(12, '2022-06-13', 6, 2),
(13, '2022-06-20', 7, 4),
(14, '2022-06-21', 7, 1),
(15, '2022-06-29', 8, 15),
(16, '2022-07-30', 8, 11),
(17, '2022-07-06', 9, 12),
(18, '2022-07-07', 10, 3),
(19, '2022-07-08', 11, 1),
(20, '2022-08-15', 11, 12),
(21, '2022-08-16', 12, 14),
(22, '2022-08-23', 12, 9),
(23, '2022-08-24', 13, 8),
(24, '2022-09-01', 13, 2),
(25, '2022-09-17', 14, 4),
(26, '2022-09-24', 14, 6),
(27, '2022-09-15', 15, 14),
(28, '2022-09-30', 15, 12),
(29, '2022-10-23', 16, 4);

--Insert Home Team

INSERT INTO HomeTeam(game_id, team_id) VALUES
(1, 5),
(2, 19),
(3, 17),
(4, 7),
(5, 1),
(6, 9),
(7, 8),
(8, 12),
(9, 18),
(10, 4),
(11, 11),
(12, 3),
(13, 1),
(14, 4),
(15, 19),
(16, 13),
(17, 15),
(18, 2),
(19, 4),
(20, 15),
(21, 18),
(22, 11),
(23, 12),
(24, 3),
(25, 1),
(26, 8),
(27, 18),
(28, 15),
(29, 1);

--Insert Away Team

INSERT INTO AwayTeam(game_id, team_id) VALUES
(1, 4),
(2, 17),
(3, 19),
(4, 9),
(5, 5),
(6, 8),
(7, 1),
(8, 11),
(9, 15),
(10, 2),
(11, 12),
(12, 2),
(13, 5),
(14, 1),
(15, 17),
(16, 18),
(17, 13),
(18, 3),
(19, 1),
(20, 18),
(21, 15),
(22, 12),
(23, 11),
(24, 2),
(25, 8),
(26, 9),
(27, 13),
(28, 18),
(29, 5);

--Insert RegistrationPeriod

INSERT INTO RegistrationPeriod(period_id, dateBegin, dateEnd) VALUES
(1, '2022-02-03', '2022-03-01'),
(2, '2022-04-29', '2022-05-15'),
(3, '2022-09-02', '2022-09-15');

--Insert Stage

INSERT INTO Stage(stage_id, nome, period_id) VALUES
(1, 'Pré-eliminatória', 1),
(2, 'Fase de grupos', 2),
(3, 'Fase final', 3);

--Insert GameStage

INSERT INTO GameStage(game_id, stage_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3);

--Insert Player

INSERT INTO Player(player_id, nome, shirt_name, shirt_number, height, peso, team_id) VALUES
(1, 'Cristiano Ronaldo', 'Ronaldo', 7, 1.85, 80, 1),
(2, 'Lionel Messi', 'Messi', 10, 1.7, 72, 2),
(3, 'Neymar', 'Neymar', 10, 1.75, 68, 3),
(4, 'Kylian Mbappé', 'Mbappé', 7, 1.78, 73, 4),
(5, 'Robert Lewandowski', 'Lewandowski', 9, 1.85, 80, 5),
(6, 'Mohamed Salah', 'Mo Salah', 11, 1.75, 70, 6),
(7, 'Sadio Mané', 'Mané', 10, 1.75, 70, 7),
(8, 'Kevin De Bruyne', 'De Bruyne', 17, 1.8, 75, 8),
(9, 'Harry Kane', 'Kane', 10, 1.85, 80, 9),
(10, 'Sergio Ramos', 'Ramos', 4, 1.85, 80, 10),
(11, 'Eden Hazard', 'Hazard', 10, 1.75, 70, 11),
(12, 'Paul Pogba', 'Pogba', 6, 1.9, 85, 12),
(13, 'Luis Suárez', 'Suárez', 9, 1.85, 80, 13),
(14, 'Antoine Griezmann','Griezmann', 7, 1.78, 73, 14),
(15, 'Luka Modrić', 'Luka Modrić', 10, 1.75, 70, 15),
(16, 'Raheem Sterling', 'Sterling', 7, 1.78, 73, 16),
(17, 'Sergio Agüero', 'Agüero', 10, 1.75, 70, 17),
(18, 'Gareth Bale', 'Bale', 11, 1.75, 70, 18),
(19, 'Karim Benzema', 'Benzema', 9, 1.85, 80, 19),
(20, 'David de Gea', 'de Gea', 1, 1.93, 90, 2),
(21, 'Jan Oblak', 'Oblak', 1, 1.93, 90, 5),
(22, 'Alisson', 'Alisson', 1, 1.93, 90, 7),
(23, 'Marc-André ter Stegen', 'ter Stegen', 1, 1.93, 90, 9),
(24, 'Thibaut Courtois', 'Courtois', 1, 1.93, 90, 1),
(25, 'Hugo Lloris', 'Lloris', 1, 1.93, 90, 16),
(26, 'Ederson', 'Ederson', 1, 1.93, 90, 6),
(27, 'Keylor Navas', 'Navas', 1, 1.93, 90, 8),
(28, 'Manuel Neuer', 'Neuer', 1, 1.93, 90, 10),
(29, 'Matthijs de Ligt', 'de Ligt', 4, 1.85, 80, 12),
(30, 'Virgil van Dijk', 'van Dijk', 4, 1.85, 80, 15),
(31, 'Raphaël Varane', 'Varane', 4, 1.85, 80, 17),
(32, 'Sergio Busquets', 'Busquets', 5, 1.9, 85, 13),
(33, 'Frenkie de Jong', 'de Jong', 21, 1.8, 75, 4),
(34, 'Toni Kroos', 'Kroos', 8, 1.8, 78, 18); 

--Insert position

INSERT INTO Position(game_id, player_id, positionName) VALUES
(1, 5, 'Forward'),
(2, 19, 'Forward'),
(3, 17, 'Forward'),
(4, 22, 'Goalkeeper'),
(5, 1, 'Forward'),
(6, 23, 'Goalkeeper'),
(7, 28, 'Goalkeeper'),
(8, 12, 'Midfielder'),
(9, 18, 'Forward'),
(10, 2, 'Forward'),
(11, 11, 'Forward'),
(12, 6, 'Forward'),
(13, 24, 'Goalkeeper'),
(14, 33, 'Midfielder'),
(15, 19, 'Forward'),
(16, 13, 'Forward'),
(17, 30, 'Defender'),
(18, 20, 'Goalkeeper'),
(19, 4, 'Forward'),
(20, 15, 'Midfielder'),
(21, 16, 'Forward'),
(22, 34, 'Midfielder'),
(23, 29, 'Defender'),
(24, 3, 'Forward'),
(25, 1, 'Midfielder'),
(26, 9, 'Forward'),
(27, 18, 'Defender'),
(28, 15, 'Forward'),
(29, 24, 'Goalkeeper');


--Insert registration
INSERT INTO Registration(player_id, period_id, team_id) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3 ,1),
(2, 1, 2),
(3, 3, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 6),
(7, 1, 7),
(8, 2, 8),
(9, 1, 9),
(10, 1, 10),
(11, 2, 11),
(12, 1, 12),
(13, 2, 13),
(14, 1, 14),
(15, 3, 15),
(16, 1, 16),
(17, 3, 17),
(18, 1, 18),
(19, 2, 19),
(20, 2, 2),
(21, 1, 5),
(22, 3, 7),
(23, 1, 9),
(24, 1, 1),
(25, 3, 16),
(26, 1, 6),
(27, 1, 8),
(28, 1, 10),
(29, 1, 12),
(30, 2, 15),
(31, 1, 17),
(32, 1, 13),
(33, 1, 4),
(34, 1, 18);

--Insert GameEvent

INSERT INTO GameEvent(event_id, minute, game_id) VALUES
(1, '00:25:00', 1),
(2, '00:05:00', 2),
(3, '00:35:00', 3),
(4, '00:32:00', 4),
(5, '00:45:00', 5),
(6, '00:52:00', 6),
(7, '00:59:00', 7),
(8, '01:20:00', 8),
(9, '01:05:00', 9),
(10, '01:30:00', 10),
(11, '01:15:00', 11),
(12, '00:24:00', 12),
(13, '01:23:00', 13),
(14, '00:15:00', 14),
(15, '00:09:00', 15),
(16, '00:33:00', 16),
(17, '00:41:00', 17),
(18, '01:10:00', 18),
(19, '01:20:00', 19),
(20, '00:23:00', 20),
(21, '00:56:00', 21),
(22, '01:12:00', 22),
(23, '01:03:00', 23),
(24, '00:54:00', 24),
(25, '00:47:00', 25),
(26, '00:16:00', 26),
(27, '00:09:00', 27),
(28, '00:29:00', 28),
(29, '00:41:00', 29),
(30, '01:05:00', 1),
(31, '00:35:00', 2),
(32, '00:38:00', 3),
(33, '00:39:00', 4),
(34, '00:45:00', 5),
(35, '00:52:00', 6),
(36, '00:88:00', 7),
(37, '01:20:00', 8),
(38, '01:05:00', 9),
(39, '01:30:00', 10),
(40, '01:15:00', 11),
(41, '00:24:00', 12),
(42, '01:23:00', 13),
(43, '00:15:00', 14),
(44, '00:09:00', 15),
(45, '00:33:00', 16),
(46, '01:12:00', 17),
(47, '01:10:00', 18),
(48, '01:20:00', 19),
(49, '00:23:00', 20),
(50, '00:56:00', 21),
(51, '01:12:00', 22),
(52, '01:03:00', 23),
(53, '00:54:00', 24),
(54, '00:47:00', 25),
(55, '01:12:00', 26),
(56, '00:19:00', 27),
(57, '00:29:00', 28),
(58, '00:31:00', 29);


--Insert Cartao

INSERT INTO Cartao(event_id, minute, color, player_id) VALUES
(1, '00:25:00', 'RED', 1),
(2, '00:05:00', 'YELLOW', 2),
(6, '00:52:00', 'YELLOW', 6),
(8, '01:20:00', 'YELLOW', 8),
(9, '01:05:00', 'YELLOW', 9),
(10, '01:30:00', 'RED', 10),
(11, '01:15:00', 'YELLOW', 11),
(13, '01:23:00', 'YELLOW', 13),
(14, '00:15:00', 'YELLOW', 14),
(18, '01:10:00', 'RED', 18),
(20, '00:23:00', 'YELLOW', 15),
(21, '00:56:00', 'YELLOW', 16),
(24, '00:54:00', 'RED', 3),
(25, '00:47:00', 'YELLOW', 1);

--Insert Goal

INSERT INTO Goal(event_id, minute, player_id, team_id) VALUES
(3, '00:35:00', 17, 17),
(5, '00:45:00', 5, 5),
(7, '00:59:00', 1, 1),
(12, '00:24:00', 3, 3),
(15, '00:09:00', 19, 19),
(17, '00:41:00', 30, 13),
(22, '01:12:00', 12, 12),
(27, '00:09:00', 18, 18),
(29, '00:41:00', 1, 1),
(30, '01:05:00', 4, 4),
(31, '00:35:00', 19, 19),
(32, '00:38:00', 17, 17),
(33, '00:39:00', 9, 9),
(34, '00:45:00', 1, 1),
(35, '00:52:00', 8, 8),
(36, '00:88:00', 1, 1),
(37, '01:20:00', 12, 12),
(38, '01:05:00', 15, 15),
(39, '01:30:00', 2, 2),
(40, '01:15:00', 11, 11),
(41, '00:24:00', 3, 3),
(42, '01:23:00', 1, 1),
(43, '00:15:00', 1, 1),
(44, '00:09:00', 19, 19),
(45, '00:33:00', 13, 13),
(46, '01:12:00', 15, 15),
(47, '01:10:00', 3, 3),
(48, '01:20:00', 4, 4),
(49, '00:23:00', 18, 18),
(50, '00:56:00', 15, 15),
(51, '01:12:00', 12, 12),
(52, '01:03:00', 11, 11),
(53, '00:54:00', 2, 2),
(54, '00:47:00', 1, 1),
(55, '01:12:00', 9, 9),
(56, '00:19:00', 18, 18),
(57, '00:29:00', 15, 15),
(58, '00:31:00', 1, 1);


--Insert Substitution

INSERT INTO Substitution(event_id, minute, playerIn, playerOut) VALUES
(4, '00:32:00', 4, 33),
(16, '00:33:00', 25, 16),
(19, '01:20:00', 19, 34),
(23, '01:03:00', 29, 12),
(26, '00:16:00', 23, 9),
(28, '00:29:00', 15, 30);
