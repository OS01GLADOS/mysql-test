select
distinct
concat(e.home_team, '-', away_team) as 'game',
(select count(*)
from event_entity as e2
where (e2.home_team = e.home_team and e2.away_team = e.away_team) or
(e2.home_team = e.away_team and e2.away_team = e.home_team)
)
-
(select count(*)
from event_entity as e2
where (e2.home_team = e.away_team and e2.away_team = e.home_team)
)
 as 'games_count'
from event_entity as e
order by 'game'