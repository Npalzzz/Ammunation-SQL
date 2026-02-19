-- Membuat database ammunation
CREATE DATABASE IF NOT EXISTS ammunation;
USE ammunation;

-- Tabel weapons: Menyimpan data senjata
CREATE TABLE weapons (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID unik untuk setiap senjata
    name VARCHAR(100) NOT NULL,          -- Nama senjata (misalnya "Pistol Glock")
    type VARCHAR(50) NOT NULL,           -- Jenis senjata (misalnya "Pistol", "Rifle")
    price DECIMAL(10, 2) NOT NULL,       -- Harga per unit (dalam USD)
    stock INT NOT NULL DEFAULT 0         -- Stok tersedia
);

-- Tabel customers: Menyimpan data pelanggan
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID unik untuk setiap pelanggan
    name VARCHAR(100) NOT NULL,          -- Nama pelanggan
    address VARCHAR(255),                -- Alamat pelanggan
    phone VARCHAR(20)                    -- Nomor telepon
);

-- Tabel sales: Menyimpan data penjualan
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID unik untuk setiap penjualan
    customer_id INT NOT NULL,            -- ID pelanggan (foreign key ke customers)
    weapon_id INT NOT NULL,              -- ID senjata (foreign key ke weapons)
    quantity INT NOT NULL,               -- Jumlah senjata yang dibeli
    sale_date DATE NOT NULL,             -- Tanggal penjualan
    total_price DECIMAL(10, 2) NOT NULL, -- Total harga (quantity * price)
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (weapon_id) REFERENCES weapons(id) ON DELETE CASCADE
);

-- Insert data dummy ke tabel weapons
INSERT INTO weapons (name, type, price, stock) VALUES
('Desert Eagle', 'Pistol', 500.00, 50),
('Ak-47', 'Assault Rifle', 1200.00, 20),
('Spas-12', 'Shotgun', 350.00, 30),
('Barrett M82', 'Sniper Rifle', 8000.00, 5);

-- Insert data dummy ke tabel customers
INSERT INTO customers (name, address, phone) VALUES
('Kepin', 'Jalan Jamban 50', '555-1234'),
('Zeckerton', 'Jalan Skibidi 500', '555-5678'),
('Linglung', 'Jalan Amba 69', '555-9012');

-- Insert data dummy ke tabel sales (contoh penjualan)
INSERT INTO sales (customer_id, weapon_id, quantity, sale_date, total_price) VALUES
(1, 1, 2, '2023-10-01', 1000.00),  -- Kepin beli 2 Pistol Glock
(2, 2, 1, '2023-10-02', 1200.00),  -- Zeckerton beli 1 AK-47
(3, 3, 3, '2023-10-03', 1050.00);  -- Linglung beli 3 Shotgun Spas-12