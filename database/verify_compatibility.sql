-- Verification queries to check our compatibility data

-- Check total compatibility records
SELECT COUNT(*) as total_compatibility_records FROM product_compatibility;

-- Check products without compatibility (should be minimal)
SELECT p.id, p.part_number, p.name 
FROM products p 
LEFT JOIN product_compatibility pc ON p.id = pc.product_id 
WHERE pc.product_id IS NULL;

-- Check compatibility distribution by brand
SELECT 
    mk.name as brand,
    COUNT(DISTINCT pc.product_id) as products_with_compatibility,
    COUNT(pc.id) as total_compatibility_records
FROM car_makes mk
JOIN car_models cm ON mk.id = cm.make_id
JOIN product_compatibility pc ON cm.id = pc.car_model_id
GROUP BY mk.id, mk.name
ORDER BY products_with_compatibility DESC;

-- Check products with most compatibility (universal parts)
SELECT 
    p.part_number,
    p.name,
    COUNT(pc.car_model_id) as compatible_models
FROM products p
JOIN product_compatibility pc ON p.id = pc.product_id
GROUP BY p.id, p.part_number, p.name
HAVING COUNT(pc.car_model_id) > 3
ORDER BY compatible_models DESC;

-- Check compatibility by category
SELECT 
    c.name as category,
    COUNT(DISTINCT pc.product_id) as products_with_compatibility
FROM categories c
JOIN products p ON c.id = p.category_id
JOIN product_compatibility pc ON p.id = pc.product_id
GROUP BY c.id, c.name
ORDER BY products_with_compatibility DESC;

-- Sample query to show products compatible with Toyota Hilux
SELECT 
    p.part_number,
    p.name,
    p.price,
    c.name as category
FROM products p
JOIN product_compatibility pc ON p.id = pc.product_id
JOIN car_models cm ON pc.car_model_id = cm.id
JOIN categories c ON p.category_id = c.id
WHERE cm.name = 'Hilux'
ORDER BY c.name, p.name;
