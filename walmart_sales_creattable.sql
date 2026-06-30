 CREATE TABLE walmart_sales (
    id SERIAL PRIMARY KEY,
    invoice_id INT,
    branch VARCHAR(20),
    city VARCHAR(50),
    category VARCHAR(100),
    unit_price TEXT,
    quantity INT,
    date TEXT,
    time TEXT,
    payment_method VARCHAR(20),
    rating DECIMAL(3,1),
    profit_margin DECIMAL(4,2)
);

select*from walmart_sales;
