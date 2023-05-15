CREATE TABLE Product (
  product_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(255),
  category_id INT NOT NULL,
  cost DECIMAL(10, 2) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  manufacturer VARCHAR(50),
  reorder_level INT NOT NULL
);
CREATE TABLE Category (
  category_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL
);
CREATE TABLE Supplier (
  supplier_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NULL,
  email VARCHAR(50) NOT NULL
);
CREATE TABLE Customer (
  customer_id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NULL,
  email VARCHAR(50) NOT NULL
);
CREATE TABLE Customer_Order (
  order_id INT NOT NULL PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  order_total DECIMAL(10, 2) NOT NULL,
  CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);
CREATE TABLE Order_Product (
  order_item_id INT NOT NULL PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  CONSTRAINT fk_order_items_orders
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
  CONSTRAINT fk_order_items_products
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);
CREATE TABLE Supplier_Product (
  supplier_id INT NOT NULL,
  product_id INT NOT NULL,
  CONSTRAINT pk_suppliers_products
    PRIMARY KEY (supplier_id, product_id),
  CONSTRAINT fk_suppliers_products_suppliers
    FOREIGN KEY (supplier_id)
    REFERENCES suppliers(supplier_id),
  CONSTRAINT fk_suppliers_products_products
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);
CREATE TABLE Inventory (
  product_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  quantity INT NOT NULL,
  CONSTRAINT pk_inventory
    PRIMARY KEY (product_id, warehouse_id),
  CONSTRAINT fk_inventory_products
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);
CREATE TABLE Warehouse (
  warehouse_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(50) NOT NULL
);
CREATE TABLE Warehouse_Transaction (
  transaction_id INT NOT NULL PRIMARY KEY,
  product_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  transaction_date DATE NOT NULL,
  transaction_type VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  CONSTRAINT fk_transactions_products
    FOREIGN KEY (product_id)
    REFERENCES products(product_id),
  CONSTRAINT fk_transactions_warehouses
    FOREIGN KEY (warehouse_id)
    REFERENCES warehouses(warehouse_id)
);


-- Inserting dummy data into the Category table
INSERT INTO Category (category_id, name, description)
VALUES
  (1, 'Electronics', 'Electronic products'),
  (2, 'Clothing', 'Apparel and clothing items'),
  (3, 'Home and Kitchen', 'Household and kitchen products');

-- Inserting dummy data into the Supplier table
INSERT INTO Supplier (supplier_id, name, address, phone, email)
VALUES
  (1, 'ABC Supplier', '123 Main Street, City', '123-456-7890', 'abc@supplier.com'),
  (2, 'XYZ Supplier', '456 Elm Street, City', '987-654-3210', 'xyz@supplier.com');

-- Inserting dummy data into the Product table
INSERT INTO Product (product_id, name, description, category_id, cost, price, manufacturer, reorder_level)
VALUES
  (1, 'TV', 'High-definition television', 1, 500.00, 799.99, 'ABC Manufacturer', 10),
  (2, 'T-Shirt', 'Cotton t-shirt', 2, 10.00, 19.99, 'XYZ Manufacturer', 20),
  (3, 'Knife Set', 'Kitchen knife set', 3, 50.00, 79.99, 'ABC Manufacturer', 5);

-- Inserting dummy data into the Customer table
INSERT INTO Customer (customer_id, first_name, last_name, address, phone, email)
VALUES
  (1, 'John', 'Doe', '123 Oak Street, City', '555-123-4567', 'john.doe@example.com'),
  (2, 'Jane', 'Smith', '456 Maple Street, City', '555-987-6543', 'jane.smith@example.com');

-- Inserting dummy data into the Warehouse table
INSERT INTO Warehouse (warehouse_id, name, address, phone, email)
VALUES
  (1, 'Main Warehouse', '789 Pine Street, City', '555-555-5555', 'warehouse@example.com'),
  (2, 'Secondary Warehouse', '321 Cedar Street, City', '555-888-8888', 'warehouse2@example.com');

-- Inserting dummy data into the Customer_Order table
INSERT INTO Customer_Order (order_id, customer_id, order_date, order_total)
VALUES
  (1, 1, '2023-05-01', 199.99),
  (2, 2, '2023-05-02', 79.99);

-- Inserting dummy data into the Order_Product table
INSERT INTO Order_Product (order_item_id, order_id, product_id, quantity, price)
VALUES
  (1, 1, 1, 1, 799.99),
  (2, 1, 2, 2, 19.99),
  (3, 2, 3, 1, 79.99);

-- Inserting dummy data into the Supplier_Product table
INSERT INTO Supplier_Product (supplier_id, product_id)
VALUES
  (1, 1),
  (2, 2),
  (1, 3);

-- Inserting dummy data into the Inventory table
INSERT INTO Inventory (product_id, warehouse_id, quantity)
VALUES
  (1, 1, 5),
  (2, 1, 10),
  (3, 2, 8);

-- Inserting dummy data into the Warehouse_Transaction table
INSERT INTO Warehouse_Transaction (transaction_id, product_id, warehouse_id,transaction_date, transaction_type, quantity)
VALUES
  (1, 1, 1, '2023-05-03', 'Inbound', 2),
  (2, 2, 2, '2023-05-04', 'Outbound', 1),
  (3, 3, 3, '2023-05-05', 'Inbound', 3);

