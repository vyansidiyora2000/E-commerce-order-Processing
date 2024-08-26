SELECT c.name AS client_name, pm.name AS payment_method, p.date AS payment_date, p.amount AS payment_amount, i.number AS invoice_number
FROM invoicing.payments p
JOIN invoicing.clients c ON p.client_id = c.client_id
JOIN invoicing.invoices i ON p.invoice_id = i.invoice_id
JOIN invoicing.payment_methods pm ON p.payment_method = pm.payment_method_id
ORDER BY p.date DESC;
