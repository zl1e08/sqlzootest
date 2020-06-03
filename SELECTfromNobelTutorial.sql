--11.Find all details of the prize won by PETER GRÜNBERG
SELECT * FROM nobel
WHERE winner LIKE '%Gr' + CHAR(252) + 'nberg'

--12.Find all details of the prize won by EUGENE O'NEILL
SELECT * FROM nobel
WHERE winner = 'Eugene O''Neill'

--13.Knights in order
--List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner,yr,subject FROM nobel
WHERE winner like 'Sir%'
ORDER BY yr DESC,winner 

--14.The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
--Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject 
FROM nobel 
WHERE yr=1984 
ORDER BY
CASE WHEN subject IN ('Chemistry','Physics') THEN 1 ELSE 0 END,
 subject, winner
