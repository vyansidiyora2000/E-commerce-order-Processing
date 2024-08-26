-- List all employees along with their manager's details
SELECT 
    e1.employee_id AS employee_id, 
    e1.first_name AS employee_first_name, 
    e1.last_name AS employee_last_name, 
    e1.job_title AS employee_job_title, 
    e2.employee_id AS manager_id, 
    e2.first_name AS manager_first_name, 
    e2.last_name AS manager_last_name, 
    e2.job_title AS manager_job_title
FROM 
    SQL_HR.employees e1
LEFT JOIN 
    SQL_HR.employees e2 ON e1.reports_to = e2.employee_id;
