-- Find the highest paid employee in each office
WITH EmployeeSalaries AS (
    SELECT 
        e.employee_id, 
        e.first_name, 
        e.last_name, 
        e.salary, 
        e.office_id
    FROM 
        SQL_HR.employees e
)
SELECT 
    o.office_id, 
    o.address AS office_address, 
    o.city AS office_city, 
    o.state AS office_state, 
    es.employee_id, 
    es.first_name, 
    es.last_name, 
    es.salary
FROM 
    EmployeeSalaries es
JOIN 
    SQL_HR.offices o ON es.office_id = o.office_id
JOIN (
    SELECT 
        office_id, 
        MAX(salary) AS max_salary
    FROM 
        EmployeeSalaries
    GROUP BY 
        office_id
) max_salaries ON es.office_id = max_salaries.office_id AND es.salary = max_salaries.max_salary;
