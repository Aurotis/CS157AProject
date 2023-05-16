-- Inserting dummy data into the Product table
INSERT INTO Product (product_id, name, description, category_id, cost, price, manufacturer, reorder_level)
VALUES
  (4, 'Headphones', 'Wireless headphones', 1, 30.00, 49.99, 'ABC Manufacturer', 5),
  (5, 'Jeans', 'Denim jeans', 2, 20.00, 39.99, 'XYZ Manufacturer', 15),
  (6, 'Blender', 'Kitchen blender', 3, 40.00, 69.99, 'ABC Manufacturer', 3);

-- Inserting dummy data into the Customer table
INSERT INTO Customer (customer_id, first_name, last_name, address, phone, email)
VALUES
  (3, 'Mary', 'Johnson', '789 Pine Street, City', '555-555-5555', 'mary.johnson@example.com'),
  (4, 'Robert', 'Williams', '321 Cedar Street, City', '555-888-8888', 'robert.williams@example.com');

-- Inserting dummy data into the Warehouse table
INSERT INTO Warehouse (warehouse_id, name, address, phone, email)
VALUES
  (3, 'Third Warehouse', '555 Oak Street, City', '555-111-1111', 'warehouse3@example.com');

-- Inserting dummy data into the Inventory table
INSERT INTO Inventory (product_id, warehouse_id, quantity)
VALUES
  (4, 1, 15),
  (5, 2, 12),
  (6, 3, 6);

-- Inserting dummy data into the Supplier_Product table
INSERT INTO Supplier_Product (supplier_id, product_id)
VALUES
  (1, 4),
  (2, 5),
  (1, 6);

-- Inserting dummy data into the Customer_Order table
INSERT INTO Customer_Order (order_id, customer_id, order_date, order_total)
VALUES
  (3, 3, '2023-05-03', 99.99),
  (4, 4, '2023-05-04', 59.99);

-- Inserting dummy data into the Order_Product table
INSERT INTO Order_Product (order_item_id, order_id, product_id, quantity, price)
VALUES
  (4, 3, 4, 1, 49.99),
  (5, 3, 5, 2, 39.99),
  (6, 4, 6, 1, 69.99);

-- Inserting dummy data into the Warehouse_Transaction table
INSERT INTO Warehouse_Transaction (transaction_id, product_id, warehouse_id, transaction_date, transaction_type, quantity)
VALUES
  (4, 4, 1, '2023-05-05', 'Outbound', 3),
  (5, 5, 2, '2023-05-06', 'Inbound', 4),
  (6, 6, 3, '2023-05-07', 'Inbound', 2);

SELECT p.name AS product_name, c.name AS category_name
FROM Product p
JOIN Category c ON p.category_id = c.category_id;

SELECT c.name AS category_name, COUNT(o.order_id) AS order_count
FROM Category c
LEFT JOIN Product p ON c.category_id = p.category_id
LEFT JOIN Order_Product op ON p.product_id = op.product_id
LEFT JOIN Customer_Order o ON op.order_id = o.order_id
GROUP BY c.category_id, c.name;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(co.order_id) AS order_count, SUM(co.order_total) AS total_order_value
FROM Customer c
LEFT JOIN Customer_Order co ON c.customer_id = co.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT w.warehouse_id, w.name AS warehouse_name, p.name AS product_name, i.quantity
FROM Warehouse w
JOIN Inventory i ON w.warehouse_id = i.warehouse_id
JOIN Product p ON i.product_id = p.product_id
WHERE w.name = 'Main Warehouse';

SELECT wt.warehouse_id, w.name AS warehouse_name, wt.product_id, p.name AS product_name,
       SUM(CASE WHEN wt.transaction_type = 'Inbound' THEN wt.quantity ELSE 0 END) AS total_inbound,
       SUM(CASE WHEN wt.transaction_type = 'Outbound' THEN wt.quantity ELSE 0 END) AS total_outbound
FROM Warehouse_Transaction wt
JOIN Warehouse w ON wt.warehouse_id = w.warehouse_id
JOIN Product p ON wt.product_id = p.product_id
GROUP BY wt.warehouse_id, w.name, wt.product_id, p.name;
