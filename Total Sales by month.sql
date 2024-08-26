SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,SUM(oi.quantity * oi.unit_price) AS total_sales
FROM SQL_STORE.orders o
JOIN SQL_STORE.order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;
