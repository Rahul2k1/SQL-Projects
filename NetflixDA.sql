COPY public."netflixratings" FROM 'C:\Data Analytics\Datasets\Netflix Data.csv' DELIMITER ',' CSV HEADER;

select * from netflixratings

select * from netflixratings
where rating = 'TV-14'

--Tells us the dataset has duplicates
select * from netflixratings
where title = 'The Vampire Diaries'

--#R rated movies
select title, rating, releaseyear
from netflixratings
group by title, rating, releaseyear
having rating = 'R'
order by releaseyear

select title,rating, releaseyear
from netflixratings
group by rating, title, releaseyear
having title like 'A%'
order by releaseyear

select title, ratingdesc,rating
from netflixratings
where ratingdesc >=90 and ratingdesc <=110
or rating = 'PG'

insert into netflixratings(title,rating,ratinglevel,ratingdesc,releaseyear,userrating,userratingsize)
values ('Black Adam','PG-13','Can be viewed by every age group',100,2022,95,80)

select count(title), releaseyear 
from netflixratings
group by title, releaseyear
having title like 'B%'
order by releaseyear desc

select * from netflixratings
where rating not in ('PG','R','UR','NR','A')

SELECT title,
       ratingdesc,
       CASE
           WHEN ratingdesc >= 90 and ratingdesc < 100
                THEN 'One time Watch!'
           WHEN ratingdesc > 100 and ratingdesc < 110
                THEN 'Must Watch!'
           WHEN ratingdesc >= 110 THEN 'Classic!'
		   else 'Your Choice!'
       END duration
FROM netflixratings
ORDER BY title;

select count(*),releaseyear from netflixratings
where userrating between 60 and 80
group by releaseyear
order by releaseyear desc

select distinct(title),rating from
netflixratings
where rating = 'TV-14'
or rating = 'R'

select title, userrating
from netflixratings
where rating = all
(select title
from netflixratings
where userrating > 70)

select title, ratingdesc, coalesce(userrating,1)
as noratings
from netflixratings

