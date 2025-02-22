
            
20 SQL QUERIES FOR DATA ANALYSIS 

-- Top 3 teams with the highest win percentage in IPL matches:

SELECT info_outcome_winner, 
       (COUNT(info_outcome_winner) / (SELECT COUNT(*) FROM demo.ipl_matches)) * 100 AS win_percentage
FROM demo.ipl_matches
GROUP BY info_outcome_winner
ORDER BY win_percentage DESC
LIMIT 3;

-- Total runs scored by each batter in IPL matches:

SELECT innings_overs_deliveries_batter, SUM(innings_overs_deliveries_runs_batter) AS total_runs
FROM demo.ipl_matches
GROUP BY innings_overs_deliveries_batter
ORDER BY total_runs DESC
LIMIT 10;

-- Players with the most deliveries faced in T20 matches:

SELECT innings_overs_deliveries_batter, SUM(LENGTH(innings_overs_deliveries_batter)) AS total_deliveries
FROM demo.t20_matches
GROUP BY innings_overs_deliveries_batter
ORDER BY total_deliveries DESC
LIMIT 5;

-- Total runs scored by all teams in Test matches:

SELECT innings_team, SUM(innings_overs_deliveries_runs_batter) AS total_runs
FROM demo.test_matches
GROUP BY innings_team
ORDER BY total_runs DESC;

-- Number of matches won by each team in ODI matches:

SELECT info_outcome_winner, COUNT(*) AS total_wins
FROM demo.odi_matches
GROUP BY info_outcome_winner
ORDER BY total_wins DESC;

-- Total number of wickets in T20 matches:

SELECT COUNT(*) AS total_wickets
FROM demo.t20_matches
WHERE innings_overs_deliveries_runs_batter > 0;

-- Top 5 teams by total runs in IPL matches:

SELECT info_teams, SUM(innings_overs_deliveries_runs_batter) AS total_runs
FROM demo.ipl_matches
GROUP BY info_teams
ORDER BY total_runs DESC
LIMIT 5;

-- Teams that won by the highest margin (in runs) in IPL:

SELECT info_outcome_winner, MAX(info_outcome_by_runs) AS highest_margin
FROM demo.ipl_matches
GROUP BY info_outcome_winner
ORDER BY highest_margin DESC
LIMIT 10;

-- Number of tosses won by each team in T20 matches:

SELECT info_toss_winner, COUNT(*) AS total_toss_wins
FROM demo.t20_matches
GROUP BY info_toss_winner
ORDER BY total_toss_wins DESC;

-- Total number of boundaries (fours and sixes) in T20 matches:

SELECT SUM(innings_overs_deliveries_runs_batter) AS total_boundaries
FROM demo.t20_matches
WHERE innings_overs_deliveries_runs_batter IN (4, 6);

-- Top 3 players by runs in ODI matches:

SELECT innings_overs_deliveries_batter, SUM(innings_overs_deliveries_runs_batter) AS total_runs
FROM demo.odi_matches
GROUP BY innings_overs_deliveries_batter
ORDER BY total_runs DESC
LIMIT 10;

-- Players with the most runs and highest batting average in TEST matches:

SELECT innings_overs_deliveries_batter, 
SUM(innings_overs_deliveries_runs_batter) / COUNT(*) AS batting_average
FROM demo.test_matches
GROUP BY innings_overs_deliveries_batter
ORDER BY batting_average DESC
LIMIT 10;

-- Most common toss winner in IPL matches:

SELECT info_toss_winner, COUNT(*) AS toss_wins
FROM demo.ipl_matches
GROUP BY info_toss_winner
ORDER BY toss_wins DESC
LIMIT 5;

-- Most successful bowler by total wickets in ODI matches:

SELECT innings_overs_deliveries_bowler, COUNT(*) AS total_wickets
FROM demo.odi_matches
WHERE innings_overs_deliveries_runs_batter IS NOT NULL
GROUP BY innings_overs_deliveries_bowler
ORDER BY total_wickets DESC
LIMIT 5;

-- Total number of matches played in IPL:

SELECT COUNT(*) AS total_matches
FROM demo.ipl_matches;

-- Top 5 cities with the most number of IPL matches:

SELECT info_city, COUNT(*) AS match_count
FROM demo.ipl_matches
GROUP BY info_city
ORDER BY match_count DESC
LIMIT 5;

-- Most successful bowler in IPL by total wickets:

SELECT innings_overs_deliveries_bowler, COUNT(*) AS total_wickets
FROM demo.ipl_matches
WHERE innings_overs_deliveries_runs_batter IS NOT NULL
GROUP BY innings_overs_deliveries_bowler
ORDER BY total_wickets DESC
LIMIT 5;

-- Total extras runs in ODI matches:

SELECT SUM(innings_overs_deliveries_runs_extras) AS total_extras_runs
FROM demo.odi_matches;

-- Total runs scored by each team in all ODI matches:

SELECT info_teams, SUM(innings_overs_deliveries_runs_total) AS total_runs
FROM demo.odi_matches
GROUP BY info_teams;

-- Total number of matches played by each team in IPL:

SELECT info_teams, COUNT(*) AS total_matches
FROM demo.ipl_matches
GROUP BY info_teams;

-- Leading wicket-takers in T20 matches:

SELECT innings_overs_deliveries_bowler, SUM(innings_overs_deliveries_runs_batter) AS total_wickets
FROM demo.t20_matches
GROUP BY innings_overs_deliveries_bowler
ORDER BY total_wickets DESC;