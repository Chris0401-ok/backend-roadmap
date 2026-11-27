-- 建测试表 + 1000 行

USE study_db;

DROP TABLE IF EXISTS idx_test;

CREATE TABLE idx_test (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  STATUS VARCHAR(20) NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  created_at DATE NOT NULL
);

INSERT INTO idx_test (user_id, STATUS, amount, created_at)
SELECT (n % 3) + 1,
       IF(n % 10 = 0, 'cancelled', 'paid'),
       (n % 500) + 1,
       DATE_ADD('2026-01-01', INTERVAL n DAY)
FROM (
  SELECT a.n + b.n*10 + c.n*100 AS n
  FROM (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
        UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
       (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
        UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
       (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
        UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
) t;


SELECT COUNT(*) FROM idx_test;

EXPLAIN SELECT * FROM idx_test WHERE user_id = 2;


CREATE INDEX idx_user_id ON idx_test(user_id);

EXPLAIN SELECT * FROM idx_test WHERE user_id = 2;

CREATE INDEX idx_user_status ON idx_test(user_id, STATUS);

-- 3个实验
-- A：两个条件都用上
EXPLAIN SELECT * FROM idx_test WHERE user_id = 2 AND STATUS = 'paid';

-- B：只用最左列
EXPLAIN SELECT * FROM idx_test WHERE user_id = 2;

-- C：跳过最左列，只用第二列
EXPLAIN SELECT * FROM idx_test WHERE STATUS = 'paid';

SHOW INDEX FROM idx_test;

DROP INDEX idx_user_status ON idx_test;
SHOW INDEX FROM idx_test;

-- 三个“索引失效”的实验（重要）
-- 失效 1：左边模糊
EXPLAIN SELECT * FROM idx_test WHERE STATUS LIKE '%paid%';

-- 失效 2：列上做运算
EXPLAIN SELECT * FROM idx_test WHERE id + 1 = 5;

-- 失效 3：函数包住列
EXPLAIN SELECT * FROM idx_test WHERE DATE(created_at) = '2026-02-01';

EXPLAIN SELECT * FROM idx_test
WHERE created_at >= '2026-02-01' AND created_at < '2026-02-02';



