-- Car Auto Parts Retail System Database Schema

CREATE DATABASE car_parts_system;
USE car_parts_system;

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    role ENUM('customer', 'admin') DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Car makes table
CREATE TABLE car_makes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    logo_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Car models table
CREATE TABLE car_models (
    id INT AUTO_INCREMENT PRIMARY KEY,
    make_id INT,
    name VARCHAR(50) NOT NULL,
    year_from INT,
    year_to INT,
    FOREIGN KEY (make_id) REFERENCES car_makes(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    part_number VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    category_id INT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    image_url VARCHAR(255),
    is_featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);

-- Product compatibility table (many-to-many relationship)
CREATE TABLE product_compatibility (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    car_model_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (car_model_id) REFERENCES car_models(id) ON DELETE CASCADE
);

-- Orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
    shipping_address TEXT NOT NULL,
    phone VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Order items table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Insert sample data
INSERT INTO users (username, email, password, full_name, role) VALUES
('admin', 'admin@carparts.co.tz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'System Administrator', 'admin'),
('john_doe', 'john@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'John Doe', 'customer');

INSERT INTO car_makes (name, logo_url) VALUES
('Toyota', '/assets/images/logos/toyota-logo.png'),
('Nissan', '/assets/images/logos/nissan-logo.png'),
('Honda', '/assets/images/logos/honda-logo.png'),
('Mazda', '/assets/images/logos/mazda-logo.png'),
('Mitsubishi', '/assets/images/logos/mitsubishi-logo.png'),
('Subaru', '/assets/images/logos/subaru-logo.png'),
('Isuzu', '/assets/images/logos/isuzu-logo.png'),
('Suzuki', '/assets/images/logos/suzuki-logo.png'),
('Hyundai', '/assets/images/logos/hyundai-logo.png'),
('Volkswagen', '/assets/images/logos/vw-logo.png');

INSERT INTO car_models (make_id, name, year_from, year_to) VALUES
-- Toyota models
(1, 'Hilux', 2005, 2024),
(1, 'Corolla', 2003, 2024),
(1, 'Camry', 2006, 2024),
(1, 'Land Cruiser', 2008, 2024),
(1, 'RAV4', 2006, 2024),

-- Nissan models
(2, 'X-Trail', 2007, 2024),
(2, 'Navara', 2005, 2024),
(2, 'Patrol', 2010, 2024),
(2, 'Qashqai', 2007, 2024),

-- Honda models
(3, 'Civic', 2006, 2024),
(3, 'CR-V', 2007, 2024),
(3, 'Accord', 2008, 2024),
(3, 'Pilot', 2009, 2024),

-- Mazda models
(4, 'Demio', 2007, 2024),
(4, 'CX-5', 2012, 2024),
(4, 'Mazda3', 2009, 2024),
(4, 'BT-50', 2011, 2024),

-- Mitsubishi models
(5, 'Pajero', 2006, 2024),
(5, 'L200', 2006, 2024),
(5, 'Outlander', 2007, 2024),
(5, 'ASX', 2010, 2024),

-- Subaru models
(6, 'Forester', 2008, 2024),
(6, 'Impreza', 2007, 2024),
(6, 'Outback', 2009, 2024),
(6, 'XV', 2012, 2024),

-- Isuzu models
(7, 'D-Max', 2012, 2024),
(7, 'MU-X', 2013, 2024),
(7, 'Trooper', 2000, 2015),

-- Suzuki models
(8, 'Swift', 2010, 2024),
(8, 'Vitara', 2015, 2024),
(8, 'Jimny', 2018, 2024),
(8, 'Baleno', 2016, 2024),

-- Hyundai models
(9, 'Tucson', 2015, 2024),
(9, 'Elantra', 2011, 2024),
(9, 'Santa Fe', 2012, 2024),
(9, 'i20', 2014, 2024),

-- Volkswagen models
(10, 'Golf', 2009, 2024),
(10, 'Polo', 2010, 2024),
(10, 'Tiguan', 2016, 2024),
(10, 'Passat', 2011, 2024);

INSERT INTO categories (name, description) VALUES
('Engine Parts', 'Engine components and accessories'),
('Brake System', 'Brake pads, discs, and brake system components'),
('Suspension', 'Shock absorbers, springs, and suspension parts'),
('Electrical', 'Lights, batteries, and electrical components'),
('Filters', 'Air filters, oil filters, and fuel filters'),
('Transmission', 'Gearbox and transmission components'),
('Cooling System', 'Radiators, water pumps, and cooling parts'),
('Exhaust System', 'Exhaust pipes, mufflers, and catalytic converters'),
('Body Parts', 'Bumpers, mirrors, and body accessories'),
('Interior', 'Seats, dashboard, and interior accessories');

-- Extended product data with 7+ parts for 10 different car brands
INSERT INTO products (part_number, name, description, category_id, price, stock_quantity, image_url, is_featured) VALUES

-- TOYOTA Parts (7 parts)
('TY001', 'Toyota Hilux Front Brake Pads', 'Ceramic brake pads for Toyota Hilux 2005-2024 front wheels', 2, 45000, 50, '/assets/images/brake-pads.jpg', TRUE),
('TY002', 'Toyota Corolla Air Filter', 'High performance air filter for Toyota Corolla 2003-2024', 5, 25000, 80, '/assets/images/air-filter.jpg', FALSE),
('TY003', 'Toyota Camry Radiator', 'Aluminum radiator for Toyota Camry 2006-2024 cooling system', 7, 185000, 15, '/assets/images/radiator.jpg', TRUE),
('TY004', 'Toyota Hilux Headlight Assembly', 'LED headlight assembly for Toyota Hilux 2016-2024', 4, 220000, 25, '/assets/images/headlight.jpg', FALSE),
('TY005', 'Toyota Engine Oil Filter', 'Original equipment oil filter for Toyota engines 1.6L-3.0L', 5, 15000, 120, '/assets/images/oil-filter.jpg', TRUE),
('TY006', 'Toyota Corolla Clutch Kit', 'Complete clutch kit for Toyota Corolla manual transmission', 6, 285000, 12, '/assets/images/clutch-kit.jpg', FALSE),
('TY007', 'Toyota Camry Fuel Pump', 'Electric fuel pump for Toyota Camry 2.4L engine', 1, 165000, 18, '/assets/images/fuel-pump.jpg', FALSE),

-- NISSAN Parts (7 parts)
('NS001', 'Nissan X-Trail Shock Absorber', 'Gas-filled shock absorber for Nissan X-Trail rear suspension', 3, 85000, 30, '/assets/images/shock-absorber.jpg', TRUE),
('NS002', 'Nissan Navara Turbocharger', 'Turbocharger for Nissan Navara 2.5L diesel engine', 1, 450000, 8, '/assets/images/turbocharger.jpg', FALSE),
('NS003', 'Nissan X-Trail Brake Disc', 'Ventilated brake disc for Nissan X-Trail front wheels', 2, 75000, 35, '/assets/images/brake-disc.jpg', FALSE),
('NS004', 'Nissan Navara Alternator', '12V alternator for Nissan Navara charging system', 4, 195000, 20, '/assets/images/alternator.jpg', TRUE),
('NS005', 'Nissan X-Trail Cabin Filter', 'HEPA cabin air filter for Nissan X-Trail air conditioning', 5, 35000, 45, '/assets/images/cabin-filter.jpg', FALSE),
('NS006', 'Nissan Navara Differential', 'Rear differential assembly for Nissan Navara 4WD', 6, 385000, 6, '/assets/images/differential.jpg', FALSE),
('NS007', 'Nissan X-Trail Catalytic Converter', 'Catalytic converter for Nissan X-Trail exhaust system', 8, 275000, 10, '/assets/images/catalytic-converter.jpg', FALSE),

-- HONDA Parts (7 parts)
('HD001', 'Honda Civic Headlight Assembly', 'Xenon headlight assembly for Honda Civic 2006-2012', 4, 180000, 22, '/assets/images/headlight.jpg', TRUE),
('HD002', 'Honda CR-V Timing Belt Kit', 'Complete timing belt kit for Honda CR-V 2.0L engine', 1, 125000, 28, '/assets/images/timing-belt.jpg', FALSE),
('HD003', 'Honda Civic Suspension Spring', 'Coil spring set for Honda Civic front suspension', 3, 95000, 40, '/assets/images/spring-set.jpg', FALSE),
('HD004', 'Honda CR-V Starter Motor', 'Electric starter motor for Honda CR-V 2.4L engine', 4, 145000, 16, '/assets/images/starter-motor.jpg', TRUE),
('HD005', 'Honda Civic Exhaust Muffler', 'Stainless steel exhaust muffler for Honda Civic', 8, 85000, 32, '/assets/images/muffler.jpg', FALSE),
('HD006', 'Honda CR-V Transmission Filter', 'Automatic transmission filter for Honda CR-V CVT', 6, 45000, 25, '/assets/images/transmission-filter.jpg', FALSE),
('HD007', 'Honda Civic Power Steering Pump', 'Hydraulic power steering pump for Honda Civic', 3, 165000, 14, '/assets/images/power-steering-pump.jpg', FALSE),

-- MAZDA Parts (7 parts)
('MZ001', 'Mazda Demio Brake Disc', 'Solid brake disc for Mazda Demio front wheels', 2, 55000, 40, '/assets/images/brake-disc.jpg', FALSE),
('MZ002', 'Mazda CX-5 Turbocharger', 'Variable geometry turbocharger for Mazda CX-5 2.2L diesel', 1, 485000, 5, '/assets/images/turbocharger.jpg', TRUE),
('MZ003', 'Mazda Demio Strut Assembly', 'Complete strut assembly for Mazda Demio front suspension', 3, 115000, 24, '/assets/images/strut-assembly.jpg', FALSE),
('MZ004', 'Mazda CX-5 Battery', 'AGM battery 12V 70Ah for Mazda CX-5', 4, 125000, 18, '/assets/images/battery.jpg', FALSE),
('MZ005', 'Mazda Demio Fuel Filter', 'Inline fuel filter for Mazda Demio 1.3L engine', 5, 28000, 55, '/assets/images/fuel-filter.jpg', FALSE),
('MZ006', 'Mazda CX-5 CV Joint', 'Constant velocity joint for Mazda CX-5 front axle', 6, 95000, 20, '/assets/images/cv-joint.jpg', FALSE),
('MZ007', 'Mazda Demio Radiator Hose', 'Upper radiator hose for Mazda Demio cooling system', 7, 35000, 45, '/assets/images/radiator-hose.jpg', FALSE),

-- MITSUBISHI Parts (7 parts)
('MT001', 'Mitsubishi Pajero Spring Set', 'Heavy duty spring set for Mitsubishi Pajero suspension', 3, 155000, 15, '/assets/images/spring-set.jpg', TRUE),
('MT002', 'Mitsubishi L200 Injector', 'Diesel fuel injector for Mitsubishi L200 2.5L engine', 1, 185000, 12, '/assets/images/fuel-injector.jpg', FALSE),
('MT003', 'Mitsubishi Pajero Brake Caliper', 'Front brake caliper for Mitsubishi Pajero', 2, 125000, 18, '/assets/images/brake-caliper.jpg', FALSE),
('MT004', 'Mitsubishi L200 Fog Light', 'LED fog light assembly for Mitsubishi L200', 4, 65000, 30, '/assets/images/fog-light.jpg', FALSE),
('MT005', 'Mitsubishi Pajero Transmission Oil', 'ATF transmission oil for Mitsubishi Pajero automatic', 6, 85000, 25, '/assets/images/transmission-oil.jpg', FALSE),
('MT006', 'Mitsubishi L200 Water Pump', 'Mechanical water pump for Mitsubishi L200 cooling system', 7, 95000, 22, '/assets/images/water-pump.jpg', TRUE),
('MT007', 'Mitsubishi Pajero Tail Light', 'LED tail light assembly for Mitsubishi Pajero', 4, 85000, 28, '/assets/images/tail-light.jpg', FALSE),

-- SUBARU Parts (7 parts)
('SB001', 'Subaru Forester Shock Absorber', 'Gas shock absorber for Subaru Forester AWD suspension', 3, 105000, 26, '/assets/images/shock-absorber.jpg', FALSE),
('SB002', 'Subaru Impreza Turbocharger', 'Twin-scroll turbocharger for Subaru Impreza WRX', 1, 525000, 4, '/assets/images/turbocharger.jpg', TRUE),
('SB003', 'Subaru Forester Brake Pads', 'Performance brake pads for Subaru Forester front wheels', 2, 65000, 35, '/assets/images/brake-pads.jpg', FALSE),
('SB004', 'Subaru Impreza Headlight', 'Bi-xenon headlight for Subaru Impreza 2008-2014', 4, 195000, 16, '/assets/images/headlight.jpg', FALSE),
('SB005', 'Subaru Forester Air Filter', 'High-flow air filter for Subaru Forester boxer engine', 5, 42000, 38, '/assets/images/air-filter.jpg', FALSE),
('SB006', 'Subaru Impreza Clutch Disc', 'Performance clutch disc for Subaru Impreza manual', 6, 145000, 14, '/assets/images/clutch-disc.jpg', FALSE),
('SB007', 'Subaru Forester Exhaust Pipe', 'Stainless steel exhaust pipe for Subaru Forester', 8, 115000, 20, '/assets/images/exhaust-pipe.jpg', FALSE),

-- ISUZU Parts (7 parts)
('IZ001', 'Isuzu D-Max Turbocharger', 'Variable nozzle turbocharger for Isuzu D-Max 3.0L diesel', 1, 465000, 6, '/assets/images/turbocharger.jpg', FALSE),
('IZ002', 'Isuzu D-Max Brake Shoe', 'Rear brake shoe set for Isuzu D-Max drum brakes', 2, 55000, 32, '/assets/images/brake-shoe.jpg', FALSE),
('IZ003', 'Isuzu D-Max Leaf Spring', 'Heavy duty leaf spring for Isuzu D-Max rear suspension', 3, 185000, 12, '/assets/images/leaf-spring.jpg', TRUE),
('IZ004', 'Isuzu D-Max Glow Plug', 'Ceramic glow plug for Isuzu D-Max diesel engine', 4, 25000, 60, '/assets/images/glow-plug.jpg', FALSE),
('IZ005', 'Isuzu D-Max Diesel Filter', 'Fuel water separator for Isuzu D-Max diesel system', 5, 45000, 40, '/assets/images/diesel-filter.jpg', FALSE),
('IZ006', 'Isuzu D-Max Clutch Pressure Plate', 'Heavy duty clutch pressure plate for Isuzu D-Max', 6, 165000, 15, '/assets/images/pressure-plate.jpg', FALSE),
('IZ007', 'Isuzu D-Max Intercooler', 'Aluminum intercooler for Isuzu D-Max turbo system', 7, 225000, 8, '/assets/images/intercooler.jpg', TRUE),

-- SUZUKI Parts (7 parts)
('SZ001', 'Suzuki Swift Brake Pads', 'Ceramic brake pads for Suzuki Swift front wheels', 2, 38000, 45, '/assets/images/brake-pads.jpg', FALSE),
('SZ002', 'Suzuki Vitara Timing Chain', 'Timing chain kit for Suzuki Vitara 1.6L engine', 1, 125000, 18, '/assets/images/timing-chain.jpg', FALSE),
('SZ003', 'Suzuki Swift Strut Mount', 'Front strut mount for Suzuki Swift suspension', 3, 45000, 35, '/assets/images/strut-mount.jpg', FALSE),
('SZ004', 'Suzuki Vitara Alternator', 'High output alternator for Suzuki Vitara', 4, 165000, 14, '/assets/images/alternator.jpg', FALSE),
('SZ005', 'Suzuki Swift Cabin Filter', 'Activated carbon cabin filter for Suzuki Swift', 5, 32000, 50, '/assets/images/cabin-filter.jpg', FALSE),
('SZ006', 'Suzuki Vitara Transfer Case', 'Transfer case assembly for Suzuki Vitara 4WD', 6, 285000, 8, '/assets/images/transfer-case.jpg', FALSE),
('SZ007', 'Suzuki Swift Muffler', 'Sport muffler for Suzuki Swift exhaust system', 8, 75000, 25, '/assets/images/muffler.jpg', TRUE),

-- HYUNDAI Parts (7 parts)
('HY001', 'Hyundai Tucson Brake Disc', 'Ventilated brake disc for Hyundai Tucson front wheels', 2, 85000, 28, '/assets/images/brake-disc.jpg', FALSE),
('HY002', 'Hyundai Elantra Engine Mount', 'Hydraulic engine mount for Hyundai Elantra', 1, 65000, 32, '/assets/images/engine-mount.jpg', FALSE),
('HY003', 'Hyundai Tucson Shock Absorber', 'Gas shock absorber for Hyundai Tucson rear suspension', 3, 95000, 24, '/assets/images/shock-absorber.jpg', FALSE),
('HY004', 'Hyundai Elantra Starter Motor', 'Gear reduction starter for Hyundai Elantra', 4, 135000, 18, '/assets/images/starter-motor.jpg', FALSE),
('HY005', 'Hyundai Tucson Air Filter', 'Panel air filter for Hyundai Tucson 2.0L engine', 5, 35000, 42, '/assets/images/air-filter.jpg', FALSE),
('HY006', 'Hyundai Elantra CV Axle', 'Complete CV axle for Hyundai Elantra front wheel', 6, 115000, 20, '/assets/images/cv-axle.jpg', FALSE),
('HY007', 'Hyundai Tucson Thermostat', 'Engine thermostat for Hyundai Tucson cooling system', 7, 45000, 38, '/assets/images/thermostat.jpg', TRUE),

-- VOLKSWAGEN Parts (7 parts)
('VW001', 'VW Golf Turbocharger', 'Twin-scroll turbocharger for VW Golf 1.4L TSI', 1, 385000, 7, '/assets/images/turbocharger.jpg', FALSE),
('VW002', 'VW Polo Brake Pads', 'Low-dust brake pads for VW Polo front wheels', 2, 48000, 40, '/assets/images/brake-pads.jpg', FALSE),
('VW003', 'VW Golf Coil Spring', 'Progressive coil spring for VW Golf suspension', 3, 75000, 30, '/assets/images/coil-spring.jpg', FALSE),
('VW004', 'VW Polo Xenon Bulb', 'D1S xenon bulb for VW Polo headlight', 4, 85000, 25, '/assets/images/xenon-bulb.jpg', FALSE),
('VW005', 'VW Golf DSG Filter', 'Transmission filter for VW Golf DSG gearbox', 6, 95000, 22, '/assets/images/dsg-filter.jpg', TRUE),
('VW006', 'VW Polo EGR Valve', 'Exhaust gas recirculation valve for VW Polo diesel', 8, 165000, 12, '/assets/images/egr-valve.jpg', FALSE),
('VW007', 'VW Golf Water Pump', 'Electric water pump for VW Golf cooling system', 7, 185000, 15, '/assets/images/water-pump.jpg', FALSE);

-- Updated product compatibility with correct model IDs
INSERT INTO product_compatibility (product_id, car_model_id) VALUES
-- Toyota parts compatibility
(1, 1), (1, 4), (1, 5),  -- Hilux brake pads - Hilux, Land Cruiser, RAV4
(2, 2), (2, 3),          -- Corolla air filter - Corolla, Camry
(3, 3),                  -- Camry radiator - Camry only
(4, 1),                  -- Hilux headlight - Hilux only
(5, 1), (5, 2), (5, 3), (5, 4), (5, 5), -- Toyota oil filter - all Toyota models
(6, 2),                  -- Corolla clutch kit - Corolla only
(7, 3),                  -- Camry fuel pump - Camry only

-- Nissan parts compatibility
(8, 6),                  -- X-Trail shock absorber - X-Trail only
(9, 7),                  -- Navara turbocharger - Navara only
(10, 6),                 -- X-Trail brake disc - X-Trail only
(11, 7),                 -- Navara alternator - Navara only
(12, 6),                 -- X-Trail cabin filter - X-Trail only
(13, 7),                 -- Navara differential - Navara only
(14, 6),                 -- X-Trail catalytic converter - X-Trail only

-- Honda parts compatibility
(15, 10),                -- Civic headlight - Civic only
(16, 11),                -- CR-V timing belt - CR-V only
(17, 10),                -- Civic suspension spring - Civic only
(18, 11),                -- CR-V starter motor - CR-V only
(19, 10),                -- Civic exhaust muffler - Civic only
(20, 11),                -- CR-V transmission filter - CR-V only
(21, 10),                -- Civic power steering pump - Civic only

-- Mazda parts compatibility
(22, 14),                -- Demio brake disc - Demio only
(23, 15),                -- CX-5 turbocharger - CX-5 only
(24, 14),                -- Demio strut assembly - Demio only
(25, 15),                -- CX-5 battery - CX-5 only
(26, 14),                -- Demio fuel filter - Demio only
(27, 15),                -- CX-5 CV joint - CX-5 only
(28, 14),                -- Demio radiator hose - Demio only

-- Mitsubishi parts compatibility
(29, 18),                -- Pajero spring set - Pajero only
(30, 19),                -- L200 injector - L200 only
(31, 18),                -- Pajero brake caliper - Pajero only
(32, 19),                -- L200 fog light - L200 only
(33, 18),                -- Pajero transmission oil - Pajero only
(34, 19),                -- L200 water pump - L200 only
(35, 18),                -- Pajero tail light - Pajero only

-- Subaru parts compatibility
(36, 22),                -- Forester shock absorber - Forester only
(37, 23),                -- Impreza turbocharger - Impreza only
(38, 22),                -- Forester brake pads - Forester only
(39, 23),                -- Impreza headlight - Impreza only
(40, 22),                -- Forester air filter - Forester only
(41, 23),                -- Impreza clutch disc - Impreza only
(42, 22),                -- Forester exhaust pipe - Forester only

-- Isuzu parts compatibility
(43, 26),                -- D-Max turbocharger - D-Max only
(44, 26),                -- D-Max brake shoe - D-Max only
(45, 26),                -- D-Max leaf spring - D-Max only
(46, 26),                -- D-Max glow plug - D-Max only
(47, 26),                -- D-Max diesel filter - D-Max only
(48, 26),                -- D-Max clutch pressure plate - D-Max only
(49, 26),                -- D-Max intercooler - D-Max only

-- Suzuki parts compatibility
(50, 29),                -- Swift brake pads - Swift only
(51, 30),                -- Vitara timing chain - Vitara only
(52, 29),                -- Swift strut mount - Swift only
(53, 30),                -- Vitara alternator - Vitara only
(54, 29),                -- Swift cabin filter - Swift only
(55, 30),                -- Vitara transfer case - Vitara only
(56, 29),                -- Swift muffler - Swift only

-- Hyundai parts compatibility
(57, 33),                -- Tucson brake disc - Tucson only
(58, 34),                -- Elantra engine mount - Elantra only
(59, 33),                -- Tucson shock absorber - Tucson only
(60, 34),                -- Elantra starter motor - Elantra only
(61, 33),                -- Tucson air filter - Tucson only
(62, 34),                -- Elantra CV axle - Elantra only
(63, 33),                -- Tucson thermostat - Tucson only

-- Volkswagen parts compatibility
(64, 37),                -- Golf turbocharger - Golf only
(65, 38),                -- Polo brake pads - Polo only
(66, 37),                -- Golf coil spring - Golf only
(67, 38),                -- Polo xenon bulb - Polo only
(68, 37),                -- Golf DSG filter - Golf only
(69, 38),                -- Polo EGR valve - Polo only
(70, 37);                -- Golf water pump - Golf only
