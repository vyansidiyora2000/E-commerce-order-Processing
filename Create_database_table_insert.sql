CREATE DATABASE SQL_STORE;
CREATE DATABASE SQL_INVENTORY;
CREATE DATABASE INVOICING;
CREATE DATABASE SQL_HR;
USE SQL_STORE;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    phone VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(50),
    state CHAR(2),
    points INT
);

CREATE TABLE order_statuses (
    order_status_id TINYINT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE shippers (
    shipper_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    status TINYINT,
    comments VARCHAR(2000),
    shipped_date DATE,
    shipper_id SMALLINT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (status) REFERENCES order_statuses(order_status_id),
    FOREIGN KEY (shipper_id) REFERENCES shippers(shipper_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    quantity_in_stock INT,
    unit_price DECIMAL(4,2)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(4,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
USE SQL_INVENTORY;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    quantity_in_stock INT,
    unit_price DECIMAL(8,2)
);
USE INVOICING;

CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(50),
    state CHAR(2),
    phone VARCHAR(50)
);

CREATE TABLE payment_methods (
    payment_method_id TINYINT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    number VARCHAR(50),
    client_id INT,
    invoice_total DECIMAL(9,2),
    payment_total DECIMAL(9,2),
    invoice_date DATE,
    due_date DATE,
    payment_date DATE,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    invoice_id INT,
    date DATE,
    amount DECIMAL(9,2),
    payment_method TINYINT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (payment_method) REFERENCES payment_methods(payment_method_id)
);
USE SQL_HR;

CREATE TABLE offices (
    office_id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(50),
    city VARCHAR(50),
    state CHAR(2)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(50),
    salary INT,
    reports_to INT,
    office_id INT,
    FOREIGN KEY (reports_to) REFERENCES employees(employee_id),
    FOREIGN KEY (office_id) REFERENCES offices(office_id)
);
USE SQL_STORE;

-- Insert sample customers
INSERT INTO customers (first_name, last_name, birth_date, phone, address, city, state, points)
VALUES 
('John', 'Doe', '1990-01-01', '555-1234', '123 Main St', 'New York', 'NY', 1000),
('Jane', 'Smith', '1985-05-15', '555-5678', '456 Elm St', 'Los Angeles', 'CA', 1500),
('Bob', 'Johnson', '1978-11-30', '555-9876', '789 Oak St', 'Chicago', 'IL', 750),
('David', 'Brown', '1980-09-22', '555-6789', '654 Pine St', 'Seattle', 'WA', 800),
('Emily', 'Davis', '1995-11-30', '555-1357', '987 Cedar Ln', 'Austin', 'TX', 950),
('Michael', 'Garcia', '1975-06-25', '555-2468', '147 Birch St', 'Boston', 'MA', 1100),
('Sophia', 'Martinez', '1988-12-12', '555-3698', '258 Spruce St', 'Miami', 'FL', 700),
('James', 'Miller', '1991-01-15', '555-4820', '369 Willow Dr', 'Denver', 'CO', 1300),
('Olivia', 'Wilson', '1993-04-05', '555-5912', '741 Oak Dr', 'Portland', 'OR', 850),
('William', 'Moore', '1986-07-08', '555-7389', '852 Elm Dr', 'Atlanta', 'GA', 950),
('Isabella', 'Taylor', '1990-10-21', '555-8495', '963 Maple St', 'Phoenix', 'AZ', 800),
('Daniel', 'Anderson', '1979-02-14', '555-9526', '654 Oak Ave', 'Philadelphia', 'PA', 1000);
-- Insert sample order statuses
INSERT INTO order_statuses (order_status_id, name)
VALUES 
(1, 'Processed'),
(2, 'Shipped'),
(3, 'Delivered'),
(4, 'Pending'),
(5, 'Cancelled');

-- Insert sample shippers
INSERT INTO shippers (name)
VALUES 
('FedEx'),
('UPS'),
('DHL');

ALTER TABLE products
MODIFY COLUMN unit_price DECIMAL(8,2);

-- Insert sample products
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES 
('iPhone', 100, 999.99),
('Samsung Galaxy', 150, 899.99),
('MacBook Pro', 50, 1999.99),
('Apple Watch', 80, 399.99),
('Google Pixel', 120, 799.99),
('Dell XPS 13', 40, 1299.99),
('Sony Headphones', 200, 149.99),
('Kindle Paperwhite', 150, 129.99),
('iPad Air', 70, 599.99),
('Fitbit Charge', 90, 149.99),
('Microsoft Surface', 30, 1199.99),
('HP Envy', 60, 999.99),
('Oculus Quest', 50, 299.99);

ALTER TABLE order_items
MODIFY COLUMN unit_price DECIMAL(8,2);
-- Insert sample orders
INSERT INTO orders (customer_id, order_date, status, comments, shipped_date, shipper_id)
VALUES 
(1, '2023-01-01', 2, 'Priority shipping', '2023-01-02', 1),
(2, '2023-01-15', 1, NULL, NULL, NULL),
(3, '2023-02-01', 3, 'Gift wrap requested', '2023-02-02', 2),
(4, '2023-02-15', 4, 'Awaiting stock', NULL, NULL),  -- Ensure 4 is a valid status
(5, '2023-03-01', 1, 'Standard shipping', '2023-03-05', 3),
(6, '2023-03-10', 2, 'Express shipping', '2023-03-11', 1),
(7, '2023-03-20', 5, 'Order cancelled', NULL, NULL),  -- Ensure 5 is a valid status
(8, '2023-04-01', 3, 'Gift wrap requested', '2023-04-03', 2),
(9, '2023-04-10', 4, 'Pending payment', NULL, NULL),  -- Ensure 4 is a valid status
(10, '2023-04-15', 2, 'Standard shipping', '2023-04-17', 3);



-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES 
(1, 1, 1, 999.99),
(2, 2, 2, 899.99),
(3, 3, 1, 999.99),
(4, 4, 2, 149.99),
(5, 5, 1, 799.99),
(6, 6, 1, 1299.99),
(7, 7, 3, 299.99),
(8, 8, 1, 1199.99),
(9, 9, 2, 999.99),
(10, 10, 1, 299.99);
USE INVOICING;

-- Insert sample clients
INSERT INTO clients (name, address, city, state, phone)
VALUES 
('Acme Corp', '123 Elm St', 'New York', 'NY', '555-1234'),
('Acme Corp', '123 Elm St', 'New York', 'NY', '555-1234'),
('Global Industries', '456 Oak Ave', 'San Francisco', 'CA', '555-5678'),
('Tech Solutions', '789 Maple Dr', 'Austin', 'TX', '555-8765'),
('Retail Hub', '101 Pine Ln', 'Seattle', 'WA', '555-4321'),
('HealthCo', '202 Cedar Blvd', 'Boston', 'MA', '555-6789');

-- Insert sample payment methods
INSERT INTO payment_methods (payment_method_id, name)
VALUES 
(1, 'Credit Card'),
(2, 'Debit Card'),
(3, 'Bank Transfer'),
(4, 'PayPal'),
(5, 'Gift Card');

-- Insert sample invoices
INSERT INTO invoices (number, client_id, invoice_total, payment_total, invoice_date, due_date, payment_date)
VALUES 
('INV001', 1, 1200.00, 1200.00, '2024-01-15', '2024-02-15', '2024-01-30'),
('INV002', 2, 800.00, 400.00, '2024-01-20', '2024-02-20', NULL),
('INV003', 3, 1500.00, 1500.00, '2024-02-01', '2024-03-01', '2024-02-15'),
('INV004', 4, 600.00, 600.00, '2024-02-10', '2024-03-10', '2024-02-28'),
('INV005', 5, 900.00, 450.00, '2024-03-05', '2024-04-05', NULL);

-- Insert sample payments
INSERT INTO payments (client_id, invoice_id, date, amount, payment_method)
VALUES 
(1, 1, '2024-01-30', 1200.00, 1),
(2, 2, '2024-02-10', 400.00, 3),
(3, 3, '2024-02-15', 1500.00, 2),
(4, 4, '2024-02-28', 600.00, 4),
(5, 5, '2024-03-25', 450.00, 5);
USE SQL_HR;

-- Insert sample offices
INSERT INTO offices (address, city, state)
VALUES 
('123 Main St', 'New York', 'NY'),
('456 Park Ave', 'San Francisco', 'CA'),
('789 Broad St', 'Austin', 'TX'),
('101 Pine St', 'Seattle', 'WA'),
('202 Oak St', 'Boston', 'MA');

-- Insert sample employees
INSERT INTO employees (first_name, last_name, job_title, salary, reports_to, office_id)
VALUES 
('John', 'Smith', 'Manager', 60000, NULL, 1),
('Jane', 'Doe', 'Developer', 55000, 1, 2),
('Michael', 'Brown', 'Analyst', 50000, 1, 3),
('Emily', 'Davis', 'Designer', 52000, 2, 4),
('David', 'Wilson', 'HR Specialist', 48000, NULL, 5);
