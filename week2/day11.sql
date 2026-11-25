-- 用 UNION 把“金额 ≥ 500 的订单”和“cancelled 的订单”合并列出；
SELECT * FROM orders
  WHERE amount >= 500
  
UNION

SELECT * FROM orders
  WHERE STATUS = 'cancelled';

-- 用 UNION ALL 统计 paid 和 cancelled 各几单；
SELECT 'paid' AS STATUS,COUNT(*) AS cnt
FROM orders
WHERE STATUS = 'paid'

UNION ALL

SELECT 'cancelled' AS STATUS ,COUNT(*) AS cnt
FROM orders
WHERE STATUS = 'cancelled';

-- 用 CASE 给每单打标签：< 50 小额、50–300 中额、> 300 大额；
SELECT id,product,amount,
  CASE
    WHEN amount < 50 THEN '小额'
    WHEN amount BETWEEN 50 AND 300 THEN '中额'
    ELSE '大额'
  END AS '等级'
  FROM orders
  ORDER BY id;

-- 用 CASE + 聚合，统计每个用户“已支付 / 已取消”各几单。
SELECT u.name AS 用户名,
       SUM(CASE WHEN o.status = 'paid' THEN 1 ELSE 0 END) AS paid_cnt,
       SUM(CASE WHEN o.status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_cnt
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY u.id;



















































