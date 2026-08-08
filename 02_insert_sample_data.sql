-- 1 INSERT users data.

INSERT INTO users (
    full_name,
    email,
    phone,
    hash_password,
    role
)
VALUES
(
    'Ahmad Ali',
    'ahmad.ali@example.com',
    '0799000001',
    'hash_demo_001',
    'customer'
),
(
    'Omar Khaled',
    'omar.khaled@example.com',
    '0799000002',
    'hash_demo_002',
    'customer'
),
(
    'Sara Hassan',
    'sara.hassan@example.com',
    '0799000003',
    'hash_demo_003',
    'customer'
),
(
    'Lina Ahmad',
    'lina.ahmad@example.com',
    '0799000004',
    'hash_demo_004',
    'customer'
),
(
    'Yazan Mohammed',
    'yazan.mohammed@example.com',
    '0799000005',
    'hash_demo_005',
    'customer'
),
(
    'Noor Samir',
    'noor.samir@example.com',
    '0799000006',
    'hash_demo_006',
    'customer'
),
(
    'Admin User',
    'admin@example.com',
    '0799000007',
    'hash_demo_admin',
    'admin'
),
(
    'Khaled Saleh',
    'khaled.saleh@example.com',
    '0799000008',
    'hash_demo_008',
    'customer'
);

-- 2 INSERT categories Data.

INSERT INTO categories (
    name,
    description
)
VALUES
(
    'Computers',
    'Laptops, desktops and computer hardware'
),
(
    'Phones',
    'Smartphones and mobile devices'
),
(
    'Accessories',
    'Computer and mobile accessories'
),
(
    'Audio',
    'Headphones, speakers and audio devices'
),
(
    'Gaming',
    'Gaming devices and peripherals'
);

-- 3 INSERT products Data

INSERT INTO products (
    category_id,
    name,
    description,
    price,
    quantity_stock,
    sku
)
VALUES
-- Computers (category_id = 1)
(1, 'Lenovo ThinkPad E14',
 '14-inch business laptop with Intel Core i5 processor',
 749.99, 15, 'LAP-LEN-E14'),

(1, 'HP Pavilion 15',
 '15.6-inch laptop suitable for everyday computing',
 679.99, 12, 'LAP-HP-P15'),

(1, 'Dell Inspiron 16',
 '16-inch laptop with Intel Core i7 processor',
 999.99, 8, 'LAP-DEL-I16'),

(1, 'ASUS VivoBook 15',
 'Lightweight 15.6-inch productivity laptop',
 599.99, 20, 'LAP-ASU-V15'),

-- Phones (category_id = 2)
(2, 'Samsung Galaxy S24',
 'Flagship Android smartphone',
 899.99, 10, 'PHN-SAM-S24'),

(2, 'iPhone 15',
 'Apple smartphone with advanced camera system',
 799.99, 7, 'PHN-APP-IP15'),

(2, 'Google Pixel 8',
 'Android smartphone with Google Tensor processor',
 699.99, 0, 'PHN-GOO-P8'),

(2, 'OnePlus 12',
 'High-performance Android smartphone',
 749.99, 6, 'PHN-ONE-12'),

-- Accessories (category_id = 3)
(3, 'Logitech MX Master 3S',
 'Wireless ergonomic productivity mouse',
 99.99, 25, 'ACC-LOG-MX3'),

(3, 'Keychron K2',
 'Wireless mechanical keyboard',
 89.99, 18, 'ACC-KEY-K2'),

(3, 'Anker USB-C Hub',
 'Multi-port USB-C connectivity hub',
 39.99, 30, 'ACC-ANK-HUB'),

(3, 'Laptop Stand',
 'Adjustable aluminum laptop stand',
 29.99, 0, 'ACC-LAP-STD'),

-- Audio (category_id = 4)
(4, 'Sony WH-1000XM5',
 'Wireless noise-cancelling headphones',
 349.99, 9, 'AUD-SON-XM5'),

(4, 'JBL Flip 6',
 'Portable Bluetooth speaker',
 129.99, 14, 'AUD-JBL-F6'),

(4, 'Apple AirPods Pro',
 'Wireless earbuds with active noise cancellation',
 249.99, 11, 'AUD-APP-APP'),

(4, 'Audio-Technica ATH-M50x',
 'Professional studio monitor headphones',
 169.99, 5, 'AUD-AUD-M50'),

-- Gaming (category_id = 5)
(5, 'PlayStation 5',
 'Next-generation gaming console',
 499.99, 4, 'GAM-PS5-STD'),

(5, 'Xbox Series X',
 'High-performance gaming console',
 499.99, 3, 'GAM-XBX-X'),

(5, 'Razer DeathAdder V3',
 'High-performance gaming mouse',
 69.99, 16, 'GAM-RAZ-DV3'),

(5, 'SteelSeries Arctis Nova 7',
 'Wireless gaming headset',
 179.99, 13, 'GAM-STE-N7');

-- 4 INSERT orders Data.

INSERT INTO orders (
    user_id,
    status,
    total_amount,
    shipping_address,
    notes
)
VALUES
(
    1,
    'delivered',
    849.98,
    'Amman, Jordan - Khalda',
    'Please deliver during the morning'
),
(
    2,
    'shipped',
    129.99,
    'Amman, Jordan - Sweifieh',
    'Call before delivery'
),
(
    3,
    'processing',
    999.99,
    'Amman, Jordan - Abdoun',
    'Leave at the reception'
),
(
    4,
    'confirmed',
    249.99,
    'Amman, Jordan - Shmeisani',
    NULL
),
(
    5,
    'pending',
    69.99,
    'Amman, Jordan - Marka',
    'Customer prefers evening delivery'
),
(
    6,
    'delivered',
    899.99,
    'Amman, Jordan - Tla Al Ali',
    NULL
),
(
    7,
    'cancelled',
    499.99,
    'Amman, Jordan - Dabouq',
    'Order cancelled by customer'
),
(
    8,
    'processing',
    179.99,
    'Amman, Jordan - Jubeiha',
    NULL
),
(
    1,
    'confirmed',
    349.99,
    'Amman, Jordan - Khalda',
    'Second order from customer'
),
(
    3,
    'pending',
    599.99,
    'Amman, Jordan - Abdoun',
    'Please contact customer before shipping'
);


-- NOTE: UPDATE COMMAND.
UPDATE orders
SET total_amount = CASE id
    WHEN 1 THEN 969.96
    WHEN 2 THEN 259.97
    WHEN 3 THEN 1139.97
    WHEN 4 THEN 459.97
    WHEN 5 THEN 109.98
    WHEN 6 THEN 1599.98
    WHEN 7 THEN 999.98
    WHEN 8 THEN 429.98
    WHEN 9 THEN 519.98
    WHEN 10 THEN 1279.98
END
WHERE id BETWEEN 1 AND 10;



-- 5 INSERT items_order Table.

INSERT INTO items_order (
    order_id,
    product_id,
    quantity,
    price_unit,
    subtotal
)
VALUES

-- Order 1
(1, 1, 1, 749.99, 749.99),
(1, 9, 1, 99.99, 99.99),
(1, 10, 1, 89.99, 89.99),
(1, 12, 1, 29.99, 29.99),

-- Order 2
(2, 14, 1, 129.99, 129.99),
(2, 10, 1, 89.99, 89.99),
(2, 11, 1, 39.99, 39.99),

-- Order 3
(3, 3, 1, 999.99, 999.99),
(3, 11, 1, 39.99, 39.99),
(3, 9, 1, 99.99, 99.99),

-- Order 4
(4, 15, 1, 249.99, 249.99),
(4, 16, 1, 169.99, 169.99),
(4, 11, 1, 39.99, 39.99),

-- Order 5
(5, 19, 1, 69.99, 69.99),
(5, 11, 1, 39.99, 39.99),

-- Order 6
(6, 5, 1, 899.99, 899.99),
(6, 7, 1, 699.99, 699.99),

-- Order 7
(7, 17, 1, 499.99, 499.99),
(7, 18, 1, 499.99, 499.99),

-- Order 8
(8, 20, 1, 179.99, 179.99),
(8, 15, 1, 249.99, 249.99),

-- Order 9
(9, 13, 1, 349.99, 349.99),
(9, 16, 1, 169.99, 169.99),

-- Order 10
(10, 4, 1, 599.99, 599.99),
(10, 2, 1, 679.99, 679.99);


-- 6 INSERT payments Data.

INSERT INTO payments (
    order_id,
    payment_method,
    payment_status,
    amount,
    transaction_reference,
    paid_at
)
VALUES
(
    1,
    'card',
    'paid',
    969.96,
    'TXN-000001',
    CURRENT_TIMESTAMP
),
(
    2,
    'cash',
    'paid',
    259.97,
    NULL,
    CURRENT_TIMESTAMP
),
(
    3,
    'bank_transfer',
    'paid',
    1139.97,
    'TXN-000003',
    CURRENT_TIMESTAMP
),
(
    4,
    'wallet',
    'paid',
    459.97,
    'TXN-000004',
    CURRENT_TIMESTAMP
),
(
    5,
    'card',
    'pending',
    109.98,
    'TXN-000005',
    NULL
),
(
    6,
    'card',
    'paid',
    1599.98,
    'TXN-000006',
    CURRENT_TIMESTAMP
),
(
    7,
    'card',
    'refunded',
    999.98,
    'TXN-000007',
    CURRENT_TIMESTAMP
),
(
    8,
    'bank_transfer',
    'paid',
    429.98,
    'TXN-000008',
    CURRENT_TIMESTAMP
);

