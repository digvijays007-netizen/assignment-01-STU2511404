-- Customers
CREATE TABLE Customers (
    customer_id TEXT PRIMARY KEY,
    customer_name TEXT NOT NULL,
    customer_email TEXT NOT NULL,
    customer_city TEXT NOT NULL
);

-- Products
CREATE TABLE Products (
    product_id TEXT PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_price REAL NOT NULL
);

-- Sales Representatives
CREATE TABLE Sales_Reps (
    sales_rep_id TEXT PRIMARY KEY,
    sales_rep_name TEXT NOT NULL,
    sales_rep_email TEXT NOT NULL,
    office_address TEXT NOT NULL
);

-- Orders
CREATE TABLE Orders (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT NOT NULL,
    sales_rep_id TEXT NOT NULL,
    order_date TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

-- Order Items
CREATE TABLE Order_Items (
    order_id TEXT,
    product_id TEXT,
    quantity INTEGER NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Sample Data

INSERT INTO Customers VALUES 
('C1','Rahul Sharma','rahul@email.com','Mumbai'),
('C2','Anita Verma','anita@email.com','Delhi'),
('C3','John Doe','john@email.com','Mumbai'),
('C4','Sara Khan','sara@email.com','Pune'),
('C5','Amit Singh','amit@email.com','Mumbai');

INSERT INTO Products VALUES
('P1','Laptop','Electronics',50000),
('P2','Mouse','Electronics',500),
('P3','Keyboard','Electronics',1500),
('P4','Chair','Furniture',3000),
('P5','Desk','Furniture',7000);

INSERT INTO Sales_Reps VALUES
('S1','Raj Mehta','raj@email.com','Mumbai Office'),
('S2','Neha Jain','neha@email.com','Delhi Office'),
('S3','Karan Shah','karan@email.com','Mumbai Office'),
('S4','Priya Nair','priya@email.com','Pune Office'),
('S5','Arjun Rao','arjun@email.com','Delhi Office');

INSERT INTO Orders VALUES
('O1','C1','S1','2024-01-01'),
('O2','C2','S2','2024-01-02'),
('O3','C3','S3','2024-01-03'),
('O4','C4','S4','2024-01-04'),
('O5','C5','S5','2024-01-05');

INSERT INTO Order_Items VALUES
('O1','P1',1),
('O1','P2',2),
('O2','P3',1),
('O3','P4',3),
('O4','P5',1);
