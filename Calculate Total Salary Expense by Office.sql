-- Calculate the total salary expense for each office
SELECT 
    o.office_id, 
    o.address AS office_address, 
    o.city AS office_city, 
    o.state AS office_state,
    SUM(e.salary) AS total_salary_expense
FROM 
    SQL_HR.employees e
JOIN 
    SQL_HR.offices o ON e.office_id = o.office_id
GROUP BY 
    o.office_id, o.address, o.city, o.state;
