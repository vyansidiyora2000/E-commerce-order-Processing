-- List employees along with the number of direct reports they have
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    COUNT(e2.employee_id) AS direct_reports_count
FROM 
    SQL_HR.employees e
LEFT JOIN 
    SQL_HR.employees e2 ON e.employee_id = e2.reports_to
GROUP BY 
    e.employee_id, e.first_name, e.last_name;
