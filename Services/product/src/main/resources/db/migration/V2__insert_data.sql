-- Insert Categories
INSERT INTO category (id, name, description)
VALUES
    (nextval('category_seq'), 'Electronics', 'Gadgets and electronic devices'),
    (currval('category_seq') + 1, 'Books', 'Printed books and ebooks'),
    (currval('category_seq') + 2, 'Home & Kitchen', 'Appliances and home decor'),
    (currval('category_seq') + 3, 'Computers & Accessories', 'Laptops, desktops, and peripherals'),
    (currval('category_seq') + 4, 'Clothing & Apparel', 'Men and women fashion'),
    (currval('category_seq') + 5, 'Sports & Outdoors', 'Sporting goods and outdoor gear'),
    (currval('category_seq') + 6, 'Beauty & Personal Care', 'Skincare, cosmetics, and hygiene'),
    (currval('category_seq') + 7, 'Automotive', 'Car accessories and maintenance tools');

-- Insert Products
INSERT INTO product (id, name, description, available_quantity, price, category_id)
VALUES
    -- Electronics
    (nextval('product_seq'), 'Smartphone', 'Latest flagship mobile phone', 50.0, 999.99, (SELECT id FROM category WHERE name = 'Electronics')),
    (currval('product_seq') + 1, 'Wireless Headphones', 'Noise-canceling over-ear headphones', 120.0, 199.50, (SELECT id FROM category WHERE name = 'Electronics')),
    (currval('product_seq') + 2, 'Smartwatch', 'Fitness tracker with heart rate monitor', 85.0, 249.99, (SELECT id FROM category WHERE name = 'Electronics')),
    (currval('product_seq') + 3, 'Bluetooth Speaker', 'Portable waterproof speaker', 150.0, 79.99, (SELECT id FROM category WHERE name = 'Electronics')),

    -- Books
    (currval('product_seq') + 4, 'Database Design Book', 'Comprehensive guide to SQL and schema design', 200.0, 49.99, (SELECT id FROM category WHERE name = 'Books')),
    (currval('product_seq') + 5, 'Clean Code', 'A handbook of agile software craftsmanship', 110.0, 42.50, (SELECT id FROM category WHERE name = 'Books')),
    (currval('product_seq') + 6, 'Designing Data-Intensive Applications', 'Deep dive into distributed systems', 90.0, 55.00, (SELECT id FROM category WHERE name = 'Books')),
    (currval('product_seq') + 7, 'The Pragmatic Programmer', 'Your journey to mastery', 75.0, 39.99, (SELECT id FROM category WHERE name = 'Books')),

    -- Home & Kitchen
    (currval('product_seq') + 8, 'Espresso Machine', 'Compact 15-bar pump espresso maker', 15.0, 299.00, (SELECT id FROM category WHERE name = 'Home & Kitchen')),
    (currval('product_seq') + 9, 'Air Fryer', '5.8 quart digital air fryer', 60.0, 119.95, (SELECT id FROM category WHERE name = 'Home & Kitchen')),
    (currval('product_seq') + 10, 'Blender', 'High-speed professional blender', 40.0, 89.99, (SELECT id FROM category WHERE name = 'Home & Kitchen')),
    (currval('product_seq') + 11, 'Non-stick Cookware Set', '10-piece aluminum pots and pans', 30.0, 149.50, (SELECT id FROM category WHERE name = 'Home & Kitchen')),

    -- Computers & Accessories
    (currval('product_seq') + 12, 'Ultrabook Laptop', '14-inch lightweight laptop 16GB RAM', 25.0, 1299.00, (SELECT id FROM category WHERE name = 'Computers & Accessories')),
    (currval('product_seq') + 13, 'Mechanical Keyboard', 'RGB backlight tactile switches', 140.0, 89.00, (SELECT id FROM category WHERE name = 'Computers & Accessories')),
    (currval('product_seq') + 14, 'Ergonomic Mouse', 'Wireless vertical mouse', 210.0, 45.00, (SELECT id FROM category WHERE name = 'Computers & Accessories')),
    (currval('product_seq') + 15, '4K Monitor', '27-inch IPS display with USB-C', 35.0, 349.99, (SELECT id FROM category WHERE name = 'Computers & Accessories')),

    -- Clothing & Apparel
    (currval('product_seq') + 16, 'Cotton T-Shirt', 'Breathable casual t-shirt', 500.0, 19.99, (SELECT id FROM category WHERE name = 'Clothing & Apparel')),
    (currval('product_seq') + 17, 'Denim Jeans', 'Classic fit durable denim', 250.0, 59.90, (SELECT id FROM category WHERE name = 'Clothing & Apparel')),
    (currval('product_seq') + 18, 'Winter Jacket', 'Waterproof insulated jacket', 80.0, 129.99, (SELECT id FROM category WHERE name = 'Clothing & Apparel')),

    -- Sports & Outdoors
    (currval('product_seq') + 19, 'Yoga Mat', 'Non-slip eco-friendly workout mat', 180.0, 29.99, (SELECT id FROM category WHERE name = 'Sports & Outdoors')),
    (currval('product_seq') + 20, 'Camping Tent', '4-person waterproof dome tent', 45.0, 159.00, (SELECT id FROM category WHERE name = 'Sports & Outdoors')),
    (currval('product_seq') + 21, 'Dumbbell Set', 'Adjustable weights up to 50 lbs', 65.0, 199.99, (SELECT id FROM category WHERE name = 'Sports & Outdoors')),

    -- Beauty & Personal Care
    (currval('product_seq') + 22, 'Electric Toothbrush', 'Sonic cleaning with timer', 130.0, 49.99, (SELECT id FROM category WHERE name = 'Beauty & Personal Care')),
    (currval('product_seq') + 23, 'Facial Cleanser', 'Gentle hydrating skin formula', 300.0, 15.50, (SELECT id FROM category WHERE name = 'Beauty & Personal Care')),

    -- Automotive
    (currval('product_seq') + 24, 'Dash Cam', '1080p HD night vision camera', 95.0, 69.99, (SELECT id FROM category WHERE name = 'Automotive')),
    (currval('product_seq') + 25, 'Portable Air Compressor', 'Digital tire inflator 12V', 110.0, 39.95, (SELECT id FROM category WHERE name = 'Automotive'));