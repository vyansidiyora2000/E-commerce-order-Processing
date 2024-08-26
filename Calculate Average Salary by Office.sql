-- Calculate the average salary of employees in each office
SELECT 
    o.office_id, 
    o.address AS office_address, 
    o.city AS office_city, 
    o.state AS office_state,
    AVG(e.salary) AS average_salary
FROM 
    SQL_HR.employees e
JOIN 
    SQL_HR.offices o ON e.office_id = o.office_id
GROUP BY 
    o.office_id, o.address, o.city, o.state;
