-- 有过订单的用户（用 EXISTS）；
SELECT u.name AS 用户名
  FROM users u
  WHERE EXISTS(
    SELECT 1 FROM orders o WHERE u.id = o.user_id
  );

-- 没有订单的用户（用 NOT EXISTS）；
SELECT u.name AS 用户名
  FROM users u
  WHERE NOT EXISTS(
    SELECT 1 FROM orders o WHERE u.id = o.user_id
  );

-- 买过**“配件”**类商品的用户（EXISTS + 多表）；
SELECT u.name AS 用户名
  FROM users u
  WHERE EXISTS(
    SELECT 1 FROM orders o 
    JOIN order_items oi ON o.id = oi.order_id
    JOIN products p ON oi.product_id = p.id
    JOIN categories c ON p.category_id = c.id
    WHERE o.user_id = u.id AND c.name = '配件'
    );

-- 从未买过“数码”类商品的用户（NOT EXISTS）；
SELECT u.name AS 用户名
  FROM users u
  WHERE NOT EXISTS(
    SELECT 1 FROM orders o
    JOIN order_items oi ON o.id = oi.order_id
    JOIN products p ON oi.product_id = p.id
    JOIN categories c ON p.category_id = c.id
    WHERE o.user_id = u.id AND c.name LIKE'数码'
  );

-- 有 cancelled 订单的用户（EXISTS + 条件）
SELECT u.name AS 用户名
  FROM users u
  WHERE EXISTS(
    SELECT 1 
      FROM orders o
      WHERE o.user_id = u.id AND STATUS = 'cancelled'
  );