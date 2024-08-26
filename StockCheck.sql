SELECT 
    p.product_id, 
    p.name AS product_name, 
    p.quantity_in_stock, 
    p.unit_price
FROM 
    SQL_STORE.products p
WHERE 
    p.quantity_in_stock < 500; 
