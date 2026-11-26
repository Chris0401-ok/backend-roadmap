-- 每个用户的订单数（含 0 单的用户）；
SELECT u.name AS 用户名,COUNT(o.id) AS 订单数
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id,u.name;

-- 每个分类的商品数；
SELECT c.name AS 分类名,COUNT(p.id) AS 商品数
FROM categories c
LEFT JOIN products p ON c.id = p.category_id
GROUP BY c.id;

-- 金额最高的那一单：用户名、商品名、金额；
SELECT u.name,o.product,o.amount
FROM users u
JOIN orders o ON u.id = o.user_id
WHERE o.amount IN (SELECT MAX(amount) FROM orders);

-- 买过**“图书”**类商品的用户名；
SELECT DISTINCT u.name AS 用户名
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
JOIN categories c ON p.category_id = c.id
WHERE c.name = '图书';


-- 每个用户的总金额（含 0，显示 0.00）；
SELECT u.name AS 用户名,
       COALESCE(SUM(o.amount),0) AS 总金额
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id,u.name;


-- 用 CASE 统计大额（>300）/ 中额（50–300）/ 小额（<50）各几单；
SELECT
  CASE
    WHEN amount > 300 THEN '大额'
    WHEN amount BETWEEN 50 AND 300 THEN '中额'
    WHEN amount < 50 THEN '小额'
  END AS '档位',
COUNT(id) AS 单数
FROM orders
GROUP BY 档位;

-- 用 UNION ALL 列出 paid 和 cancelled 各几单；
SELECT STATUS,COUNT(*) AS 单数 FROM orders 
WHERE STATUS = 'paid'

UNION ALL

SELECT STATUS,COUNT(*) AS 单数 FROM orders 
WHERE STATUS = 'cancelled';

-- 没有订单明细的订单 id 和金额
SELECT o.id,o.amount
FROM orders o
LEFT JOIN order_items oi ON o.id = oi.order_id
WHERE oi.id IS NULL;











































