SELECT i.invoice_id, i.number AS invoice_number, c.name AS client_name,i.invoice_total,SUM(p.amount) AS total_payments,
    CASE WHEN SUM(p.amount) >= i.invoice_total THEN 'Fully Paid'WHEN SUM(p.amount) > 0 AND SUM(p.amount) < i.invoice_total THEN 'Partially Paid'
        ELSE 'Unpaid'END AS payment_status
FROM invoicing.invoices i
LEFT JOIN invoicing.payments p ON i.invoice_id = p.invoice_id
LEFT JOIN invoicing.clients c ON i.client_id = c.client_id
GROUP BY i.invoice_id, i.number, c.name,i.invoice_total
ORDER BY i.invoice_id;
