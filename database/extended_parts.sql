-- Additional 30 auto parts to extend the catalog
-- This brings the total to 100 unique parts (70 existing + 30 new)

INSERT INTO products (part_number, name, description, category_id, price, stock_quantity, image_url, is_featured) VALUES

-- TOYOTA Additional Parts (3 more parts)
('TY008', 'Toyota Hilux Bull Bar', 'Heavy duty steel bull bar for Toyota Hilux front protection', 9, 285000, 12, '/assets/images/bull-bar.jpg', TRUE),
('TY009', 'Toyota Corolla Window Regulator', 'Electric window regulator for Toyota Corolla front door', 4, 85000, 22, '/assets/images/window-regulator.jpg', FALSE),
('TY010', 'Toyota Camry Oxygen Sensor', 'Lambda oxygen sensor for Toyota Camry exhaust system', 8, 125000, 18, '/assets/images/oxygen-sensor.jpg', FALSE),

-- NISSAN Additional Parts (3 more parts)
('NS008', 'Nissan X-Trail Roof Rails', 'Aluminum roof rails for Nissan X-Trail cargo system', 9, 165000, 15, '/assets/images/roof-rails.jpg', FALSE),
('NS009', 'Nissan Navara Fuel Tank', 'Steel fuel tank 80L for Nissan Navara pickup', 1, 385000, 6, '/assets/images/fuel-tank.jpg', FALSE),
('NS010', 'Nissan X-Trail Door Handle', 'Chrome exterior door handle for Nissan X-Trail', 9, 45000, 35, '/assets/images/door-handle.jpg', FALSE),

-- HONDA Additional Parts (3 more parts)
('HD008', 'Honda Civic Seat Cover', 'Leather seat cover set for Honda Civic interior', 10, 125000, 20, '/assets/images/seat-cover.jpg', FALSE),
('HD009', 'Honda CR-V Windshield', 'Laminated windshield glass for Honda CR-V', 9, 185000, 8, '/assets/images/windshield.jpg', FALSE),
('HD010', 'Honda Civic Ignition Coil', 'High performance ignition coil for Honda Civic 1.8L', 4, 65000, 28, '/assets/images/ignition-coil.jpg', TRUE),

-- MAZDA Additional Parts (3 more parts)
('MZ008', 'Mazda CX-5 Sunroof Motor', 'Electric sunroof motor for Mazda CX-5 panoramic roof', 4, 225000, 10, '/assets/images/sunroof-motor.jpg', FALSE),
('MZ009', 'Mazda Demio Dashboard', 'Complete dashboard assembly for Mazda Demio interior', 10, 385000, 5, '/assets/images/dashboard.jpg', FALSE),
('MZ010', 'Mazda CX-5 Parking Sensor', 'Ultrasonic parking sensor for Mazda CX-5 rear bumper', 4, 35000, 40, '/assets/images/parking-sensor.jpg', FALSE),

-- MITSUBISHI Additional Parts (3 more parts)
('MT008', 'Mitsubishi Pajero Winch', 'Electric winch 9000lbs for Mitsubishi Pajero off-road', 9, 485000, 4, '/assets/images/winch.jpg', TRUE),
('MT009', 'Mitsubishi L200 Tonneau Cover', 'Hard tonneau cover for Mitsubishi L200 pickup bed', 9, 225000, 8, '/assets/images/tonneau-cover.jpg', FALSE),
('MT010', 'Mitsubishi Pajero ABS Sensor', 'Front ABS wheel speed sensor for Mitsubishi Pajero', 2, 85000, 25, '/assets/images/abs-sensor.jpg', FALSE),

-- SUBARU Additional Parts (3 more parts)
('SB008', 'Subaru Forester Roof Box', 'Aerodynamic roof box 400L for Subaru Forester', 9, 325000, 6, '/assets/images/roof-box.jpg', FALSE),
('SB009', 'Subaru Impreza Intercooler Pipe', 'Aluminum intercooler pipe kit for Subaru Impreza WRX', 1, 145000, 12, '/assets/images/intercooler-pipe.jpg', FALSE),
('SB010', 'Subaru Forester Floor Mats', 'All-weather floor mats for Subaru Forester interior', 10, 65000, 30, '/assets/images/floor-mats.jpg', FALSE),

-- ISUZU Additional Parts (3 more parts)
('IZ008', 'Isuzu D-Max Snorkel', 'Safari snorkel kit for Isuzu D-Max air intake', 1, 285000, 8, '/assets/images/snorkel.jpg', TRUE),
('IZ009', 'Isuzu D-Max Tow Bar', 'Heavy duty tow bar 3500kg for Isuzu D-Max', 9, 195000, 12, '/assets/images/tow-bar.jpg', FALSE),
('IZ010', 'Isuzu D-Max Mud Flaps', 'Heavy duty mud flaps for Isuzu D-Max wheel wells', 9, 45000, 35, '/assets/images/mud-flaps.jpg', FALSE),

-- SUZUKI Additional Parts (3 more parts)
('SZ008', 'Suzuki Vitara Side Steps', 'Aluminum side steps for Suzuki Vitara SUV', 9, 165000, 14, '/assets/images/side-steps.jpg', FALSE),
('SZ009', 'Suzuki Swift Gear Knob', 'Leather gear knob for Suzuki Swift manual transmission', 10, 25000, 50, '/assets/images/gear-knob.jpg', FALSE),
('SZ010', 'Suzuki Vitara Spare Tire Cover', 'Canvas spare tire cover for Suzuki Vitara rear', 9, 55000, 25, '/assets/images/tire-cover.jpg', FALSE),

-- HYUNDAI Additional Parts (3 more parts)
('HY008', 'Hyundai Tucson Cargo Liner', 'Waterproof cargo liner for Hyundai Tucson trunk', 10, 85000, 22, '/assets/images/cargo-liner.jpg', FALSE),
('HY009', 'Hyundai Elantra Spoiler', 'ABS rear spoiler for Hyundai Elantra sedan', 9, 125000, 16, '/assets/images/spoiler.jpg', TRUE),
('HY010', 'Hyundai Tucson Wiper Blade', 'Hybrid wiper blade set for Hyundai Tucson windshield', 4, 35000, 45, '/assets/images/wiper-blade.jpg', FALSE),

-- VOLKSWAGEN Additional Parts (3 more parts)
('VW008', 'VW Golf Alloy Wheels', '17-inch alloy wheels set for VW Golf GTI', 9, 485000, 5, '/assets/images/alloy-wheels.jpg', TRUE),
('VW009', 'VW Polo Steering Wheel', 'Leather steering wheel for VW Polo interior', 10, 165000, 12, '/assets/images/steering-wheel.jpg', FALSE),
('VW010', 'VW Golf Brake Light', 'LED third brake light for VW Golf rear window', 4, 75000, 28, '/assets/images/brake-light.jpg', FALSE);

-- Additional product compatibility for the new 30 parts
INSERT INTO product_compatibility (product_id, car_model_id) VALUES
-- Toyota additional parts compatibility (parts 71-73)
(71, 1),                 -- Hilux bull bar - Hilux only
(72, 2),                 -- Corolla window regulator - Corolla only
(73, 3),                 -- Camry oxygen sensor - Camry only

-- Nissan additional parts compatibility (parts 74-76)
(74, 6),                 -- X-Trail roof rails - X-Trail only
(75, 7),                 -- Navara fuel tank - Navara only
(76, 6),                 -- X-Trail door handle - X-Trail only

-- Honda additional parts compatibility (parts 77-79)
(77, 10),                -- Civic seat cover - Civic only
(78, 11),                -- CR-V windshield - CR-V only
(79, 10),                -- Civic ignition coil - Civic only

-- Mazda additional parts compatibility (parts 80-82)
(80, 15),                -- CX-5 sunroof motor - CX-5 only
(81, 14),                -- Demio dashboard - Demio only
(82, 15),                -- CX-5 parking sensor - CX-5 only

-- Mitsubishi additional parts compatibility (parts 83-85)
(83, 18),                -- Pajero winch - Pajero only
(84, 19),                -- L200 tonneau cover - L200 only
(85, 18),                -- Pajero ABS sensor - Pajero only

-- Subaru additional parts compatibility (parts 86-88)
(86, 22),                -- Forester roof box - Forester only
(87, 23),                -- Impreza intercooler pipe - Impreza only
(88, 22),                -- Forester floor mats - Forester only

-- Isuzu additional parts compatibility (parts 89-91)
(89, 26),                -- D-Max snorkel - D-Max only
(90, 26),                -- D-Max tow bar - D-Max only
(91, 26),                -- D-Max mud flaps - D-Max only

-- Suzuki additional parts compatibility (parts 92-94)
(92, 30),                -- Vitara side steps - Vitara only
(93, 29),                -- Swift gear knob - Swift only
(94, 30),                -- Vitara spare tire cover - Vitara only

-- Hyundai additional parts compatibility (parts 95-97)
(95, 33),                -- Tucson cargo liner - Tucson only
(96, 34),                -- Elantra spoiler - Elantra only
(97, 33),                -- Tucson wiper blade - Tucson only

-- Volkswagen additional parts compatibility (parts 98-100)
(98, 37),                -- Golf alloy wheels - Golf only
(99, 38),                -- Polo steering wheel - Polo only
(100, 37);               -- Golf brake light - Golf only
