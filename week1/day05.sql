每个订单对应的用户名、商品、金额；
SELECT u.name AS 用户名,
       o.product AS 商品,
       o.amount AS 金额
  FROM users u
  JOIN orders o ON u.id = o.user_id;

每个用户几单；
SELECT u.name AS 用户名,
       COUNT(*) AS 订单数
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY 订单数 DESC;
  
每个用户总金额；
SELECT u.name AS 用户名,
       SUM(o.amount) AS 总金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY 总金额 DESC;

每个用户平均金额；
SELECT u.name AS 用户名,
       ROUND(AVG(o.amount),2) AS 平均金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY 平均金额 DESC;
       
每个用户已支付订单的总金额；
SELECT u.name AS 用户名,
       SUM(o.amount) AS 总金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  WHERE o.status = 'paid'
  GROUP BY u.id,u.name
  ORDER BY 总金额 DESC;

每个 STATUS 几单、总金额；
SELECT o.status,
       COUNT(*) AS 单量,
       SUM(o.amount) AS 总金额
  FROM orders o
  GROUP BY o.status
  ORDER BY 总金额 DESC;

金额大于 100 的订单，带用户名；
SELECT u.name AS 用户名,
       o.product AS 订单名,
       o.amount AS 订单金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  WHERE o.amount > 100
  ORDER BY 订单金额 DESC;

订单数大于等于 2 的用户；
SELECT u.name AS 用户名,
       COUNT(*) AS 单量
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  HAVING 单量 > 2
  ORDER BY 单量 DESC;     

总金额大于 500 的用户；
SELECT u.name AS 用户名,
       SUM(o.amount) AS 总金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  HAVING 总金额 > 500
  ORDER BY 总金额 DESC;

按总金额从高到低，取前 2 名
SELECT u.name AS 用户名,
       SUM(o.amount) AS 总金额
  FROM users u
  JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  LIMIT 2;


--  外连接- left join
INSERT INTO users (NAME, age, city)
VALUES ('赵六', 18, '北京');

所有用户几单，包括 0 单；
SELECT u.name AS 用户名,
       COUNT(o.id) AS 单量
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY 单量 DESC;  

所有用户总金额，没有订单显示 0；
SELECT u.name AS 用户名,
       COALESCE(SUM(o.amount),0) AS 总金额
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY 总金额 DESC;  

没有下过单的用户。
SELECT u.name AS 用户名
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id
  WHERE o.id IS NULL;

所有用户已支付订单数，包括 0
SELECT u.name AS 用户名,
       COUNT(o.id) AS 订单数
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id AND o.status = 'paid'
  GROUP BY u.id,u.name
  ORDER BY 订单数 DESC;

所有用户取消订单数，包括 0
SELECT u.name AS 用户名,
       COUNT(o.id) AS 订单数
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id AND o.status = 'cancelled'
  GROUP BY u.id,u.name
  ORDER BY 订单数 DESC;

所有用户最近一次下单日期
SELECT u.name AS 用户名,
       MAX(o.order_date) AS last_order_date
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY last_order_date DESC;

所有用户的最小/最大订单金额
SELECT u.name AS 用户名,
       MAX(o.amount) AS 最大订单金额,
       MIN(o.amount) AS 最小订单金额
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY u.name;
     
所有用户平均金额，没有订单显示 NULL
SELECT u.name AS 用户名,
       ROUND(AVG(o.amount),2) AS 平均金额
  FROM users u
  LEFT JOIN orders o ON u.id = o.user_id
  GROUP BY u.id,u.name
  ORDER BY 平均金额 DESC;

DELETE FROM users WHERE NAME = '赵六';

SELECT * FROM users;
