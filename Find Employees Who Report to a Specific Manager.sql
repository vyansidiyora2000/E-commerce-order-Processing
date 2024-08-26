-- Find all employees who report to a specific manager (e.g., employee_id = 3)
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    e.job_title
FROM 
    SQL_HR.employees e
WHERE 
    e.reports_to = 1;
