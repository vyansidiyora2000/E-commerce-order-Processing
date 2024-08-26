SELECT *, CASE 
             WHEN points > 1000 THEN 'gold'
             WHEN points > 500 THEN 'silver'
             ELSE 'bronze'
          END AS rewards
FROM sql_store.customers;
