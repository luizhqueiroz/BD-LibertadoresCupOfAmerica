PRAGMA foreign_keys = ON;

.print ''
.print 'Para este gatilho, vamos fazer uma substituição inválida'
.print ''

BEGIN TRANSACTION;
INSERT INTO GameEvent(event_id, minute, game_id) VALUES (141, '00:10:00', 10);
INSERT INTO Substitution(event_id, minute, playerIn, playerOut) VALUES (141, '00:10:00', 1, 2);
COMMIT;
 
.print ''
.print 'Podemos ver que nenhum foi adicionado:'
.print ''

SELECT * FROM GameEvent WHERE event_id = 141;
SELECT * FROM Substitution WHERE event_id = 141;

.print ''
.print 'Agora vamos fazer uma substituição válida:'
.print ''

BEGIN TRANSACTION;
INSERT INTO GameEvent(event_id, minute, game_id) VALUES (142, '00:10:00', 1);
INSERT INTO Substitution(event_id, minute, playerIn, playerOut) VALUES (142, '00:10:00', 4, 33);
COMMIT;

.print ''
.print 'Podemos ver que todos foram adicionados:'
.print ''

SELECT * FROM GameEvent WHERE event_id = 142;
SELECT * FROM Substitution WHERE event_id = 142;

