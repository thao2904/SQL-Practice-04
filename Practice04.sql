--Practice01:
SELECT 
SUM(CASE 
    WHEN device_type = 'laptop' THEN 1 
    ELSE 0
END) AS laptop_views,
SUM(CASE 
    WHEN device_type = 'tablet' or device_type ='phone' THEN 1
    ELSE 0
END) AS mobile_views
FROM viewership;
--Practice02:
SELECT x,y,z,
CASE 
    WHEN x + y > z and x + z > y and z + y > x THEN 'Yes'
    ELSE 'No'
END AS triangle
from Triangle
--Practice03:
SELECT 
ROUND
    (SUM(
    CASE WHEN call_category = 'n/a' OR call_category IS NULL THEN 1
    ELSE 0
    END) 
    / CAST(COUNT(*) AS DECIMAL) * 100, 1) AS uncategorised_call_pct
FROM callers;
--Practice04:
SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;
---
SELECT name
FROM Customer
WHERE 
    CASE 
        WHEN referee_id <> 2 OR referee_id IS NULL THEN 1
        ELSE 0
    END = 1;
--Practice05:
select survived,
SUM(CASE
    WHEN pclass = 1 THEN 1
    ELSE 0
END) AS first_class,
SUM(CASE
    WHEN pclass =  2 THEN 1
    ELSE 0
END) AS second_class,
SUM(CASE
    WHEN pclass = 3 THEN 1
    ELSE 0
END) AS third_class
FROM titanic
GROUP BY survived;


