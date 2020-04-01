ROLLBACK;SET SEARCH_PATH TO movie; 

DROP FUNCTION ex941a(
  in_name VARCHAR
);

select * from movies
select * from studio 
--where name like '%M%'
;

select * from moviestar 
where name like '%M%';

select * from starsin 
where starname like '%M%';

select * from starsin 
where starname like '%M%';

SELECT m.title, m.year, m.length, m.genre, m.studioname, m.producerc
,  s.movietitle, s.movieyear, s.starname
 FROM
  starsin s
 , movies m
  WHERE s.movietitle = m.title
 AND s.movieyear = m.year
 AND s.movietitle = movietitle --in_movietitle
 AND s.movieyear = movieyear --in_movieyear
 --AND starname like '%M%'
 AND m.title like '%Wa%'
 and m.year = 1992
 ;
