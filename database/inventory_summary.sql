-- Summary of all available parts with good stock quantities
SELECT 
    'INVENTORY SUMMARY' as report_type,
    COUNT(*) as total_parts,
    SUM(stock_quantity) as total_stock,
    AVG(stock_quantity) as avg_stock_per_part,
    COUNT(CASE WHEN stock_quantity > 0 THEN 1 END) as parts_in_stock,
    COUNT(CASE WHEN stock_quantity >= 10 THEN 1 END) as parts_well_stocked,
    COUNT(CASE WHEN is_featured = 1 THEN 1 END) as featured_parts
FROM products;

-- Parts by brand with stock levels
SELECT 
    SUBSTRING(part_number, 1, 2) as brand_code,
    CASE 
        WHEN SUBSTRING(part_number, 1, 2) = 'TY' THEN 'Toyota'
        WHEN SUBSTRING(part_number, 1, 2) = 'NS' THEN 'Nissan'
        WHEN SUBSTRING(part_number, 1, 2) = 'HD' THEN 'Honda'
        WHEN SUBSTRING(part_number, 1, 2) = 'MZ' THEN 'Mazda'
        WHEN SUBSTRING(part_number, 1, 2) = 'MT' THEN 'Mitsubishi'
        WHEN SUBSTRING(part_number, 1, 2) = 'SB' THEN 'Subaru'
        WHEN SUBSTRING(part_number, 1, 2) = 'IZ' THEN 'Isuzu'
        WHEN SUBSTRING(part_number, 1, 2) = 'SZ' THEN 'Suzuki'
        WHEN SUBSTRING(part_number, 1, 2) = 'HY' THEN 'Hyundai'
        WHEN SUBSTRING(part_number, 1, 2) = 'VW' THEN 'Volkswagen'
        WHEN SUBSTRING(part_number, 1, 2) = 'UN' THEN 'Universal'
        ELSE 'Other'
    END as brand_name,
    COUNT(*) as parts_count,
    SUM(stock_quantity) as total_stock,
    COUNT(CASE WHEN stock_quantity > 0 THEN 1 END) as available_parts,
    ROUND(AVG(price), 0) as avg_price
FROM products 
GROUP BY SUBSTRING(part_number, 1, 2)
ORDER BY parts_count DESC;

-- Parts by category with availability
SELECT 
    c.name as category,
    COUNT(p.id) as parts_count,
    SUM(p.stock_quantity) as total_stock,
    COUNT(CASE WHEN p.stock_quantity > 0 THEN 1 END) as available_parts,
    ROUND(AVG(p.price), 0) as avg_price,
    COUNT(CASE WHEN p.is_featured = 1 THEN 1 END) as featured_parts
FROM categories c
LEFT JOIN products p ON c.id = p.category_id
GROUP BY c.id, c.name
ORDER BY parts_count DESC;

-- High-value parts (over 300,000 TSh)
SELECT 
    part_number,
    name,
    price,
    stock_quantity,
    CASE WHEN is_featured = 1 THEN 'Yes' ELSE 'No' END as featured
FROM products 
WHERE price > 300000 
ORDER BY price DESC;

-- Well-stocked parts (20+ in stock)
SELECT 
    part_number,
    name,
    stock_quantity,
    price,
    CASE 
        WHEN SUBSTRING(part_number, 1, 2) = 'TY' THEN 'Toyota'
        WHEN SUBSTRING(part_number, 1, 2) = 'NS' THEN 'Nissan'
        WHEN SUBSTRING(part_number, 1, 2) = 'HD' THEN 'Honda'
        WHEN SUBSTRING(part_number, 1, 2) = 'MZ' THEN 'Mazda'
        WHEN SUBSTRING(part_number, 1, 2) = 'MT' THEN 'Mitsubishi'
        WHEN SUBSTRING(part_number, 1, 2) = 'SB' THEN 'Subaru'
        WHEN SUBSTRING(part_number, 1, 2) = 'IZ' THEN 'Isuzu'
        WHEN SUBSTRING(part_number, 1, 2) = 'SZ' THEN 'Suzuki'
        WHEN SUBSTRING(part_number, 1, 2) = 'HY' THEN 'Hyundai'
        WHEN SUBSTRING(part_number, 1, 2) = 'VW' THEN 'Volkswagen'
        WHEN SUBSTRING(part_number, 1, 2) = 'UN' THEN 'Universal'
        ELSE 'Other'
    END as brand
FROM products 
WHERE stock_quantity >= 20 
ORDER BY stock_quantity DESC;
