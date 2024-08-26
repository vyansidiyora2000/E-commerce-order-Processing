SELECT 
    p.product_id, 
    p.name AS product_name, 
    SUM(oi.quantity) AS total_quantity
FROM 
    SQL_STORE.order_items oi
JOIN 
    SQL_STORE.products p ON oi.product_id = p.product_id
GROUP BY 
    p.product_id, p.name
ORDER BY 
    total_quantity DESC
LIMIT 10;  -- Top 10 most popular products
