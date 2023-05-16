INSERT INTO Category (category_id, name, description)
VALUES
(4, 'Appliances', 'Home appliances'),
(5, 'Books', 'Book categories');

INSERT INTO Supplier (supplier_id, name, address, phone, email)
VALUES
(3, 'EFG Supplier', '789 Elm Street, City', '555-123-7890', 'efg@supplier.com'),
(4, 'PQR Supplier', '456 Oak Street, City', '555-987-6543', 'pqr@supplier.com');

INSERT INTO Product (product_id, name, description, category_id, cost, price, manufacturer, reorder_level)
VALUES
(7, 'Microwave', 'Kitchen microwave', 4, 80.00, 129.99, 'EFG Manufacturer', 5),
(8, 'Novel', 'Fiction novel', 5, 10.00, 24.99, 'PQR Publisher', 10);

INSERT INTO Customer (customer_id, first_name, last_name, address, phone, email)
VALUES
(5, 'Michael', 'Brown', '123 Maple Street, City', '555-555-7890', 'michael.brown@example.com'),
(6, 'Emily', 'Davis', '456 Elm Street, City', '555-888-6543', 'emily.davis@example.com');

INSERT INTO Warehouse (warehouse_id, name, address, phone, email)
VALUES
(4, 'Fourth Warehouse', '777 Pine Street, City', '555-555-1111', 'warehouse4@example.com');

INSERT INTO Inventory (product_id, warehouse_id, quantity)
VALUES
(7, 1, 10),
(8, 2, 8);

INSERT INTO Supplier_Product (supplier_id, product_id)
VALUES
(3, 7),
(4, 8);

INSERT INTO Customer_Order (order_id, customer_id, order_date, order_total)
VALUES
(5, 5, '2023-05-08', 129.99),
(6, 6, '2023-05-09', 34.99);

INSERT INTO Order_Product (order_item_id, order_id, product_id, quantity, price)
VALUES
(7, 5, 7, 1, 129.99),
(8, 6, 8, 2, 24.99);

INSERT INTO Warehouse_Transaction (transaction_id, product_id, warehouse_id, transaction_date, transaction_type, quantity)
VALUES
(7, 7, 1, '2023-05-10', 'Inbound', 5),
(8, 8, 2, '2023-05-11', 'Outbound', 1);

-- Sample queries

-- Get all products
SELECT * FROM Product;

-- Get all categories
SELECT * FROM Category;

-- Get all suppliers
SELECT * FROM Supplier;

-- Get all customers
SELECT * FROM Customer;

-- Get all customer orders
SELECT * FROM Customer_Order;

-- Get all order items
SELECT * FROM Order_Product;

-- Get all warehouses
SELECT * FROM Warehouse;

-- Get all inventory items
SELECT * FROM Inventory;

-- Get all supplier-product relationships
SELECT * FROM Supplier_Product;

-- Get all warehouse transactions
SELECT * FROM Warehouse_Transaction;

-- Get order summary
SELECT * FROM OrderSummary;

-- Get warehouse inventory
SELECT * FROM WarehouseInventory;

-- Get supplier product catalog
SELECT * FROM SupplierProductCatalog;
