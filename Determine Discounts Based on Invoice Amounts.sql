-- Determine discounts based on total invoice amount
SELECT 
    c.client_id, 
    c.name AS client_name, 
    SUM(i.invoice_total) AS total_invoice_amount,
    CASE 
        WHEN SUM(i.invoice_total) >= 5000 THEN 0.20  -- 20% discount for invoices totaling $5000 or more
        WHEN SUM(i.invoice_total) >= 3000 THEN 0.15  -- 15% discount for invoices totaling $3000 to $4999
        WHEN SUM(i.invoice_total) >= 1000 THEN 0.10  -- 10% discount for invoices totaling $1000 to $2999
        ELSE 0.05  -- 5% discount for invoices totaling less than $1000
    END AS discount_percentage
FROM 
    invoicing.clients c
JOIN 
    invoicing.invoices i ON c.client_id = i.client_id
GROUP BY 
    c.client_id, c.name
ORDER BY 
    total_invoice_amount DESC;
