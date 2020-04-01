CREATE OR REPLACE FUNCTION delete_star_extended(
  in_name VARCHAR
) RETURNS void 
AS
$PLAN_MM_AL$
  -- Given a name of a star, delete them from moviestar
  -- and delete all their movies from startsin and movies.
  -- Problem: how about movies other stars reference
  -- usefull: SET SEARCH_PATH TO movie;
  -- ROLLBACK;
  
DECLARE

  cu_star_starsins CURSOR (in_name moviestar.name%TYPE) FOR
  SELECT  movietitle, movieyear, starname
  FROM moviestar m
  , starsin s
  WHERE name = in_name
  AND m.name = s.starname
  ;

  cu_movies_stars CURSOR (in_movietitle starsin.movietitle%TYPE
  , in_movieyear starsin.movieyear%TYPE) FOR
  SELECT s.movietitle, s.movieyear, s.starname
  FROM  starsin s
  , movies m
  WHERE s.movietitle = m.title
  AND s.movieyear = m.year
  AND m.title = in_movietitle 
  AND m.year = in_movieyear 
  ;
 
  rec_movie_featured_in record;
  rec_star_featured record;
BEGIN
  RAISE NOTICE 'delete_star_extended-START : %', in_name;

  FOR rec_movie_featured_in IN cu_star_starsins(in_name)
  LOOP
    RAISE NOTICE 'LOOP-record : %', in_name;
    RAISE NOTICE 'Title : % year : % star : % '
    , rec_movie_featured_in.movietitle, rec_movie_featured_in.movieyear, rec_movie_featured_in.starname
    ;

    -- slet movies
    RAISE NOTICE 'MOVIES for %', in_name;

    FOR rec_star_featured IN cu_movies_stars (rec_movie_featured_in.movietitle, rec_movie_featured_in.movieyear)
    LOOP
      RAISE NOTICE 'STARS OF MOVIE title : % year : % star : % '
        , rec_star_featured.movietitle, rec_star_featured.movieyear, rec_star_featured.starname
      ;

    END LOOP;

    RAISE NOTICE 'DELETING starsin % % ', rec_movie_featured_in.movieyear, rec_movie_featured_in.starname;
    -- slet starsin
    DELETE FROM starsin
    WHERE movietitle = rec_movie_featured_in.movietitle
    AND  movieyear = rec_movie_featured_in.movieyear
    ;

    RAISE NOTICE 'DELETING MOVIES for %', in_name;
    --
    DELETE FROM movies
    WHERE title = rec_movie_featured_in.movietitle
    AND year = rec_movie_featured_in.movieyear
    ;

  END LOOP;
  RAISE NOTICE 'END-record-CU : %', in_name;

  RAISE NOTICE 'DELETING STARSINS for %', in_name;
  -- slet starsin
  DELETE FROM starsin
  WHERE starname = in_name;
     

  -- slet moviestjerne
  RAISE NOTICE 'DELETING MOVIESTAR %', in_name;
  DELETE
  FROM moviestar
  WHERE name = in_name
  ;

  RAISE NOTICE 'delete_star_extended-END : %', in_name;
END
$PLAN_MM_AL$
LANGUAGE plpgsql
;
  