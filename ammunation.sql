CREATE DATABASE IF NOT EXISTS ammunation;
USE ammunation;
CREATE TABLE weapons (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(100) NOT NULL,          
    type VARCHAR(50) NOT NULL,           
    price DECIMAL(10, 2) NOT NULL,       
    stock INT NOT NULL DEFAULT 0         
);


CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(100) NOT NULL,          
    address VARCHAR(255),                
    phone VARCHAR(20)                    
);


CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    customer_id INT NOT NULL,            
    weapon_id INT NOT NULL,              
    quantity INT NOT NULL,               
    sale_date DATE NOT NULL,             
    total_price DECIMAL(10, 2) NOT NULL, 
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (weapon_id) REFERENCES weapons(id) ON DELETE CASCADE
);


INSERT INTO weapons (name, type, price, stock) VALUES
('Desert Eagle', 'Pistol', 500.00, 50),
('Ak-47', 'Assault Rifle', 1200.00, 20),
('Spas-12', 'Shotgun', 350.00, 30),
('Barrett M82', 'Sniper Rifle', 8000.00, 5);


INSERT INTO customers (name, address, phone) VALUES
('Kepin', 'Jalan Jamban 50', '555-1234'),
('Zeckerton', 'Jalan Skibidi 500', '555-5678'),
('Linglung', 'Jalan Amba 69', '555-9012');


INSERT INTO sales (customer_id, weapon_id, quantity, sale_date, total_price) VALUES
(1, 1, 2, '2023-10-01', 1000.00),  
(2, 2, 1, '2023-10-02', 1200.00),  

(3, 3, 3, '2023-10-03', 1050.00);  
