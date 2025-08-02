-- First, let's add more comprehensive categories
INSERT INTO categories (name, description) VALUES
('Performance Upgrades', 'High-performance parts for enhanced vehicle performance'),
('Maintenance & Service', 'Regular maintenance and service parts'),
('Tires & Wheels', 'Tires, rims, and wheel accessories'),
('Audio & Electronics', 'Car audio systems and electronic accessories'),
('Security & Safety', 'Security systems, alarms, and safety equipment'),
('Exterior Accessories', 'External styling and functional accessories'),
('Interior Accessories', 'Interior comfort and styling accessories'),
('Tools & Equipment', 'Automotive tools and diagnostic equipment'),
('Fluids & Chemicals', 'Engine oils, coolants, and automotive chemicals'),
('Gaskets & Seals', 'Engine and transmission gaskets and seals');

-- Now let's add many more parts across all categories and car brands
-- TOYOTA Additional Parts (20 more parts)
INSERT INTO products (part_number, name, description, category_id, price, stock_quantity, image_url, is_featured) VALUES
('TY011', 'Toyota Hilux Performance Exhaust System', 'Stainless steel performance exhaust for Toyota Hilux with improved flow', 11, 485000, 8, '/assets/images/performance-exhaust.jpg', TRUE),
('TY012', 'Toyota Corolla LED Headlight Kit', 'Full LED conversion kit for Toyota Corolla with DRL', 4, 225000, 15, '/assets/images/led-headlight.jpg', FALSE),
('TY013', 'Toyota Camry Brake Disc Set', 'Ventilated brake disc set front and rear for Toyota Camry', 2, 165000, 20, '/assets/images/brake-disc-set.jpg', FALSE),
('TY014', 'Toyota Hilux Snorkel Kit', 'Safari snorkel kit for Toyota Hilux deep water crossing', 1, 385000, 6, '/assets/images/snorkel-kit.jpg', TRUE),
('TY015', 'Toyota Corolla Floor Mats', 'Waterproof rubber floor mats for Toyota Corolla', 17, 45000, 35, '/assets/images/floor-mats.jpg', FALSE),
('TY016', 'Toyota Camry Timing Chain Kit', 'Complete timing chain kit for Toyota Camry 2.4L engine', 1, 285000, 12, '/assets/images/timing-chain-kit.jpg', FALSE),
('TY017', 'Toyota Hilux Alloy Wheels 17"', 'Set of 4 alloy wheels 17" for Toyota Hilux', 13, 685000, 4, '/assets/images/alloy-wheels-17.jpg', TRUE),
('TY018', 'Toyota Corolla Car Alarm System', 'Advanced car alarm system with remote start for Toyota Corolla', 15, 125000, 18, '/assets/images/car-alarm.jpg', FALSE),
('TY019', 'Toyota Camry Engine Oil 5W-30', 'Synthetic engine oil 5W-30 for Toyota Camry 4L', 19, 35000, 50, '/assets/images/engine-oil.jpg', FALSE),
('TY020', 'Toyota Hilux Differential Lock', 'Electronic differential lock system for Toyota Hilux 4WD', 11, 565000, 5, '/assets/images/diff-lock.jpg', FALSE),
('TY021', 'Toyota Corolla Spark Plug Set', 'Iridium spark plugs set for Toyota Corolla 1.8L', 1, 85000, 25, '/assets/images/spark-plugs.jpg', FALSE),
('TY022', 'Toyota Camry Suspension Kit', 'Complete suspension upgrade kit for Toyota Camry', 3, 485000, 8, '/assets/images/suspension-kit.jpg', TRUE),
('TY023', 'Toyota Hilux Tonneau Cover', 'Hard folding tonneau cover for Toyota Hilux pickup bed', 16, 285000, 10, '/assets/images/tonneau-cover.jpg', FALSE),
('TY024', 'Toyota Corolla Dashboard Camera', 'Full HD dashboard camera with night vision for Toyota Corolla', 14, 165000, 22, '/assets/images/dash-cam.jpg', FALSE),
('TY025', 'Toyota Camry Coolant Radiator', 'High-performance aluminum radiator for Toyota Camry', 7, 225000, 14, '/assets/images/radiator.jpg', FALSE),
('TY026', 'Toyota Hilux Rock Sliders', 'Heavy duty rock sliders for Toyota Hilux off-road protection', 16, 385000, 6, '/assets/images/rock-sliders.jpg', FALSE),
('TY027', 'Toyota Corolla Seat Covers', 'Premium leather seat covers for Toyota Corolla', 17, 125000, 20, '/assets/images/seat-covers.jpg', FALSE),
('TY028', 'Toyota Camry Turbocharger', 'Performance turbocharger upgrade for Toyota Camry 2.0L', 11, 685000, 3, '/assets/images/turbocharger.jpg', TRUE),
('TY029', 'Toyota Hilux Winch 12000lbs', 'Electric winch 12000lbs with synthetic rope for Toyota Hilux', 18, 485000, 5, '/assets/images/winch-12k.jpg', FALSE),
('TY030', 'Toyota Corolla Head Gasket Set', 'Complete head gasket set for Toyota Corolla engine rebuild', 20, 185000, 15, '/assets/images/head-gasket-set.jpg', FALSE),

-- NISSAN Additional Parts (20 more parts)
('NS011', 'Nissan X-Trail CVT Transmission Filter', 'CVT transmission filter and fluid for Nissan X-Trail', 6, 85000, 18, '/assets/images/cvt-filter.jpg', FALSE),
('NS012', 'Nissan Navara Performance Chip', 'ECU performance chip for Nissan Navara diesel engine', 11, 225000, 12, '/assets/images/performance-chip.jpg', TRUE),
('NS013', 'Nissan X-Trail Tire Set 225/60R17', 'Complete tire set for Nissan X-Trail all-season', 13, 385000, 8, '/assets/images/tire-set.jpg', FALSE),
('NS014', 'Nissan Navara Bull Bar', 'Heavy duty steel bull bar for Nissan Navara front protection', 16, 485000, 6, '/assets/images/bull-bar.jpg', TRUE),
('NS015', 'Nissan X-Trail Audio System', 'Premium audio system with touchscreen for Nissan X-Trail', 14, 325000, 10, '/assets/images/audio-system.jpg', FALSE),
('NS016', 'Nissan Navara Clutch Kit', 'Heavy duty clutch kit for Nissan Navara manual transmission', 6, 285000, 14, '/assets/images/clutch-kit.jpg', FALSE),
('NS017', 'Nissan X-Trail Roof Rack', 'Aluminum roof rack system for Nissan X-Trail', 16, 185000, 16, '/assets/images/roof-rack.jpg', FALSE),
('NS018', 'Nissan Navara Engine Mount Set', 'Complete engine mount set for Nissan Navara', 1, 125000, 20, '/assets/images/engine-mounts.jpg', FALSE),
('NS019', 'Nissan X-Trail Brake Fluid DOT4', 'High-performance brake fluid DOT4 for Nissan X-Trail', 19, 25000, 40, '/assets/images/brake-fluid.jpg', FALSE),
('NS020', 'Nissan Navara Lift Kit 2"', '2-inch suspension lift kit for Nissan Navara', 11, 565000, 5, '/assets/images/lift-kit.jpg', TRUE),
('NS021', 'Nissan X-Trail Window Tinting', 'Professional window tinting kit for Nissan X-Trail', 16, 85000, 25, '/assets/images/window-tint.jpg', FALSE),
('NS022', 'Nissan Navara Fuel Injector Set', 'Complete fuel injector set for Nissan Navara diesel', 1, 385000, 8, '/assets/images/fuel-injectors.jpg', FALSE),
('NS023', 'Nissan X-Trail Side Steps', 'Aluminum side steps for Nissan X-Trail', 16, 165000, 18, '/assets/images/side-steps.jpg', FALSE),
('NS024', 'Nissan Navara GPS Navigation', 'Advanced GPS navigation system for Nissan Navara', 14, 225000, 12, '/assets/images/gps-nav.jpg', FALSE),
('NS025', 'Nissan X-Trail Power Steering Fluid', 'Power steering fluid for Nissan X-Trail hydraulic system', 19, 35000, 35, '/assets/images/ps-fluid.jpg', FALSE),
('NS026', 'Nissan Navara Mud Tires 265/70R16', 'Aggressive mud tires for Nissan Navara off-road', 13, 485000, 6, '/assets/images/mud-tires.jpg', FALSE),
('NS027', 'Nissan X-Trail Cabin Air Filter', 'HEPA cabin air filter for Nissan X-Trail air conditioning', 5, 45000, 30, '/assets/images/cabin-filter.jpg', FALSE),
('NS028', 'Nissan Navara Exhaust Manifold', 'Stainless steel exhaust manifold for Nissan Navara', 8, 285000, 10, '/assets/images/exhaust-manifold.jpg', FALSE),
('NS029', 'Nissan X-Trail Parking Sensors', 'Front and rear parking sensor kit for Nissan X-Trail', 15, 125000, 22, '/assets/images/parking-sensors.jpg', FALSE),
('NS030', 'Nissan Navara Valve Cover Gasket', 'Valve cover gasket set for Nissan Navara engine', 20, 65000, 28, '/assets/images/valve-cover-gasket.jpg', FALSE),

-- HONDA Additional Parts (20 more parts)
('HD011', 'Honda Civic Type R Spoiler', 'Aerodynamic rear spoiler for Honda Civic Type R style', 16, 185000, 12, '/assets/images/civic-spoiler.jpg', TRUE),
('HD012', 'Honda CR-V All-Terrain Tires', 'All-terrain tire set 225/65R17 for Honda CR-V', 13, 425000, 8, '/assets/images/at-tires.jpg', FALSE),
('HD013', 'Honda Civic Cold Air Intake', 'High-flow cold air intake system for Honda Civic', 11, 165000, 15, '/assets/images/cold-air-intake.jpg', FALSE),
('HD014', 'Honda CR-V Roof Box', 'Aerodynamic roof box 450L for Honda CR-V', 16, 285000, 10, '/assets/images/roof-box.jpg', FALSE),
('HD015', 'Honda Civic Racing Seats', 'Bucket racing seats for Honda Civic performance', 17, 485000, 6, '/assets/images/racing-seats.jpg', TRUE),
('HD016', 'Honda CR-V Transmission Cooler', 'External transmission cooler for Honda CR-V CVT', 7, 125000, 18, '/assets/images/trans-cooler.jpg', FALSE),
('HD017', 'Honda Civic Coilover Kit', 'Adjustable coilover suspension kit for Honda Civic', 11, 685000, 4, '/assets/images/coilover-kit.jpg', TRUE),
('HD018', 'Honda CR-V Backup Camera', 'Wireless backup camera system for Honda CR-V', 14, 145000, 20, '/assets/images/backup-camera.jpg', FALSE),
('HD019', 'Honda Civic Engine Oil Filter', 'High-performance oil filter for Honda Civic VTEC', 5, 25000, 45, '/assets/images/oil-filter.jpg', FALSE),
('HD020', 'Honda CR-V Tow Hitch', 'Class III tow hitch for Honda CR-V 3500lbs capacity', 16, 185000, 14, '/assets/images/tow-hitch.jpg', FALSE),
('HD021', 'Honda Civic Short Shifter', 'Short throw shifter kit for Honda Civic manual', 11, 125000, 16, '/assets/images/short-shifter.jpg', FALSE),
('HD022', 'Honda CR-V Floor Liners', 'All-weather floor liners for Honda CR-V', 17, 85000, 25, '/assets/images/floor-liners.jpg', FALSE),
('HD023', 'Honda Civic Turbo Kit', 'Complete turbo kit for Honda Civic naturally aspirated', 11, 985000, 2, '/assets/images/turbo-kit.jpg', TRUE),
('HD024', 'Honda CR-V Security System', 'Advanced security system with smartphone app for Honda CR-V', 15, 185000, 12, '/assets/images/security-system.jpg', FALSE),
('HD025', 'Honda Civic Brake Upgrade Kit', 'Big brake upgrade kit for Honda Civic performance', 2, 485000, 6, '/assets/images/brake-upgrade.jpg', FALSE),
('HD026', 'Honda CR-V Wheel Spacers', 'Wheel spacers 25mm for Honda CR-V wider stance', 13, 65000, 30, '/assets/images/wheel-spacers.jpg', FALSE),
('HD027', 'Honda Civic Carbon Fiber Hood', 'Lightweight carbon fiber hood for Honda Civic', 16, 385000, 8, '/assets/images/carbon-hood.jpg', TRUE),
('HD028', 'Honda CR-V Diagnostic Tool', 'OBD2 diagnostic scanner for Honda CR-V', 18, 125000, 18, '/assets/images/diagnostic-tool.jpg', FALSE),
('HD029', 'Honda Civic Lowering Springs', 'Progressive lowering springs for Honda Civic', 3, 185000, 14, '/assets/images/lowering-springs.jpg', FALSE),
('HD030', 'Honda CR-V Timing Belt Kit', 'Complete timing belt kit for Honda CR-V 2.4L', 1, 225000, 12, '/assets/images/timing-belt-kit.jpg', FALSE);

-- Add compatibility for all new parts
INSERT INTO product_compatibility (product_id, car_model_id) VALUES
-- Toyota parts (101-130)
(101, 1), (102, 2), (103, 3), (104, 1), (105, 2), (106, 3), (107, 1), (108, 2), (109, 3), (110, 1),
(111, 2), (112, 3), (113, 1), (114, 2), (115, 3), (116, 1), (117, 2), (118, 3), (119, 1), (120, 2),

-- Nissan parts (131-150)
(131, 6), (132, 7), (133, 6), (134, 7), (135, 6), (136, 7), (137, 6), (138, 7), (139, 6), (140, 7),
(141, 6), (142, 7), (143, 6), (144, 7), (145, 6), (146, 7), (147, 6), (148, 7), (149, 6), (150, 7),

-- Honda parts (151-170)
(151, 10), (152, 11), (153, 10), (154, 11), (155, 10), (156, 11), (157, 10), (158, 11), (159, 10), (160, 11),
(161, 10), (162, 11), (163, 10), (164, 11), (165, 10), (166, 11), (167, 10), (168, 11), (169, 10), (170, 11);

-- Add more parts for other brands (Mazda, Mitsubishi, Subaru, Isuzu, Suzuki, Hyundai, Volkswagen)
-- MAZDA Additional Parts (15 more parts)
INSERT INTO products (part_number, name, description, category_id, price, stock_quantity, image_url, is_featured) VALUES
('MZ011', 'Mazda CX-5 Skyactiv Turbo Kit', 'Turbo upgrade kit for Mazda CX-5 Skyactiv engine', 11, 785000, 3, '/assets/images/skyactiv-turbo.jpg', TRUE),
('MZ012', 'Mazda Demio Sport Exhaust', 'Sport exhaust system for Mazda Demio with deep sound', 8, 185000, 12, '/assets/images/sport-exhaust.jpg', FALSE),
('MZ013', 'Mazda CX-5 LED Light Bar', '32" LED light bar for Mazda CX-5 off-road', 4, 225000, 10, '/assets/images/led-light-bar.jpg', FALSE),
('MZ014', 'Mazda Demio Racing Stripes', 'Professional racing stripes kit for Mazda Demio', 16, 45000, 25, '/assets/images/racing-stripes.jpg', FALSE),
('MZ015', 'Mazda CX-5 Roof Tent', 'Hard shell roof tent for Mazda CX-5 camping', 16, 485000, 4, '/assets/images/roof-tent.jpg', TRUE),
('MZ016', 'Mazda Demio Turbo Timer', 'Digital turbo timer for Mazda Demio turbo models', 14, 85000, 18, '/assets/images/turbo-timer.jpg', FALSE),
('MZ017', 'Mazda CX-5 Skid Plates', 'Aluminum skid plates for Mazda CX-5 underbody protection', 16, 165000, 14, '/assets/images/skid-plates.jpg', FALSE),
('MZ018', 'Mazda Demio Performance ECU', 'Performance ECU tune for Mazda Demio 1.5L', 11, 285000, 8, '/assets/images/performance-ecu.jpg', FALSE),
('MZ019', 'Mazda CX-5 Cargo Organizer', 'Modular cargo organizer for Mazda CX-5 trunk', 17, 65000, 22, '/assets/images/cargo-organizer.jpg', FALSE),
('MZ020', 'Mazda Demio Lowering Kit', 'Complete lowering kit for Mazda Demio sport look', 3, 225000, 10, '/assets/images/lowering-kit.jpg', FALSE),
('MZ021', 'Mazda CX-5 Diesel Tuning Box', 'Diesel tuning box for Mazda CX-5 2.2L diesel', 11, 185000, 12, '/assets/images/diesel-tuning.jpg', FALSE),
('MZ022', 'Mazda Demio Body Kit', 'Complete body kit for Mazda Demio sport styling', 16, 385000, 6, '/assets/images/body-kit.jpg', TRUE),
('MZ023', 'Mazda CX-5 Transmission Mount', 'Heavy duty transmission mount for Mazda CX-5', 1, 85000, 20, '/assets/images/trans-mount.jpg', FALSE),
('MZ024', 'Mazda Demio Gauge Cluster', 'Digital gauge cluster upgrade for Mazda Demio', 14, 225000, 8, '/assets/images/gauge-cluster.jpg', FALSE),
('MZ025', 'Mazda CX-5 Coolant Hoses', 'Silicone coolant hose kit for Mazda CX-5', 7, 125000, 16, '/assets/images/coolant-hoses.jpg', FALSE);

-- Continue with other brands...
-- MITSUBISHI Additional Parts (15 more parts)
INSERT INTO products (part_number, name, description, category_id, price, stock_quantity, image_url, is_featured) VALUES
('MT011', 'Mitsubishi Pajero Snorkel', 'Safari snorkel for Mitsubishi Pajero deep water crossing', 1, 385000, 6, '/assets/images/pajero-snorkel.jpg', TRUE),
('MT012', 'Mitsubishi L200 Sports Bar', 'Stainless steel sports bar for Mitsubishi L200', 16, 285000, 8, '/assets/images/sports-bar.jpg', FALSE),
('MT013', 'Mitsubishi Pajero Diff Lock', 'Electronic differential lock for Mitsubishi Pajero', 11, 485000, 4, '/assets/images/pajero-diff-lock.jpg', FALSE),
('MT014', 'Mitsubishi L200 Canopy', 'Aluminum canopy for Mitsubishi L200 pickup', 16, 685000, 3, '/assets/images/pickup-canopy.jpg', TRUE),
('MT015', 'Mitsubishi Pajero Winch Bumper', 'Heavy duty winch bumper for Mitsubishi Pajero', 16, 565000, 5, '/assets/images/winch-bumper.jpg', FALSE),
('MT016', 'Mitsubishi L200 Suspension Lift', '2" suspension lift kit for Mitsubishi L200', 3, 485000, 6, '/assets/images/suspension-lift.jpg', FALSE),
('MT017', 'Mitsubishi Pajero Rock Lights', 'LED rock lights kit for Mitsubishi Pajero off-road', 4, 125000, 15, '/assets/images/rock-lights.jpg', FALSE),
('MT018', 'Mitsubishi L200 Bed Liner', 'Spray-on bed liner for Mitsubishi L200', 16, 185000, 10, '/assets/images/bed-liner.jpg', FALSE),
('MT019', 'Mitsubishi Pajero Air Compressor', 'Portable air compressor for Mitsubishi Pajero', 18, 225000, 12, '/assets/images/air-compressor.jpg', FALSE),
('MT020', 'Mitsubishi L200 Tail Gate Assist', 'Hydraulic tail gate assist for Mitsubishi L200', 16, 85000, 18, '/assets/images/tailgate-assist.jpg', FALSE),
('MT021', 'Mitsubishi Pajero Recovery Tracks', 'Sand recovery tracks for Mitsubishi Pajero', 18, 165000, 14, '/assets/images/recovery-tracks.jpg', FALSE),
('MT022', 'Mitsubishi L200 Headlight Guards', 'Polycarbonate headlight guards for Mitsubishi L200', 16, 65000, 25, '/assets/images/headlight-guards.jpg', FALSE),
('MT023', 'Mitsubishi Pajero Dual Battery Kit', 'Dual battery system for Mitsubishi Pajero', 4, 385000, 8, '/assets/images/dual-battery.jpg', FALSE),
('MT024', 'Mitsubishi L200 Nudge Bar', 'Aluminum nudge bar for Mitsubishi L200', 16, 225000, 10, '/assets/images/nudge-bar.jpg', FALSE),
('MT025', 'Mitsubishi Pajero Roof Console', 'Overhead console with switches for Mitsubishi Pajero', 17, 185000, 12, '/assets/images/roof-console.jpg', FALSE);

-- Add compatibility for new Mazda and Mitsubishi parts
INSERT INTO product_compatibility (product_id, car_model_id) VALUES
-- Mazda parts (171-185)
(171, 15), (172, 14), (173, 15), (174, 14), (175, 15), (176, 14), (177, 15), (178, 14), (179, 15), (180, 14),
(181, 15), (182, 14), (183, 15), (184, 14), (185, 15),

-- Mitsubishi parts (186-200)
(186, 18), (187, 19), (188, 18), (189, 19), (190, 18), (191, 19), (192, 18), (193, 19), (194, 18), (195, 19),
(196, 18), (197, 19), (198, 18), (199, 19), (200, 18);
