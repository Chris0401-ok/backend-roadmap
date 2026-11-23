-- 金额高于平均金额的订单（列出 id、product、amount）
SELECT id,product,amount
  FROM orders o
  WHERE amount > (SELECT AVG(amount) FROM orders)
  ORDER BY amount DESC;
  
-- 金额等于最高金额的那一单
SELECT id,product,amount
  FROM orders
  WHERE amount = (SELECT MAX(amount) FROM orders);

-- 买过**“显示器”**的用户名
SELECT NAME
  FROM users 
  WHERE id IN (
    SELECT o.user_id 
      FROM orders o
      JOIN order_items oi ON o.id = oi.order_id
      WHERE oi.product_id IN (SELECT id FROM products
                                WHERE NAME = '显示器')
      );

-- 从来没下过单的用户名
SELECT NAME 
  FROM users 
  WHERE id NOT IN (SELECT user_id FROM orders);

-- 每个用户里，金额高于他自己平均订单金额的订单（相关子查询）
SELECT o.id, o.user_id, o.product, o.amount
FROM orders o
WHERE o.amount > (
    SELECT AVG(o2.amount) FROM orders o2 WHERE o2.user_id = o.user_id
)
ORDER BY o.user_id, o.amount DESC;
  







