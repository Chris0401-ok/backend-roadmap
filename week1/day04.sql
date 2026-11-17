每个用户几单、总金额、平均金额（一条 SQL 里写三个聚合）；
SELECT user_id,COUNT(*) AS order_count,
       SUM(amount) AS total_amount,
       AVG(amount) AS average_amount
  FROM orders
  GROUP BY user_id
  ORDER BY user_id;

每个 STATUS 几单、总金额；
SELECT STATUS,COUNT(*) AS status_count,
       SUM(amount) AS total_amount
  FROM orders
  GROUP BY STATUS;


订单数大于等于 2 的用户；
SELECT user_id,COUNT(*) AS order_count
  FROM orders
  GROUP BY user_id
  HAVING COUNT(*) >=2;

总金额大于 500 的用户；
SELECT user_id,SUM(amount) AS total_amount
  FROM orders
  GROUP BY user_id
  HAVING SUM(amount) >500;
  
按用户总金额从高到低排序；
SELECT user_id,SUM(amount) AS total_amount
  FROM orders
  GROUP BY user_id
  ORDER BY SUM(amount) DESC;

按 user_id, STATUS 两个字段分组；
SELECT user_id, STATUS FROM orders
  GROUP BY user_id, STATUS;

已支付订单的总金额和平均金额；
SELECT SUM(amount) AS total_amount,
       AVG(amount) AS average_amount
  FROM orders
  WHERE STATUS = 'paid';


最贵和最便宜的订单金额；
SELECT MAX(amount) AS max_order_amount,
       MIN(amount) AS min_order_amount
  FROM orders;
  
2026-11-01 到 2026-11-07 的订单数和总金额；
SELECT COUNT(*) AS order_count,
       SUM(amount) AS total_amount
  FROM orders
  WHERE order_date BETWEEN '2026-11-01' AND '2026-11-07';


每个用户已支付订单的总金额
SELECT user_id,SUM(amount) AS total_amount,STATUS
  FROM orders
  WHERE STATUS = 'paid'
  GROUP BY user_id;


--   《JOIN 预习》

查每个订单对应的用户名、商品、金额；
SELECT u.name AS 用户名,
       o.product AS 商品,
       o.amount AS 金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  ORDER BY o.id;
  
每个用户几单（带用户名）；
SELECT u.name AS 用户名,
       COUNT(*) AS 订单数
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id, u.name
  ORDER BY 订单数 DESC;
  
每个用户总金额（带用户名），按总金额从高到低
SELECT u.name AS 用户名,
       SUM(o.amount) AS 总金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY 总金额 DESC;








