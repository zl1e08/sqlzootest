--8.List the films in which 'Harrison Ford' has appeared
SELECT title
FROM movie
JOIN casting ON casting.movieid=movie.id
JOIN actor ON casting.actorid=actor.id
WHERE actor.name='Harrison Ford'

--9.List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position --of the actor. If ord=1 then this actor is in the starring role]
SELECT title
FROM movie
JOIN casting ON casting.movieid=movie.id
JOIN actor ON casting.actorid=actor.id
WHERE actor.name='Harrison Ford' AND ord !=1

--10.List the films together with the leading star for all 1962 films.
SELECT movie.title,actor.name FROM movie
JOIN casting ON casting.movieid=movie.id
JOIN actor ON casting.actorid=actor.id
WHERE yr=1962 and ord=1

--11.Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he 
--made more than 2 movies.
SELECT yr,COUNT(title) FROM
movie JOIN casting ON movie.id=movieid
      JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--12.List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT movie.title,actor.name FROM movie
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE movieid IN (
         SELECT movieid 
         FROM casting
         JOIN actor ON actor.id=casting.actorid
         JOIN movie ON movie.id=casting.movieid
         WHERE name='Julie Andrews')
AND ord=1

--13.Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT actor.name FROM actor
JOIN casting   ON actorid=actor.id
JOIN movie ON movie.id=movieid
WHERE  ord=1
GROUP BY name
HAVING COUNT(movieid)>=15

--14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title,COUNT(actorid)as number
FROM movie JOIN casting ON id=movieid
WHERE yr=1978
GROUP BY title
ORDER BY number DESC,title

--15.List all the people who have worked with 'Art Garfunkel'.
SELECT DISTINCT name 
FROM actor 
JOIN casting ON casting.actorid=actor.id
JOIN movie ON casting.movieid=movie.id
WHERE movieid in
      (SELECT movieid 
        FROM casting
        JOIN movie ON movie.id=casting.movieid                                                   
        JOIN actor ON casting.actorid=actor.id
        AND name='Art Garfunkel')
AND name <> 'Art Garfunkel'
