SELECT 
    CAR_ID, 
    CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS sub
            WHERE sub.CAR_ID = CAR_RENTAL_COMPANY_RENTAL_HISTORY.CAR_ID
            AND '2022-10-16' BETWEEN sub.START_DATE AND sub.END_DATE
        ) THEN '대여중'
        ELSE '대여 가능'
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;