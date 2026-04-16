SELECT 
  Team.team_long_name,
  ROUND(AVG(Match.home_team_goal), 2 ) AS avg_home_goals, 
  ROUND(AVG(Match.away_team_goal), 2) AS avg_away_goals,
  ROUND(AVG(Match.home_team_goal) + 
  AVG(Match.away_team_goal), 2) AS avg_total_goals
  FROM Match 
  JOIN Team ON Team.team_api_id = Match. home_team_api_id
  GROUP BY Team.team_long_name
  ORDER BY avg_home_goals DESC
  LIMIT 10;
