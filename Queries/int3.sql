.mode columns
.headers on
.nullvalue NULL

-- Qual patrocinador patrocinou mais equipas?

DROP VIEW [MaxValue];

CREATE VIEW MaxValue AS
    SELECT max(n) AS M
      FROM (
               SELECT count( * ) AS n,
                      S.sponsor_name
                 FROM sponsorship AS S,
                      SponsorPlacement AS P
                WHERE S.sponsor_id = P.sponsor_id
                GROUP BY S.sponsor_name
                ORDER BY count( * ) DESC
           );


SELECT count( * ) AS N_EQUIPAS,
           S.sponsor_name as SPONSOR_NAME
      FROM sponsorship AS S,
           SponsorPlacement AS P
     WHERE S.sponsor_id = P.sponsor_id
     GROUP BY S.sponsor_name
     HAVING N_EQUIPAS == (select * from( MaxValue T1 ))
     
