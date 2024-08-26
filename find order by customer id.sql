SELECT 
    o.order_id, 
    o.order_date, 
    o.status, 
    o.comments, 
    o.shipped_date, 
    s.name AS shipper_name
FROM 
    SQL_STORE.orders o
JOIN 
    SQL_STORE.shippers s ON o.shipper_id = s.shipper_id
WHERE 
    o.customer_id = 1;  -- Replace ? with the customer ID
