-- Active: 1715669253922@@127.0.0.1@3306
-- 1. Analyse the data
-- ****************************************************************
select u.*,
    p.*
from users u
    join progress p on u.user_id = p.user_id;
-- 2. What are the Top 25 schools (.edu domains)?
-- ****************************************************************


SELECT COUNT(u.email_domain) AS `Number of students`, u.email_domain
FROM users u
GROUP BY email_domain
ORDER BY `Number of Students` DESC
LIMIT 25;

 -- How many .edu learners are located in New York? 
    -- ****************************************************************

SELECT COUNT(*)
FROM users
WHERE email_domain LIKE '%.edu'
AND city = 'New York';

    -- The mobile_app column contains either mobile-user or NULL. 
    -- How many of these Codecademy learners are using the mobile app?
    -- ****************************************************************

SELECT COUNT(*)
FROM users
WHERE mobile_app LIKE 'mobile-user'


    -- 3. Query for the sign up counts for each hour.
    -- Refer to CodeAcademy to solve this question
    -- Hint: https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format 
    -- ****************************************************************
select strftime('%H', sign_up_at) as sign_up_hour, count(*) as sign_up_count
from users group BY sign_up_hour
order BY sign_up_hour;
    -- 4. Do different schools (.edu domains) prefer different courses?
    -- ****************************************************************


    -- What courses are the New Yorker Students taking?
    -- ****************************************************************

SELECT p.*
FROM users u
JOIN progress p ON u.user_id = p.user_id
WHERE u.city = 'New York';
 
    -- What courses are the Chicago Students taking?
    -- ****************************************************************
    SELECT p.*
FROM users u
JOIN progress p ON u.user_id = p.user_id
WHERE u.city = 'Chicago';