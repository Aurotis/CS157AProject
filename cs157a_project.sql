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
