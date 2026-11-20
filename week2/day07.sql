USE study_db;


-- 商品分类
CREATE TABLE IF NOT EXISTS categories(
  id INT PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(50) NOT NULL
);

-- 商品
CREATE TABLE IF NOT EXISTS products(
  id INT PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category_id INT NOT NULL
);

-- 订单明细
CREATE TABLE IF NOT EXISTS order_items(
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL DEFAULT 1
);


INSERT INTO categories(NAME) VALUES
('图书'),('数码'),('配件');

INSERT INTO products (NAME, price, category_id) VALUES
('MySQL必知必会', 59.90, 1),
('机械键盘', 299.00, 2),
('鼠标垫', 29.90, 3),
('显示器', 899.00, 2),
('USB线', 19.90, 3);


INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 1),
(5, 5, 3);

-- 多表join

每个订单明细对应的：用户、商品、数量
SELECT u.name AS 用户名,
       p.name AS 商品,
       oi.quantity AS 数量
  FROM order_items oi 
  JOIN orders o ON oi.order_id  = o.id
  JOIN users u ON o.id = u.id
  JOIN products p ON oi.product_id = p.id;        
       
每个订单的总金额（单价 × 数量）
SELECT o.id AS order_id,
       SUM(p.price * oi.quantity) AS 总金额
  FROM orders o
  JOIN order_items oi ON o.id = oi.order_id
  JOIN products p ON oi.product_id = p.id
  GROUP BY o.id
  ORDER BY o.id ;

每个分类下有多少种商品
SELECT c.name AS 商品名称,
       COUNT(*) AS 种类
  FROM categories c
  JOIN products p ON c.id = p.category_id
  GROUP BY c.id,c.name;
  
每个用户买了多少件商品
SELECT u.name AS 用户名,
       SUM(oi.quantity) AS 商品数量
  FROM users u
  JOIN orders o ON u.id = o.user_id
  JOIN order_items oi ON o.id = oi.order_id
  GROUP BY u.id,u.name
  ORDER BY u.id;  
  
每个用户买过的总金额
SELECT u.name AS 用户名,
       SUM(p.price * oi.quantity) AS 总金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  JOIN order_items oi ON o.id = oi.order_id
  JOIN products p ON oi.product_id = o.id
  GROUP BY u.id,u.name
  ORDER BY 总金额 DESC;     

每个分类的总销售额
SELECT c.name AS 分类名,
       SUM(p.price * oi.quantity) AS 总销售额
  FROM categories c
  JOIN products p ON c.id = p.category_id
  JOIN order_items oi ON p.id = oi.product_id
  GROUP BY c.id,c.name
  ORDER BY 总销售额 DESC;

