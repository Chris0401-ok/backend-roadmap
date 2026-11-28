CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_order_date ON orders(order_date);

SHOW INDEX FROM orders;

-- 第一步：删掉索引
DROP INDEX idx_user_id ON idx_test;
SHOW INDEX FROM idx_test;

-- 第二步：无索引，截图（文件名 explain_before.png）
EXPLAIN SELECT * FROM idx_test WHERE user_id = 2;


-- 第三步：建索引
CREATE INDEX idx_user_id ON idx_test(user_id);

-- 第四步：有索引，截图（文件名 explain_after.png）
EXPLAIN SELECT * FROM idx_test WHERE user_id = 2;


