-- 코드를 작성해주세요

WITH TECH AS (
    SELECT *
    FROM DEVELOPERS AS D
    INNER JOIN SKILLCODES AS S
    ON (D.SKILL_CODE & S.CODE) = S.CODE
    
), FG AS (
    SELECT ID
    FROM TECH
    WHERE CATEGORY = 'Front End'
), PG AS (
    SELECT ID
    FROM TECH
    WHERE NAME = 'Python'
), CG AS (
    SELECT ID
    FROM TECH
    WHERE NAME = 'C#'
)

SELECT (CASE
            WHEN ID IN (SELECT ID FROM FG) AND ID IN (SELECT ID FROM PG) THEN 'A'
            WHEN ID IN (SELECT ID FROM CG) THEN 'B'
            WHEN ID IN (SELECT ID FROM FG) THEN 'C'
        END 
       ) AS GRADE,
       ID,
       EMAIL
FROM TECH
WHERE (ID IN (SELECT ID FROM FG) AND ID IN (SELECT ID FROM PG))
    OR (ID IN (SELECT ID FROM CG))
    OR (ID IN (SELECT ID FROM FG))

GROUP BY ID, EMAIL
ORDER BY GRADE, ID

