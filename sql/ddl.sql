CREATE DATABASE IF NOT EXISTS for_life_db;

USE for_life_db;

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
   id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(200) NOT NULL,
    email VARCHAR(150) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(120) NOT NULL,
    country VARCHAR(120) NOT NULL,
    passport VARCHAR(220) NOT NULL,
    lang VARCHAR(120) NOT NULL,
    genre ENUM('Masculino','Femenino') NOT NULL,
    home_addres VARCHAR(220) NOT NULL,
    city VARCHAR(220) NOT NULL,
    province VARCHAR(230) NOT NULL,
    zip_code VARCHAR(100) NOT NULL,
    birth_date DATE NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    avatar_url VARCHAR(500),
    UNIQUE KEY uq_customer_email (email),
    UNIQUE KEY uq_customer_passport (passport)
  ) ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS admins;

CREATE TABLE admins (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(200) NOT NULL,
    email VARCHAR(150) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(120) NOT NULL,
    country VARCHAR(120) NOT NULL,
    passport VARCHAR(220) NOT NULL,
    lang VARCHAR(120) NOT NULL,
    genre ENUM('Masculino','Femenino') NOT NULL,
    home_addres VARCHAR(220) NOT NULL,
    city VARCHAR(220) NOT NULL,
    province VARCHAR(230) NOT NULL,
    zip_code VARCHAR(100) NOT NULL,
    birth_date DATE NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    avatar_url VARCHAR(500),
    UNIQUE KEY uq_admin_email (email),
    UNIQUE KEY uq_admin_passport (passport)
  ) ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    sku VARCHAR(50) UNIQUE NOT NULL,
    size VARCHAR(20),
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(2048),
    stock INT DEFAULT 500,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS feedback;

CREATE TABLE feedback (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  score INT NOT NULL DEFAULT 1,
  customer_id INT UNSIGNED NOT NULL,
  product_id INT UNSIGNED NOT NULL,
  full_name VARCHAR(200) NOT NULL,
  comment VARCHAR(200) NOT NULL,
  status ENUM('Aprobada','Denegada', 'Pendiente') NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
    
INSERT INTO admins (
    full_name,
    email,
    password_hash,
    phone,
    country,
    passport,
    lang,
    genre,
    home_addres,
    city,
    province,
    zip_code,
    birth_date
) VALUES (
    'For Life Admin',
    'info@forlife.sa.cr',
    '$2y$10$9Gi.MjYuL7WX9KHY.GGfqe9AvRagArpboEi04A5bZ88boJA0dlevm', -- 743543AEOI$#&*@(irure_password 
    '+34600123456',
    'CR',
    'ABC123456',
    'es',
    'Masculino',
    'Calle Falsa 123',
    'Alajuela',
    'Alajuela',
    '28001',
    '1985-05-15'
);

INSERT INTO customer (
  full_name,
  email,
  password_hash,
  phone,
  country,
  passport,
  lang,
  genre,
  home_addres,
  city,
  province,
  zip_code,
  birth_date
) VALUES
('Juan Pérez', 'juan.perez@gmail.com', '$2y$10$9Gi.MjYuL7WX9KHY.GGfqe9AvRagArpboEi04A5bZ88boJA0dlevm', '8888-1111', 'Costa Rica', 'A1234567', 'es', 'Masculino', 'Calle 1', 'San José', 'San José', '10101', '1990-01-01'),
('María Rodríguez', 'maria.rodriguez@gmail.com', '$2y$10$9Gi.MjYuL7WX9KHY.GGfqe9AvRagArpboEi04A5bZ88boJA0dlevm', '8888-2222', 'Costa Rica', 'B2345678', 'es', 'Femenino', 'Calle 2', 'Alajuela', 'Alajuela', '20101', '1985-02-02'),
('Carlos Jiménez', 'carlos.jimenez@gmail.com', '$2y$10$9Gi.MjYuL7WX9KHY.GGfqe9AvRagArpboEi04A5bZ88boJA0dlevm', '8888-3333', 'Costa Rica', 'C3456789', 'es', 'Masculino', 'Calle 3', 'Cartago', 'Cartago', '30101', '1988-03-03'),
('Ana Morales', 'ana.morales@gmail.com', '$2y$10$9Gi.MjYuL7WX9KHY.GGfqe9AvRagArpboEi04A5bZ88boJA0dlevm', '8888-4444', 'Costa Rica', 'D4567890', 'es', 'Femenino', 'Calle 4', 'Heredia', 'Heredia', '40101', '1992-04-04'),
('Luis Fernández', 'luis.fernandez@gmail.com', '$2y$10$9Gi.MjYuL7WX9KHY.GGfqe9AvRagArpboEi04A5bZ88boJA0dlevm', '8888-5555', 'Costa Rica', 'E5678901', 'es', 'Masculino', 'Calle 5', 'Puntarenas', 'Puntarenas', '50101', '1987-05-05');

INSERT INTO products (title, description, category, sku, size, price, image_url) VALUES
('Performance Tech Tee', 'Moisture-wicking fabric for high-intensity training.', 'Apparel', 'TSH-B-001', 'L', 29.99, 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=800&q=80'),
('Aero-Ready Running Shorts', 'Lightweight mesh shorts with built-in liner.', 'Apparel', 'SH-R-002', 'M', 34.50, 'https://images.unsplash.com/photo-1596464716127-f2a82984de30?auto=format&fit=crop&w=800&q=80'),
('Elite Basketball Shoes', 'Maximum ankle support and responsive cushioning.', 'Footwear', 'SHO-BK-003', '10.5', 120.00, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=80'),
('Thermal Compression Leggings', 'Keeps muscles warm during cold-weather outdoor runs.', 'Apparel', 'LEG-C-004', 'S', 45.00, 'https://images.unsplash.com/photo-1539185441755-769473a23570?auto=format&fit=crop&w=800&q=80'),
('Yoga Flow Mat 6mm', 'Extra thick non-slip surface for stability.', 'Equipment', 'EQ-Y-005', 'One Size', 55.00, 'https://images.unsplash.com/photo-1592432678016-e910b452f9a2?auto=format&fit=crop&w=800&q=80'),
('Pro-Grip Quarterbacks Gloves', 'Super-sticky palm for ultimate ball control.', 'Equipment', 'GL-FB-006', 'M', 60.00, 'https://images.unsplash.com/photo-1566576721346-d4a3b4eaad5b?auto=format&fit=crop&w=800&q=80'),
('Marathon Racing Flats', 'Ultra-lightweight shoes designed for speed.', 'Footwear', 'SHO-RN-007', '9', 140.99, 'https://images.unsplash.com/photo-1552308995-2baac1ad749a?auto=format&fit=crop&w=800&q=80'),
('Adjustable Weighted Vest', 'Add up to 20lbs of resistance to your workout.', 'Equipment', 'EQ-WV-008', 'OSFA', 85.00, 'https://images.unsplash.com/photo-1517438984742-1262db08379e?auto=format&fit=crop&w=800&q=80'),
('Prime Knit Soccer Cleats', 'Seamless upper for a second-skin feel on the pitch.', 'Footwear', 'SHO-SC-009', '11', 110.00, 'https://images.unsplash.com/photo-1510133760528-3f28b3ef42b9?auto=format&fit=crop&w=800&q=80'),
('Impact Sports Bra', 'High-support bra designed for running and HIIT.', 'Apparel', 'BRA-S-010', 'M', 40.00, 'https://images.unsplash.com/photo-1518310383802-640c2de311b2?auto=format&fit=crop&w=800&q=80'),
('Heavyweight Cotton Hoodie', 'Post-workout comfort with a soft fleece lining.', 'Apparel', 'HD-F-011', 'XL', 65.00, 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?auto=format&fit=crop&w=800&q=80'),
('Carbon Fiber Tennis Racket', 'Professional grade frame for increased power.', 'Equipment', 'EQ-TR-012', 'One Size', 210.00, 'https://images.unsplash.com/photo-1622279457486-62dcc4a4bd13?auto=format&fit=crop&w=800&q=80'),
('Waterproof Trail Jacket', 'Sealed seams and breathable tech for hiking.', 'Apparel', 'JKT-T-013', 'L', 130.00, 'https://images.unsplash.com/photo-1508107509383-0dc2ac82b3ef?auto=format&fit=crop&w=800&q=80'),
('CrossFit Training Shoes', 'Stable flat sole for lifting and jumping.', 'Footwear', 'SHO-CF-014', '10', 130.00, 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?auto=format&fit=crop&w=800&q=80'),
('Reflective Cycling Jersey', 'Stay visible on the road with 360-degree reflectivity.', 'Apparel', 'JSY-C-015', 'L', 75.00, 'https://images.unsplash.com/photo-1534353473418-4cfa6c56fd38?auto=format&fit=crop&w=800&q=80'),
('Duffel Training Bag', '50L capacity with separate shoe compartment.', 'Equipment', 'BAG-D-016', 'Large', 50.00, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=800&q=80'),
('Quick-Dry Swim Trunks', 'Chlorine-resistant fabric with 4-way stretch.', 'Apparel', 'SW-T-017', 'M', 35.00, 'https://images.unsplash.com/photo-1501386761578-eac5c94b800a?auto=format&fit=crop&w=800&q=80'),
('Weighted Leather Jump Rope', 'Ball-bearing handles for smooth rotation.', 'Equipment', 'EQ-JR-018', 'Adjustable', 20.00, 'https://images.unsplash.com/photo-1434596922112-19c563067271?auto=format&fit=crop&w=800&q=80'),
('Compression Arm Sleeve', 'Graduated compression to improve blood flow.', 'Equipment', 'SL-A-019', 'S/M', 15.00, 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=800&q=80'),
('Sun Protection Snapback', 'UV-blocking brim with moisture-wicking sweatband.', 'Apparel', 'HAT-S-020', 'One Size', 25.00, 'https://images.unsplash.com/photo-1521369909029-2afed882baee?auto=format&fit=crop&w=800&q=80');

INSERT INTO feedback (score, customer_id, product_id, full_name, comment , status) VALUES
(5, 1, 1, 'Juan Pérez', '¡Excelente producto, muy recomendado!', 'Aprobada'),
(4, 2, 2, 'María Rodríguez', 'Muy util el producto.', 'Aprobada'),
(5, 3, 3, 'Carlos Jiménez', '100% calidad, los recomiendo 100%.', 'Aprobada'),
(3, 4, 4, 'Ana Morales', 'Esperaba menos calidad pero el producto fue excelente.', 'Aprobada');