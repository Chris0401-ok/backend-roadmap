INSERT INTO orders (user_id, product, amount, quantity, order_date, STATUS)
VALUES (1, '测试订单', 1.00, 1, '2026-11-15', 'paid');

UPDATE orders
  SET STATUS = 'cancelled'
  WHERE product = '测试订单';

SELECT * FROM orders
  WHERE product = '测试订单';
  

UPDATE orders
  SET amount = '2.00'
  WHERE product = '测试订单';

SELECT * FROM orders
  WHERE product = '测试订单';



DELETE FROM orders
  WHERE product = '测试订单';

SELECT * FROM orders
  WHERE product = '测试订单';


SELECT * FROM orders
  WHERE user_id IN (1,2);


SELECT * FROM orders
  WHERE STATUS IN ('paid','cancelled');


SELECT * FROM orders
  WHERE product IS NULL; 

SELECT DISTINCT STATUS
  FROM orders;
  
SELECT DISTINCT user_id
  FROM orders;


SELECT * FROM orders
  WHERE amount BETWEEN '50' AND '300';



--<聚合 + 分组>

SELECT COUNT(*) AS total_orders
  FROM orders;


SELECT COUNT(DISTINCT user_id) AS user_count
  FROM orders;


SELECT SUM(amount) AS total_amount
  FROM orders;


SELECT ROUND(AVG(amount),2) AS average_amount
  FROM orders;


SELECT MAX(amount) AS max_amount, 
       MIN(amount) AS min_amount
  FROM orders;


SELECT user_id,COUNT(*) AS order_count
  FROM orders
  GROUP BY user_id
  ORDER BY user_id;


SELECT user_id,SUM(amount) AS amount_sum
  FROM orders
  GROUP BY user_id
  ORDER BY user_id;
  

SELECT user_id,ROUND(AVG(amount),2) AS amount_avg
  FROM orders
  GROUP BY user_id
  ORDER BY user_id;


SELECT STATUS,
       SUM(amount) AS total_amount,
       COUNT(*) AS order_count
  FROM orders
  GROUP BY STATUS;

SELECT user_id, COUNT(*) AS order_count
  FROM orders
  GROUP BY user_id
  HAVING COUNT(*) > 1;

SELECT user_id,SUM(amount) AS total_amount
  FROM orders
  GROUP BY user_id
  ORDER BY SUM(amount) DESC;


SELECT user_id,STATUS,
       COUNT(*) AS order_count,
       SUM(amount) AS total_amount
  FROM orders
  GROUP BY user_id,STATUS
  ORDER BY user_id,STATUS






























































