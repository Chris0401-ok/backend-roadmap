-- Day 8：多表 JOIN 加练（2026-11-21）
USE study_db;

每个用户的订单数（用 COUNT(o.id)）
SELECT u.name AS 用户名,
       COUNT(o.id) AS 订单数
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY u.id;

每个商品的销量
SELECT p.name AS 商品名,
       SUM(oi.quantity) as销售数量
  FROM products p
  LEFT JOIN order_items oi ON p.id = oi.product_id
  GROUP BY p.id,p.name
  ORDER BY p.id;     

每个商品的销售额
SELECT p.name AS 商品名,
       SUM(p.price * oi.quantity) AS 销售额
  FROM products p 
  LEFT JOIN order_items oi ON p.id = oi.product_id
  GROUP BY p.id,p.name
  ORDER BY 销售额 DESC;

每个分类的商品数 + 平均价
SELECT c.name AS 分类名,
       COUNT(p.id) AS 商品数,
       ROUND(AVG(p.price),2) AS 平均价
  FROM categories c
  JOIN products p ON c.id = p.category_id
  GROUP BY c.id,c.name;

买过“数码”类商品的用户
SELECT DISTINCT u.name AS 用户名
  FROM users u
  JOIN orders o ON u.id = o.user_id
  JOIN order_items oi ON o.id = oi.order_id
  JOIN products p ON oi.product_id = p.id
  JOIN categories c ON p.category_id = c.id
  WHERE c.name = '数码';

订单数前 3 的用户
SELECT u.name AS 用户名,
       COUNT(o.id) AS 订单数
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  LIMIT 3;

每个订单的明细（含小计）
SELECT o.id AS order_id,
       p.name AS 商品名,
       oi.quantity,
       p.price * oi.quantity AS subtotal
  FROM orders o
  JOIN order_items oi ON o.id = oi.order_id
  JOIN products p ON oi.product_id = p.id
  ORDER BY o.id;

没有明细的订单
SELECT o.id AS order_id,
       o.amount
  FROM orders o
  LEFT JOIN order_items oi ON o.id = oi.order_id
  WHERE oi.id IS NULL;  

每个用户最近一次下单的商品名（做不出就写注释跳过）
SELECT u.name, p.name AS last_product, o.order_date
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE o.order_date = (
    SELECT MAX(o2.order_date) FROM orders o2 WHERE o2.user_id = u.id
)
ORDER BY u.name;

SELECT o.id, o.user_id, o.product, o.order_date,
       COUNT(oi.id) AS item_count
FROM orders o
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY o.id, o.user_id, o.product, o.order_date
ORDER BY o.id;


-- 给最近订单补明细
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(8, 4, 1),   -- 李四 · 显示器
(9, 3, 1),   -- 王五 · 鼠标垫
(10, 1, 1);  -- 张三 · MySQL必知必会






































