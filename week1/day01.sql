-- Day 1：建库、建表、插入数据、基础查询
-- 日期：2026-11-13
-- 注意：重复执行 INSERT 会重复插入；练习前可先执行 TRUNCATE TABLE users;

-- 1. 建库
CREATE DATABASE IF NOT EXISTS study_db
  DEFAULT CHARACTER SET utf8mb4;

USE study_db;

-- 2. 建表
CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  age INT,
  city VARCHAR(50),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3. 插入 3 条测试数据
INSERT INTO users (name, age, city) VALUES
('张三', 16, '北京'),
('李四', 17, '河北'),
('王五', 20, '天津');

-- 4. 基础查询
SELECT * FROM users;

SELECT name, age
FROM users
WHERE age >= 20;

SELECT *
FROM users
ORDER BY age DESC;

SELECT *
FROM users
WHERE city LIKE '%大%';

SELECT COUNT(*) AS total_users
FROM users;
