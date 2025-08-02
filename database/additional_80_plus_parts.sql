-- Add more comprehensive parts to reach 80+ available parts
-- This will add parts for remaining brands and fill gaps in categories

-- SUBARU Additional Parts (15 more parts) - SB011-SB025
INSERT INTO products (part_number, name, description, category_id, price, stock_quantity, image_url, is_featured) VALUES
('SB011', 'Subaru Forester All-Weather Tires', 'All-season tire set 225/60R17 for Subaru Forester', 13, 485000, 8, '/assets/images/all-weather-tires.jpg', FALSE),
('SB012', 'Subaru Impreza WRX Cold Air Intake', 'High-flow cold air intake for Subaru Impreza WRX', 11, 225000, 12, '/assets/images/wrx-intake.jpg', TRUE),
('SB013', 'Subaru Forester Roof Basket', 'Steel roof basket for Subaru Forester cargo', 16, 185000, 15, '/assets/images/roof-basket.jpg', FALSE),
('SB014', 'Subaru Impreza Performance Exhaust', 'Cat-back exhaust system for Subaru Impreza', 8, 385000, 6, '/assets/images/performance-exhaust.jpg', FALSE),
('SB015', 'Subaru Forester Mud Flaps', 'OEM mud flaps for Subaru Forester', 16, 65000, 30, '/assets/images/mud-flaps.jpg', FALSE),
('SB016', 'Subaru Impreza Short Shifter', 'Short throw shifter for Subaru Impreza manual', 6, 145000, 18, '/assets/images/short-shifter.jpg', FALSE),
('SB017', 'Subaru Forester Cargo Mat', 'Waterproof cargo mat for Subaru Forester', 17, 85000, 25, '/assets/images/cargo-mat.jpg', FALSE),
('SB018', 'Subaru Impreza Boost Controller', 'Electronic boost controller for Subaru Impreza turbo', 11, 185000, 14, '/assets/images/boost-controller.jpg', FALSE),
('SB019', 'Subaru Forester Hitch Receiver', 'Class II hitch receiver for Subaru Forester', 16, 165000, 16, '/assets/images/hitch-receiver.jpg', FALSE),
('SB020', 'Subaru Impreza Lowering Springs', 'Sport lowering springs for Subaru Impreza', 3, 225000, 12, '/assets/images/lowering-springs.jpg', FALSE),
('SB021', 'Subaru Forester Engine Air Filter', 'High-flow engine air filter for Subaru Forester', 5, 45000, 35, '/assets/images/engine-air-filter.jpg', FALSE),
('SB022', 'Subaru Impreza Brake Rotors', 'Slotted brake rotors for Subaru Impreza front', 2, 185000, 20, '/assets/images/brake-rotors.jpg', FALSE),
('SB023', 'Subaru Forester Transmission Fluid', 'CVT transmission fluid for Subaru Forester', 19, 65000, 28, '/assets/images/cvt-fluid.jpg', FALSE),
('SB024', 'Subaru Impreza Turbo Timer', 'Digital turbo timer for Subaru Impreza WRX', 14, 125000, 22, '/assets/images/turbo-timer.jpg', FALSE),
('SB025', 'Subaru Forester Wheel Bearings', 'Front wheel bearing set for Subaru Forester', 3, 125000, 18, '/assets/images/wheel-bearings.jpg', FALSE),

-- ISUZU Additional Parts (15 more parts) - IZ011-IZ025
('IZ011', 'Isuzu D-Max Canopy', 'Aluminum canopy for Isuzu D-Max pickup bed', 16, 685000, 4, '/assets/images/dmax-canopy.jpg', TRUE),
('IZ012', 'Isuzu D-Max Performance Chip', 'ECU performance chip for Isuzu D-Max 3.0L', 11, 285000, 10, '/assets/images/dmax-chip.jpg', FALSE),
('IZ013', 'Isuzu D-Max All-Terrain Tires', 'All-terrain tire set 255/70R16 for Isuzu D-Max', 13, 525000, 6, '/assets/images/at-tires-dmax.jpg', FALSE),
('IZ014', 'Isuzu D-Max Sports Bar', 'Stainless steel sports bar for Isuzu D-Max', 16, 285000, 8, '/assets/images/dmax-sports-bar.jpg', FALSE),
('IZ015', 'Isuzu D-Max Diff Lock', 'Electronic differential lock for Isuzu D-Max', 11, 485000, 5, '/assets/images/dmax-diff-lock.jpg', FALSE),
('IZ016', 'Isuzu D-Max Suspension Lift', '2-inch suspension lift kit for Isuzu D-Max', 3, 565000, 4, '/assets/images/dmax-lift-kit.jpg', FALSE),
('IZ017', 'Isuzu D-Max Bed Liner', 'Drop-in bed liner for Isuzu D-Max', 16, 185000, 12, '/assets/images/dmax-bed-liner.jpg', FALSE),
('IZ018', 'Isuzu D-Max Fog Lights', 'LED fog light kit for Isuzu D-Max', 4, 125000, 20, '/assets/images/dmax-fog-lights.jpg', FALSE),
('IZ019', 'Isuzu D-Max Tailgate Damper', 'Hydraulic tailgate damper for Isuzu D-Max', 16, 85000, 25, '/assets/images/tailgate-damper.jpg', FALSE),
('IZ020', 'Isuzu D-Max Engine Oil Filter', 'Heavy-duty oil filter for Isuzu D-Max diesel', 5, 35000, 40, '/assets/images/dmax-oil-filter.jpg', FALSE),
('IZ021', 'Isuzu D-Max Clutch Kit', 'Heavy-duty clutch kit for Isuzu D-Max manual', 6, 385000, 8, '/assets/images/dmax-clutch.jpg', FALSE),
('IZ022', 'Isuzu D-Max Side Steps', 'Aluminum side steps for Isuzu D-Max', 16, 225000, 14, '/assets/images/dmax-side-steps.jpg', FALSE),
('IZ023', 'Isuzu D-Max Air Filter', 'High-flow air filter for Isuzu D-Max', 5, 55000, 30, '/assets/images/dmax-air-filter.jpg', FALSE),
('IZ024', 'Isuzu D-Max Brake Pads', 'Ceramic brake pads for Isuzu D-Max front', 2, 85000, 22, '/assets/images/dmax-brake-pads.jpg', FALSE),
('IZ025', 'Isuzu D-Max Coolant Hoses', 'Silicone coolant hose kit for Isuzu D-Max', 7, 145000, 16, '/assets/images/dmax-coolant-hoses.jpg', FALSE),

-- SUZUKI Additional Parts (15 more parts) - SZ011-SZ025
('SZ011', 'Suzuki Vitara Roof Rails', 'Aluminum roof rails for Suzuki Vitara', 16, 165000, 14, '/assets/images/vitara-roof-rails.jpg', FALSE),
('SZ012', 'Suzuki Swift Sport Exhaust', 'Sport exhaust system for Suzuki Swift', 8, 225000, 10, '/assets/images/swift-sport-exhaust.jpg', TRUE),
('SZ013', 'Suzuki Vitara All-Season Tires', 'All-season tire set 215/60R16 for Suzuki Vitara', 13, 385000, 8, '/assets/images/vitara-tires.jpg', FALSE),
('SZ014', 'Suzuki Swift Cold Air Intake', 'Cold air intake system for Suzuki Swift', 11, 145000, 16, '/assets/images/swift-intake.jpg', FALSE),
('SZ015', 'Suzuki Vitara Mud Guards', 'OEM mud guards for Suzuki Vitara', 16, 55000, 28, '/assets/images/vitara-mud-guards.jpg', FALSE),
('SZ016', 'Suzuki Swift Lowering Kit', 'Lowering spring kit for Suzuki Swift', 3, 185000, 12, '/assets/images/swift-lowering.jpg', FALSE),
('SZ017', 'Suzuki Vitara Cargo Organizer', 'Modular cargo organizer for Suzuki Vitara', 17, 75000, 24, '/assets/images/vitara-cargo.jpg', FALSE),
('SZ018', 'Suzuki Swift Performance ECU', 'Performance ECU tune for Suzuki Swift', 11, 225000, 8, '/assets/images/swift-ecu.jpg', FALSE),
('SZ019', 'Suzuki Vitara Tow Bar', 'Detachable tow bar for Suzuki Vitara', 16, 185000, 12, '/assets/images/vitara-tow-bar.jpg', FALSE),
('SZ020', 'Suzuki Swift Brake Upgrade', 'Big brake kit for Suzuki Swift Sport', 2, 385000, 6, '/assets/images/swift-brake-upgrade.jpg', FALSE),
('SZ021', 'Suzuki Vitara Engine Oil', 'Synthetic engine oil 5W-30 for Suzuki Vitara', 19, 45000, 35, '/assets/images/vitara-oil.jpg', FALSE),
('SZ022', 'Suzuki Swift Coilover Kit', 'Adjustable coilover kit for Suzuki Swift', 3, 485000, 4, '/assets/images/swift-coilovers.jpg', TRUE),
('SZ023', 'Suzuki Vitara Cabin Filter', 'HEPA cabin air filter for Suzuki Vitara', 5, 35000, 32, '/assets/images/vitara-cabin-filter.jpg', FALSE),
('SZ024', 'Suzuki Swift Turbo Kit', 'Turbo conversion kit for Suzuki Swift', 11, 785000, 2, '/assets/images/swift-turbo.jpg', TRUE),
('SZ025', 'Suzuki Vitara Shock Absorbers', 'Gas shock absorbers for Suzuki Vitara', 3, 165000, 18, '/assets/images/vitara-shocks.jpg', FALSE),

-- HYUNDAI Additional Parts (15 more parts) - HY011-HY025
('HY011', 'Hyundai Tucson Roof Box', 'Aerodynamic roof box 400L for Hyundai Tucson', 16, 285000, 8, '/assets/images/tucson-roof-box.jpg', FALSE),
('HY012', 'Hyundai Elantra Sport Kit', 'Sport styling kit for Hyundai Elantra', 16, 225000, 10, '/assets/images/elantra-sport-kit.jpg', TRUE),
('HY013', 'Hyundai Tucson All-Season Tires', 'All-season tire set 225/60R17 for Hyundai Tucson', 13, 425000, 6, '/assets/images/tucson-tires.jpg', FALSE),
('HY014', 'Hyundai Elantra Cold Air Intake', 'Performance air intake for Hyundai Elantra', 11, 165000, 14, '/assets/images/elantra-intake.jpg', FALSE),
('HY015', 'Hyundai Tucson Trailer Hitch', 'Class III trailer hitch for Hyundai Tucson', 16, 185000, 12, '/assets/images/tucson-hitch.jpg', FALSE),
('HY016', 'Hyundai Elantra Lowering Springs', 'Sport lowering springs for Hyundai Elantra', 3, 185000, 16, '/assets/images/elantra-springs.jpg', FALSE),
('HY017', 'Hyundai Tucson Floor Mats', 'All-weather floor mats for Hyundai Tucson', 17, 65000, 26, '/assets/images/tucson-floor-mats.jpg', FALSE),
('HY018', 'Hyundai Elantra Exhaust System', 'Cat-back exhaust for Hyundai Elantra', 8, 285000, 8, '/assets/images/elantra-exhaust.jpg', FALSE),
('HY019', 'Hyundai Tucson Running Boards', 'Power running boards for Hyundai Tucson', 16, 385000, 6, '/assets/images/tucson-running-boards.jpg', FALSE),
('HY020', 'Hyundai Elantra Turbo Upgrade', 'Turbo upgrade kit for Hyundai Elantra', 11, 485000, 4, '/assets/images/elantra-turbo.jpg', TRUE),
('HY021', 'Hyundai Tucson Engine Oil', 'Full synthetic oil 5W-20 for Hyundai Tucson', 19, 55000, 30, '/assets/images/tucson-oil.jpg', FALSE),
('HY022', 'Hyundai Elantra Brake Kit', 'Performance brake kit for Hyundai Elantra', 2, 325000, 8, '/assets/images/elantra-brakes.jpg', FALSE),
('HY023', 'Hyundai Tucson Transmission Filter', 'Automatic transmission filter for Hyundai Tucson', 6, 75000, 20, '/assets/images/tucson-trans-filter.jpg', FALSE),
('HY024', 'Hyundai Elantra Coilover Kit', 'Adjustable coilover suspension for Hyundai Elantra', 3, 425000, 6, '/assets/images/elantra-coilovers.jpg', FALSE),
('HY025', 'Hyundai Tucson Fuel Filter', 'High-flow fuel filter for Hyundai Tucson', 5, 45000, 28, '/assets/images/tucson-fuel-filter.jpg', FALSE),

-- VOLKSWAGEN Additional Parts (15 more parts) - VW011-VW025
('VW011', 'VW Golf GTI Turbo Upgrade', 'K04 turbo upgrade for VW Golf GTI', 11, 685000, 3, '/assets/images/golf-turbo-upgrade.jpg', TRUE),
('VW012', 'VW Polo Sport Suspension', 'Sport suspension kit for VW Polo', 3, 285000, 8, '/assets/images/polo-suspension.jpg', FALSE),
('VW013', 'VW Golf All-Season Tires', 'All-season tire set 225/45R17 for VW Golf', 13, 485000, 6, '/assets/images/golf-tires.jpg', FALSE),
('VW014', 'VW Polo Cold Air Intake', 'Performance intake for VW Polo TSI', 11, 185000, 12, '/assets/images/polo-intake.jpg', FALSE),
('VW015', 'VW Golf Roof Rack', 'Thule roof rack system for VW Golf', 16, 225000, 10, '/assets/images/golf-roof-rack.jpg', FALSE),
('VW016', 'VW Polo Exhaust System', 'Sport exhaust system for VW Polo GTI', 8, 325000, 6, '/assets/images/polo-exhaust.jpg', FALSE),
('VW017', 'VW Golf Floor Mats', 'Premium floor mats for VW Golf', 17, 85000, 22, '/assets/images/golf-floor-mats.jpg', FALSE),
('VW018', 'VW Polo Performance Chip', 'ECU performance chip for VW Polo', 11, 225000, 10, '/assets/images/polo-chip.jpg', FALSE),
('VW019', 'VW Golf Brake Upgrade', 'Big brake kit for VW Golf R', 2, 485000, 4, '/assets/images/golf-brake-upgrade.jpg', TRUE),
('VW020', 'VW Polo Lowering Kit', 'Lowering spring kit for VW Polo', 3, 185000, 14, '/assets/images/polo-lowering.jpg', FALSE),
('VW021', 'VW Golf Engine Oil', 'VW approved engine oil 5W-30 for Golf', 19, 65000, 25, '/assets/images/golf-oil.jpg', FALSE),
('VW022', 'VW Polo Coilover Kit', 'Adjustable coilover kit for VW Polo', 3, 385000, 6, '/assets/images/polo-coilovers.jpg', FALSE),
('VW023', 'VW Golf Intercooler', 'Front mount intercooler for VW Golf GTI', 7, 385000, 8, '/assets/images/golf-intercooler.jpg', FALSE),
('VW024', 'VW Polo Clutch Kit', 'Performance clutch kit for VW Polo', 6, 285000, 10, '/assets/images/polo-clutch.jpg', FALSE),
('VW025', 'VW Golf Carbon Intake', 'Carbon fiber intake for VW Golf R', 11, 485000, 4, '/assets/images/golf-carbon-intake.jpg', TRUE),

-- UNIVERSAL PARTS (10 more parts) - UN001-UN010
('UN001', 'Universal OBD2 Scanner', 'Professional OBD2 diagnostic scanner', 18, 125000, 25, '/assets/images/obd2-scanner.jpg', TRUE),
('UN002', 'Universal Car Cover', 'Waterproof car cover for medium sedans', 16, 85000, 20, '/assets/images/car-cover.jpg', FALSE),
('UN003', 'Universal Phone Mount', 'Magnetic phone mount for dashboard', 17, 25000, 50, '/assets/images/phone-mount.jpg', FALSE),
('UN004', 'Universal Jump Starter', 'Portable jump starter with USB ports', 18, 165000, 15, '/assets/images/jump-starter.jpg', FALSE),
('UN005', 'Universal Tire Pressure Gauge', 'Digital tire pressure gauge', 18, 35000, 40, '/assets/images/pressure-gauge.jpg', FALSE),
('UN006', 'Universal Car Vacuum', 'Portable car vacuum cleaner 12V', 18, 85000, 18, '/assets/images/car-vacuum.jpg', FALSE),
('UN007', 'Universal Seat Organizer', 'Back seat organizer with tablet holder', 17, 45000, 30, '/assets/images/seat-organizer.jpg', FALSE),
('UN008', 'Universal Dash Cam', 'Full HD dash camera with night vision', 14, 145000, 22, '/assets/images/universal-dash-cam.jpg', TRUE),
('UN009', 'Universal Car Charger', 'Fast charging car charger with dual USB', 14, 25000, 45, '/assets/images/car-charger.jpg', FALSE),
('UN010', 'Universal Emergency Kit', 'Complete roadside emergency kit', 18, 125000, 16, '/assets/images/emergency-kit.jpg', FALSE);

-- Add compatibility for all new parts
INSERT INTO product_compatibility (product_id, car_model_id) VALUES
-- Subaru parts (191-205) - SB011-SB025
(191, 22), (191, 24), -- Forester tires work on Outback too
(192, 23), -- Impreza WRX intake
(193, 22), (193, 24), -- Forester roof basket works on Outback
(194, 23), -- Impreza exhaust
(195, 22), (195, 24), -- Forester mud flaps work on Outback
(196, 23), -- Impreza shifter
(197, 22), (197, 24), -- Forester cargo mat works on Outback
(198, 23), -- Impreza boost controller
(199, 22), (199, 24), -- Forester hitch works on Outback
(200, 23), -- Impreza springs
(201, 22), (201, 23), (201, 24), (201, 25), -- Air filter works on all Subaru
(202, 23), -- Impreza rotors
(203, 22), (203, 24), -- Forester CVT fluid works on Outback
(204, 23), -- Impreza turbo timer
(205, 22), (205, 23), (205, 24), (205, 25), -- Wheel bearings work on all Subaru

-- Isuzu parts (206-220) - IZ011-IZ025
(206, 26), (206, 27), -- D-Max canopy works on MU-X
(207, 26), (207, 27), -- Performance chip works on both
(208, 26), (208, 27), -- Tires work on both
(209, 26), -- D-Max sports bar
(210, 26), (210, 27), -- Diff lock works on both
(211, 26), (211, 27), -- Lift kit works on both
(212, 26), -- D-Max bed liner
(213, 26), (213, 27), -- Fog lights work on both
(214, 26), -- D-Max tailgate damper
(215, 26), (215, 27), -- Oil filter works on both
(216, 26), -- D-Max clutch
(217, 26), (217, 27), -- Side steps work on both
(218, 26), (218, 27), -- Air filter works on both
(219, 26), (219, 27), -- Brake pads work on both
(220, 26), (220, 27), -- Coolant hoses work on both

-- Suzuki parts (221-235) - SZ011-SZ025
(221, 30), -- Vitara roof rails
(222, 29), -- Swift sport exhaust
(223, 30), -- Vitara tires
(224, 29), -- Swift intake
(225, 30), -- Vitara mud guards
(226, 29), -- Swift lowering
(227, 30), -- Vitara cargo
(228, 29), -- Swift ECU
(229, 30), -- Vitara tow bar
(230, 29), -- Swift brake upgrade
(231, 30), (231, 29), (231, 31), (231, 32), -- Oil works on all Suzuki
(232, 29), -- Swift coilovers
(233, 30), (233, 31), (233, 32), -- Cabin filter works on multiple Suzuki
(234, 29), -- Swift turbo
(235, 30), -- Vitara shocks

-- Hyundai parts (236-250) - HY011-HY025
(236, 33), (236, 35), -- Tucson roof box works on Santa Fe
(237, 34), -- Elantra sport kit
(238, 33), (238, 35), -- Tucson tires work on Santa Fe
(239, 34), -- Elantra intake
(240, 33), (240, 35), -- Tucson hitch works on Santa Fe
(241, 34), -- Elantra springs
(242, 33), (242, 35), -- Tucson floor mats work on Santa Fe
(243, 34), -- Elantra exhaust
(244, 33), (244, 35), -- Tucson running boards work on Santa Fe
(245, 34), -- Elantra turbo
(246, 33), (246, 34), (246, 35), (246, 36), -- Oil works on all Hyundai
(247, 34), -- Elantra brakes
(248, 33), (248, 35), -- Tucson trans filter works on Santa Fe
(249, 34), -- Elantra coilovers
(250, 33), (250, 35), -- Tucson fuel filter works on Santa Fe

-- Volkswagen parts (251-265) - VW011-VW025
(251, 37), -- Golf turbo upgrade
(252, 38), -- Polo suspension
(253, 37), (253, 39), -- Golf tires work on Tiguan
(254, 38), -- Polo intake
(255, 37), (255, 39), -- Golf roof rack works on Tiguan
(256, 38), -- Polo exhaust
(257, 37), (257, 38), (257, 39), (257, 40), -- Floor mats work on all VW
(258, 38), -- Polo chip
(259, 37), -- Golf brake upgrade
(260, 38), -- Polo lowering
(261, 37), (261, 38), (261, 39), (261, 40), -- Oil works on all VW
(262, 38), -- Polo coilovers
(263, 37), -- Golf intercooler
(264, 38), -- Polo clutch
(265, 37), -- Golf carbon intake

-- Universal parts (266-275) - UN001-UN010 - Compatible with ALL models
(266, 1), (266, 2), (266, 3), (266, 4), (266, 5), (266, 6), (266, 7), (266, 8), (266, 9), (266, 10), -- OBD2 scanner works on all
(266, 11), (266, 12), (266, 13), (266, 14), (266, 15), (266, 16), (266, 17), (266, 18), (266, 19), (266, 20),
(266, 21), (266, 22), (266, 23), (266, 24), (266, 25), (266, 26), (266, 27), (266, 28), (266, 29), (266, 30),
(266, 31), (266, 32), (266, 33), (266, 34), (266, 35), (266, 36), (266, 37), (266, 38), (266, 39), (266, 40),

-- Car cover - works on sedans and small SUVs
(267, 2), (267, 3), (267, 10), (267, 12), (267, 14), (267, 16), (267, 34), (267, 36), (267, 38), (267, 40),

-- Phone mount - universal
(268, 1), (268, 2), (268, 3), (268, 4), (268, 5), (268, 6), (268, 7), (268, 8), (268, 9), (268, 10),
(268, 11), (268, 12), (268, 13), (268, 14), (268, 15), (268, 16), (268, 17), (268, 18), (268, 19), (268, 20),
(268, 21), (268, 22), (268, 23), (268, 24), (268, 25), (268, 26), (268, 27), (268, 28), (268, 29), (268, 30),
(268, 31), (268, 32), (268, 33), (268, 34), (268, 35), (268, 36), (268, 37), (268, 38), (268, 39), (268, 40),

-- Jump starter - universal
(269, 1), (269, 2), (269, 3), (269, 4), (269, 5), (269, 6), (269, 7), (269, 8), (269, 9), (269, 10),
(269, 11), (269, 12), (269, 13), (269, 14), (269, 15), (269, 16), (269, 17), (269, 18), (269, 19), (269, 20),
(269, 21), (269, 22), (269, 23), (269, 24), (269, 25), (269, 26), (269, 27), (269, 28), (269, 29), (269, 30),
(269, 31), (269, 32), (269, 33), (269, 34), (269, 35), (269, 36), (269, 37), (269, 38), (269, 39), (269, 40),

-- Tire pressure gauge - universal
(270, 1), (270, 2), (270, 3), (270, 4), (270, 5), (270, 6), (270, 7), (270, 8), (270, 9), (270, 10),
(270, 11), (270, 12), (270, 13), (270, 14), (270, 15), (270, 16), (270, 17), (270, 18), (270, 19), (270, 20),
(270, 21), (270, 22), (270, 23), (270, 24), (270, 25), (270, 26), (270, 27), (270, 28), (270, 29), (270, 30),
(270, 31), (270, 32), (270, 33), (270, 34), (270, 35), (270, 36), (270, 37), (270, 38), (270, 39), (270, 40),

-- Car vacuum - universal
(271, 1), (271, 2), (271, 3), (271, 4), (271, 5), (271, 6), (271, 7), (271, 8), (271, 9), (271, 10),
(271, 11), (271, 12), (271, 13), (271, 14), (271, 15), (271, 16), (271, 17), (271, 18), (271, 19), (271, 20),
(271, 21), (271, 22), (271, 23), (271, 24), (271, 25), (271, 26), (271, 27), (271, 28), (271, 29), (271, 30),
(271, 31), (271, 32), (271, 33), (271, 34), (271, 35), (271, 36), (271, 37), (271, 38), (271, 39), (271, 40),

-- Seat organizer - universal
(272, 1), (272, 2), (272, 3), (272, 4), (272, 5), (272, 6), (272, 7), (272, 8), (272, 9), (272, 10),
(272, 11), (272, 12), (272, 13), (272, 14), (272, 15), (272, 16), (272, 17), (272, 18), (272, 19), (272, 20),
(272, 21), (272, 22), (272, 23), (272, 24), (272, 25), (272, 26), (272, 27), (272, 28), (272, 29), (272, 30),
(272, 31), (272, 32), (272, 33), (272, 34), (272, 35), (272, 36), (272, 37), (272, 38), (272, 39), (272, 40),

-- Dash cam - universal
(273, 1), (273, 2), (273, 3), (273, 4), (273, 5), (273, 6), (273, 7), (273, 8), (273, 9), (273, 10),
(273, 11), (273, 12), (273, 13), (273, 14), (273, 15), (273, 16), (273, 17), (273, 18), (273, 19), (273, 20),
(273, 21), (273, 22), (273, 23), (273, 24), (273, 25), (273, 26), (273, 27), (273, 28), (273, 29), (273, 30),
(273, 31), (273, 32), (273, 33), (273, 34), (273, 35), (273, 36), (273, 37), (273, 38), (273, 39), (273, 40),

-- Car charger - universal
(274, 1), (274, 2), (274, 3), (274, 4), (274, 5), (274, 6), (274, 7), (274, 8), (274, 9), (274, 10),
(274, 11), (274, 12), (274, 13), (274, 14), (274, 15), (274, 16), (274, 17), (274, 18), (274, 19), (274, 20),
(274, 21), (274, 22), (274, 23), (274, 24), (274, 25), (274, 26), (274, 27), (274, 28), (274, 29), (274, 30),
(274, 31), (274, 32), (274, 33), (274, 34), (274, 35), (274, 36), (274, 37), (274, 38), (274, 39), (274, 40),

-- Emergency kit - universal
(275, 1), (275, 2), (275, 3), (275, 4), (275, 5), (275, 6), (275, 7), (275, 8), (275, 9), (275, 10),
(275, 11), (275, 12), (275, 13), (275, 14), (275, 15), (275, 16), (275, 17), (275, 18), (275, 19), (275, 20),
(275, 21), (275, 22), (275, 23), (275, 24), (275, 25), (275, 26), (275, 27), (275, 28), (275, 29), (275, 30),
(275, 31), (275, 32), (275, 33), (275, 34), (275, 35), (275, 36), (275, 37), (275, 38), (275, 39), (275, 40);
