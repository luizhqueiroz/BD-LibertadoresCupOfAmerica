PRAGMA foreign_keys = ON;


.print ''
.print 'Vamos primeiro adicionar um cartão vermelho a um jogador que não recebeu cartão algum no jogo'
.print ''

INSERT INTO GameEvent (event_id, minute, game_id) VALUES (100, '00:60:00', 1);
INSERT INTO Cartao (event_id, minute, color, player_id) VALUES (100, '00:60:00', 'RED', 4);


.print ''
.print 'Podemos ver que o cartão foi adicionado:'
.print ''

SELECT * FROM Cartao WHERE event_id = 100;

.print''
.print 'Agora vamos adicionar um cartão vermelho a um jogador que já recebeu um cartão vermelho no jogo'
.print ''

INSERT INTO GameEvent (event_id, minute, game_id) VALUES (101, '00:65:00', 1);
INSERT INTO Cartao (event_id, minute, color, player_id) VALUES (101, '00:65:00', 'RED', 4);

.print ''
.print 'Podemos ver que o cartão não foi adicionado:'
.print ''

SELECT * FROM Cartao WHERE event_id = 101;

.print ''
.print 'Agora vamos adicionar dois cartões amarelos a um jogador'
.print ''

INSERT INTO GameEvent (event_id, minute, game_id) VALUES (102, '00:70:00', 1);
INSERT INTO Cartao (event_id, minute, color, player_id) VALUES (102, '00:70:00', 'YELLOW', 5);
INSERT INTO GameEvent (event_id, minute, game_id) VALUES (103, '00:75:00', 1);
INSERT INTO Cartao (event_id, minute, color, player_id) VALUES (103, '00:75:00', 'YELLOW', 5);

.print ''
.print 'Podemos ver que todos os cartões foram adicionados:'
.print ''

SELECT * FROM Cartao WHERE player_id = 5;

.print ''
.print 'Agora vamos adicionar um cartão amarelo a um jogador que já recebeu dois cartões amarelos no jogo'
.print ''

INSERT INTO GameEvent (event_id, minute, game_id) VALUES (104, '00:80:00', 1);
INSERT INTO Cartao (event_id, minute, color, player_id) VALUES (104, '00:80:00', 'YELLOW', 5);

.print ''
.print 'Podemos ver que o cartão não foi adicionado:'
.print ''

SELECT * FROM Cartao WHERE event_id = 104;

