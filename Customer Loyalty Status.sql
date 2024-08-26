SELECT *, 
       CASE 
         WHEN points = (SELECT MAX(points) FROM sql_store.customers) THEN 'loyal' 
         ELSE 'not loyal' 
       END AS loyalty_status,
       MAX(points) OVER () AS loyal_customer
FROM sql_store.customers
ORDER BY points DESC
LIMIT 1;
