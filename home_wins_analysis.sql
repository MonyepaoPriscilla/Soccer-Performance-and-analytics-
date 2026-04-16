SELECT
Team.team_long_name,
COUNT(Match.id) AS total_matches,
SUM(CASE WHEN Match.home_team_api_id = Team.team_api_id
    AND Match.home_team_goal > Match.away_team_goal
	THEN 1 ELSE 0 END) AS home_wins
FROM Match
JOIN Team ON Team.team_api_id = Match.home_team_api_id
GROUP BY Team.team_long_name
ORDER BY home_wins DESC
LIMIT 10;
