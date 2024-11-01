PRAGMA foreign_keys = ON;

.print''
.print 'Para testes, vamos usar o player_id 1, que está registado na equipa 1'
.print ''

SELECT * FROM Player WHERE player_id = 1;

.print ''
.print 'Vamos adicionar um jogador a uma equipa que ele não está registrado'
.print ''

INSERT INTO Registration (player_id, period_id, team_id) VALUES (1, 3, 6);

.print ''
.print 'Podemos ver que a equipa do jogador foi alterada:'
.print ''

SELECT team_id FROM Player WHERE player_id = 1;
