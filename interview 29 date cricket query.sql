CREATE TABLE cricket (
    matchid INT PRIMARY KEY,
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    result VARCHAR(50)
);
INSERT INTO cricket (matchid, team1, team2, result) VALUES
(1, 'IND', 'PAK', 'IND Won'),
(2, 'AUS', 'NZ', 'AUS Won'),
(3, 'SA', 'SL', 'SA Won'),
(4, 'BNG', 'AFG', 'BNG Won'),
(5, 'ENZ', 'PAK', 'PAK Won'),
(6, 'IND', 'AUS', 'AUS Won'),
(7, 'NZ', 'SL', 'NZ Won'),
(8, 'SA', 'AFG', 'SA Won'),
(9, 'BNG', 'ENZ', 'ENZ Won'),
(10, 'PAK', 'AUS', 'PAK Won'),
(11, 'IND', 'SL', 'IND Won'),
(12, 'NZ', 'AFG', 'AFG Won');

--**************************for update result query  *****************************************
update cricket
set result = replace(result,'won','');

--**************************************for update result in ohter method and it work **********************
UPDATE cricket
SET result = CASE
    WHEN result = 'IND Won' THEN 'IND'
    WHEN result = 'AUS Won' THEN 'AUS'
    WHEN result = 'PAK Won' THEN 'PAK'
    WHEN result = 'NZ Won' THEN 'NZ'
    WHEN result = 'SA Won' THEN 'SA'
    WHEN result = 'SL Won' THEN 'SL'
    WHEN result = 'BNG Won' THEN 'BNG'
    WHEN result = 'AFG Won' THEN 'AFG'
    WHEN result = 'ENZ Won' THEN 'ENZ'
    ELSE result
END;


SELECT*FROM cricket
--****************************88query to find team name,numver of match , no of win
with cte as(
      select team1 as team_name,
           case when team1 = result then 1 else 0 end as win_flag
           from cricket
union all
     select team2 as team_name,
          case when team2 = result then 1 else 0 end as win_flag
          from cricket)
select team_name,
      count(team_name) as match_played
from cte
group by team_name 
ORDER BY match_played DESC;
-
-------------------------------------------------
--------------------------different query to solve--------------------


WITH team_stats AS (
    SELECT team1 AS team_name, 
           1 AS match_played, 
           CASE WHEN team1 = result THEN 1 ELSE 0 END AS matches_won, 
           CASE WHEN team1 != result THEN 1 ELSE 0 END AS matches_lost
    FROM cricket
    UNION ALL
    SELECT team2 AS team_name, 
           1 AS match_played, 
           CASE WHEN team2 = result THEN 1 ELSE 0 END AS matches_won, 
           CASE WHEN team2 != result THEN 1 ELSE 0 END AS matches_lost
    FROM cricket
)
SELECT team_name, 
       SUM(match_played) AS match_played, 
       SUM(matches_won) AS matches_won, 
       SUM(matches_lost) AS matches_lost
FROM team_stats
GROUP BY team_name
ORDER BY match_played DESC;


