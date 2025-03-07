-- 코드를 작성해주세요
SELECT C.ID
FROM ECOLI_DATA AS A
INNER JOIN ECOLI_DATA AS B
ON A.ID = B.PARENT_ID
INNER JOIN ECOLI_DATA AS C
ON B.ID = C.PARENT_ID
WHERE A.PARENT_ID IS NULL
ORDER BY C.ID ASC