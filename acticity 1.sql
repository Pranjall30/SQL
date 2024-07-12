create database act1;
use act1;
CREATE TABLE productlines (
  productLine VARCHAR(50) PRIMARY KEY,
  textDescription TEXT,
  htmlDescription TEXT,
  image VARCHAR(255)
);

CREATE TABLE products (
  productCode VARCHAR(10) PRIMARY KEY,
  productName VARCHAR(50),
  productLine VARCHAR(50),
  productScale VARCHAR(50),
  productVendor VARCHAR(50),
  productDescription TEXT,
  quantityInStock INT,
  buyPrice DECIMAL(10,2),
  MSRP DECIMAL(10,2),
  FOREIGN KEY (productLine) REFERENCES productlines(productLine)
);

CREATE TABLE employees (
  employeeNumber INT PRIMARY KEY,
  lastName VARCHAR(50),
  firstName VARCHAR(50),
  extension VARCHAR(10),
  email VARCHAR(50),
  officeCode VARCHAR(10),
  reportsTo INT,
  jobTitle VARCHAR(50),
  FOREIGN KEY (officeCode) REFERENCES offices(officeCode),
  FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber)
);

CREATE TABLE offices (
  officeCode VARCHAR(10) PRIMARY KEY,
  city VARCHAR(50),
  phone VARCHAR(20),
  addressLine1 VARCHAR(50),
  addressLine2 VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50),
  postalCode VARCHAR(10),
  territory VARCHAR(50)
);

CREATE TABLE customers (
  customerNumber INT PRIMARY KEY,
  customerName VARCHAR(50),
  contactLastName VARCHAR(50),
  contactFirstName VARCHAR(50),
  phone VARCHAR(20),
  addressLine1 VARCHAR(50),
  addressLine2 VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(50),
  postalCode VARCHAR(10),
  country VARCHAR(50),
  salesRepEmployeeNumber INT,
  creditLimit DECIMAL(10,2),
  FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber)
);

CREATE TABLE orders (
  orderNumber INT PRIMARY KEY,
  orderDate DATE,
  requiredDate DATE,
  shippedDate DATE,
  status VARCHAR(10),
  comments TEXT,
  customerNumber INT,
  FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

CREATE TABLE orderdetails (
  orderNumber INT,
  productCode VARCHAR(10),
  quantityOrdered INT,
  priceEach DECIMAL(10,2),
  orderLineNumber INT,
  PRIMARY KEY (orderNumber, productCode),
  FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber),
  FOREIGN KEY (productCode) REFERENCES products(productCode)
);

CREATE TABLE payments (
  customerNumber INT,
  checkNumber INT,
  paymentDate DATE,
  amount DECIMAL(10,2),
  PRIMARY KEY (customerNumber, checkNumber),
  FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);