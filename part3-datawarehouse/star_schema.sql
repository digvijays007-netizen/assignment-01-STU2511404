-- DIMENSION TABLES
CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date TEXT NOT NULL,
    month INTEGER NOT NULL,
    year INTEGER NOT NULL
);

CREATE TABLE dim_store (
    store_id TEXT PRIMARY KEY,
    store_name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE dim_product (
    product_id TEXT PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL
);

-- FACT TABLE
CREATE TABLE fact_sales (
    sales_id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_id INTEGER,
    store_id TEXT,
    product_id TEXT,
    quantity INTEGER NOT NULL,
    revenue REAL NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- CLEANED DATA INSERTS
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 2024),
(2, '2024-01-05', 1, 2024),
(3, '2024-02-01', 2, 2024),
(4, '2024-02-10', 2, 2024),
(5, '2024-03-01', 3, 2024);

INSERT INTO dim_store VALUES
('S1', 'Mumbai Central', 'Mumbai'),
('S2', 'Delhi Plaza', 'Delhi'),
('S3', 'Bangalore Hub', 'Bangalore');

INSERT INTO dim_product VALUES
('P1', 'Laptop', 'ELECTRONICS'),
('P2', 'Mouse', 'ELECTRONICS'),
('P3', 'Desk Chair', 'FURNITURE'),
('P4', 'Table', 'FURNITURE');

INSERT INTO fact_sales (date_id, store_id, product_id, quantity, revenue) VALUES
(1, 'S1', 'P1', 1, 70000),
(1, 'S1', 'P2', 2, 1000),
(2, 'S2', 'P1', 1, 70000),
(2, 'S2', 'P3', 1, 8000),
(3, 'S3', 'P4', 1, 12000),
(3, 'S3', 'P2', 3, 1500),
(4, 'S1', 'P3', 2, 16000),
(4, 'S2', 'P4', 1, 12000),
(5, 'S3', 'P1', 1, 70000),
(5, 'S1', 'P2', 4, 2000);
