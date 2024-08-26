SELECT p.name AS product_name,p.quantity_in_stock AS quantity_in_stock,COALESCE(SUM(oi.quantity), 0)
 AS sold_items,p.quantity_in_stock - COALESCE(SUM(oi.quantity), 0) AS stock_left
FROM SQL_STORE.products p
LEFT JOIN SQL_STORE.order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name, p.quantity_in_stock
ORDER BY p.name;
