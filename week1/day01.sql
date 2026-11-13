SELECT VERSION();
SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS study_db
  DEFAULT CHARACTER SET utf8mb4;
  
USE study_db;  
CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(50) NOT NULL,
age INT,
city VARCHAR(50),
created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users(NAME,age,city)VALUES
('张三',16,'北京'),
('李四',17,'河北'),
('王五',20,'天津');

SELECT * FROM users;  
  
SELECT NAME FROM users 
 WHERE age >= 17;
  
SELECT * FROM users 
  ORDER BY age DESC;
  
SELECT * FROM users
  WHERE city LIKE '河%';
  
SELECT COUNT(*) FROM users;
  
SELECT id, NAME FROM users; 

USE study_db;
CREATE TABLE IF NOT EXISTS orders(
id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
product VARCHAR(100) NOT NULL,
amount DECIMAL(10,2) NOT NULL,
quantity INT DEFAULT 1,
order_date DATE,
STATUS VARCHAR(20) DEFAULT 'paid'
);

INSERT INTO orders(user_id,product,amount,quantity,order_date,STATUS)VALUES
(1, '《MySQL必知必会》', 59.90, 1, '2026-11-01', 'paid'),
(2, '机械键盘', 299.00, 1, '2026-11-02', 'paid'),
(3, '鼠标垫', 29.90, 2, '2026-11-03', 'paid'),
(1, '显示器', 899.00, 1, '2026-11-05', 'paid'),
(2, 'USB线', 19.90, 3, '2026-11-06', 'paid'),
(3, '笔记本', 9.90, 5, '2026-11-07', 'paid'),
(1, '耳机', 199.00, 1, '2026-11-08', 'cancelled'),
(2, '移动硬盘', 459.00, 1, '2026-11-09', 'paid'),
(3, '台灯', 89.00, 1, '2026-11-10', 'paid'),
(1, '键盘膜', 15.90, 2, '2026-11-11', 'paid');

SELECT * FROM orders;

SELECT * FROM orders 
  WHERE amount > 100;

SELECT * FROM orders 
  ORDER BY amount DESC;

SELECT * FROM orders 
  ORDER BY id
  LIMIT 3;

SELECT * FROM orders 
  WHERE product LIKE '%键盘%';

SELECT * FROM orders 
  WHERE order_date BETWEEN '2026-11-01' AND '2026-11-07';


















