INSERT INTO users (NAME, age, city) VALUES ('赵六', 18, '北京');

所有用户已支付订单数（含 0 单）；
SELECT u.name AS 用户名,
       COUNT(o.id) AS 订单数
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id 
                        AND o.status = 'paid'
  GROUP BY u.id,u.name
  ORDER BY 订单数 DESC;

所有用户已支付订单总金额（含 0，显示 0.00）；
SELECT u.name AS 用户名,
       COALESCE(SUM(o.amount),0) AS 总金额
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id 
                        AND o.status = 'paid'
  GROUP BY u.id,u.name
  ORDER BY 总金额 DESC;

所有用户取消订单数（含 0）；
SELECT u.name AS 用户名,
       COUNT(o.id) AS 订单数
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id 
                        AND o.status = 'cancelled'
  GROUP BY u.id,u.name
  ORDER BY 订单数 DESC;

有订单的用户，按总金额从高到低；
SELECT u.name AS 用户名,
       SUM(o.amount) AS 总金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY 总金额 DESC;
  
订单数 ≥ 2 且总金额 > 500 的用户；
SELECT u.name AS 用户名,
       COUNT(o.id) AS 订单数,
       SUM(o.amount) AS 总金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  HAVING 订单数 >= 2 AND 总金额 > 500
  ORDER BY 总金额 DESC;
  
每个用户最近一次下单日期（没有订单显示 NULL）；
SELECT u.name AS 用户名,
       MAX(o.order_date) AS last_order_date
   FROM users u
   LEFT JOIN orders o ON u.id = o.user_id 
   GROUP BY u.id,u.name
   ORDER BY last_order_date DESC;

金额大于 100 的订单，带用户名；
SELECT u.name AS 用户名,o.product,o.amount
  FROM users u
  JOIN orders o ON u.id = o.user_id   
  WHERE o.amount > 100
  ORDER BY amount DESC;  

每个 STATUS 的订单数，按数量降序
SELECT STATUS,COUNT(*) AS 订单数
  FROM orders
  GROUP BY STATUS
  ORDER BY 订单数 DESC;





































