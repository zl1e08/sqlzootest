--11.Find all details of the prize won by PETER GRÜNBERG
SELECT * FROM nobel
WHERE winner LIKE '%Gr' + CHAR(252) + 'nberg'
