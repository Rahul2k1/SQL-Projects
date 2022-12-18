-- Checking for copied dataset from csv file 
select * from worldcup

-- Matches played by Argentina 
select * from worldcup
where home_team = 'argentina'

-- Matches played by Argentina in 2014
select * from worldcup 
where home_team = 'argentina' 
and date between '2014-01-01' and '2014-01-12'

-- Friendly Matches played from 2014-2018
select count(*) from worldcup 
where date between '2014-01-01' and '2018-01-12' 
and tournament ='Friendly' 

-- Matches with a big ranking difference
select home_team, home_team_fifa_rank, away_team_fifa_rank from worldcup 
group by home_team_fifa_rank, home_team, away_team_fifa_rank 
having home_team_fifa_rank > 30
and away_team_fifa_rank < 30

-- Matches drawn being the away side and with a big ranking difference
select home_team, home_team_fifa_rank, away_team_fifa_rank from worldcup
where home_team_result = 'Draw' 
group by home_team_fifa_rank, home_team, away_team_fifa_rank 
having home_team_fifa_rank < 30 
and away_team_fifa_rank > 30

--Matches with home team continent starting with A
select * from worldcup
where home_team_continent like'a%'

--No. of matches with away team continent starting with S and ending with A
select count(*) from worldcup
where home_team_continent like's%a'

--World cup matches with Away team score more than 2
select home_team, home_team_score,away_team_score
from worldcup
where tournament = ' FIFA World Cup qualification'
group by home_team, home_team_score, away_team_score
having away_team_score >2 

--Matches at specific cities
select * from worldcup 
where (city = 'Sydney' or city = 'Copenhagen' or city = 'Buenos Aires')

--To check how many matches Argentina won that were FIFA World Cup matches
select count(home_team) from worldcup
group by home_team,home_team_result,tournament
having home_team = 'Argentina'
and home_team_result = 'Win'
and tournament = 'FIFA World Cup qualification'

--To check how many matches France won that were FIFA World Cup matches
select count(home_team) from worldcup
group by home_team,home_team_result,tournament
having home_team = 'France'
and home_team_result = 'Win'
and tournament = 'FIFA World Cup qualification'

--Wins by finalist countries in World Cup matches
select distinct(home_team), count(home_team_result = 'Win') from worldcup
group by home_team, home_team_result, tournament
having home_team = 'France' or
home_team = 'Argentina'
and tournament = 'FIFA World Cup qualification'

