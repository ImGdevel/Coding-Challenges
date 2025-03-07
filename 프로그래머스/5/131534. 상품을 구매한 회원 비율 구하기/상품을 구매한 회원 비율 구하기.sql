-- 코드를 입력하세요

WITH TOTAL AS (
    SELECT COUNT(*)
    FROM USER_INFO 
    WHERE YEAR(JOINED) = '2021'
)

SELECT 
    YEAR(S.SALES_DATE) AS YEAR,
    MONTH(S.SALES_DATE) AS MONTH,
    COUNT(DISTINCT(S.USER_ID)) AS PURCHASED_USERS,
    ROUND(COUNT(DISTINCT(S.USER_ID)) / (SELECT * FROM TOTAL),1) AS PUCHASED_RATIO
    
FROM USER_INFO AS U
INNER JOIN ONLINE_SALE AS S
ON U.USER_ID = S.USER_ID
WHERE YEAR(U.JOINED) = '2021'
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH


