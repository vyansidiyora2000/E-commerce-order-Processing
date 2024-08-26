SELECT 
    c.client_id, 
    c.name AS client_name, 
    SUM(p.amount) AS total_paid
FROM 
    invoicing.clients c
JOIN 
    invoicing.payments p ON c.client_id = p.client_id
GROUP BY 
    c.client_id, c.name
ORDER BY 
    total_paid DESC
LIMIT 5;
