-- 코드를 입력하세요
SELECT AI.ANIMAL_ID, AI.NAME 
FROM ANIMAL_INS AS AI
INNER JOIN ANIMAL_OUTS AS AO ON AI.ANIMAL_ID = AO.ANIMAL_ID
ORDER BY AO.DATETIME - AI.DATETIME DESC
LIMIT 2

-- 입양간, 가장 보호 긴 두마리