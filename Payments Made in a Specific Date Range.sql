SELECT 
    p.payment_id, 
    p.date AS payment_date, 
    c.name AS client_name, 
    i.number AS invoice_number, 
    p.amount,
    pm.name AS payment_method
FROM 
    invoicing.payments p
JOIN 
    invoicing.clients c ON p.client_id = c.client_id
JOIN 
    invoicing.invoices i ON p.invoice_id = i.invoice_id
JOIN 
    invoicing.payment_methods pm ON p.payment_method = pm.payment_method_id
WHERE 
    p.date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY 
    p.date DESC;
