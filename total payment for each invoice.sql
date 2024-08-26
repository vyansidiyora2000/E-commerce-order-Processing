SELECT 
    i.invoice_id, 
    i.number AS invoice_number, 
    SUM(p.amount) AS total_payments
FROM 
    invoicing.invoices i
LEFT JOIN 
    invoicing.payments p ON i.invoice_id = p.invoice_id
GROUP BY 
    i.invoice_id, i.number
ORDER BY 
    i.invoice_id;
