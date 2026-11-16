查所有订单；
SELECT * FROM orders


查金额大于 100 的订单；
SELECT * FROM orders
  WHERE amount > 100;


按金额从高到低，取前 3 条；
SELECT * FROM orders
  ORDER BY amount DESC
  LIMIT 3;


查商品名里带“键盘”的订单；
SELECT * FROM orders
  WHERE product LIKE '%键盘%';
  
查 2026-11-01 到 2026-11-07 的订单；
SELECT * FROM orders
  WHERE order_date BETWEEN '2026-11-01' AND '2026-11-07';

查 user_id 在 (1,3) 的订单；
SELECT * FROM orders
  WHERE user_id BETWEEN '1' AND '3';

查 STATUS 在 ('paid','cancelled') 的订单；
SELECT * FROM orders
  WHERE STATUS IN ('paid','cancelled');

每个用户几单；
SELECT user_id,COUNT(*) AS user_order
  FROM orders
  GROUP BY user_id
  ORDER BY user_id;
  
每个用户总金额；
SELECT user_id,SUM(amount) AS total_amount
  FROM orders
  GROUP BY user_id
  ORDER BY user_id;


























































