-- LeetCode 175. 组合两个表（2026-11-20）
-- 考点：LEFT JOIN 保留没有地址的人
SELECT p.firstName,
       p.lastName,
       a.city,
       a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;


-- LeetCode 181. 超过经理收入的员工（2026-11-21）
-- 考点：同一张表 JOIN 两次（自连接），用 e 和 m 两个别名区分“员工”和“经理”
select e.name as Employee
from employee e
join employee m on e.managerid = m.id
where e.salary > m.salary;


-- LeetCode 182. 查找重复的电子邮箱（2026-11-22）
-- 考点：GROUP BY 分组 + HAVING 过滤聚合结果；WHERE 在分组前执行，不能放 COUNT(*)
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;


-- LeetCode 183. 从不订购的客户（2026-11-23）
-- 考点：LEFT JOIN 找“右表没有匹配”的行；比 NOT IN 更安全（NOT IN 遇到 NULL 会返回空）
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;

-- 等价写法（客户表里没有 NULL 时可用）：
-- SELECT name AS Customers
-- FROM Customers
-- WHERE id NOT IN (SELECT customerId FROM Orders);


-- LeetCode 196. 删除重复的电子邮箱（2026-11-24）
-- 考点：DELETE 也能用 JOIN；p1.id > p2.id 保证只删 id 大的，留下 id 最小的那行
DELETE p1
FROM Person p1
JOIN Person p2
  ON p1.email = p2.email
 AND p1.id > p2.id;

-- 另一种写法（MySQL 不允许 DELETE 子查询直接查同一张表，要先套一层派生表）：
-- DELETE FROM Person
-- WHERE id NOT IN (
--     SELECT id FROM (
--         SELECT MIN(id) AS id FROM Person GROUP BY email
--     ) t
-- );


-- LeetCode 197. 上升的温度（2026-11-25）
-- 考点：同一张表自连接 + DATEDIFF 找“昨天”；DATEDIFF(w1, w2) = 1 表示 w1 比 w2 晚一天
SELECT w1.id
FROM Weather w1
JOIN Weather w2
  ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;


-- LeetCode 595. 大的国家（2026-11-26）
-- 考点：两个独立条件用 OR；写成 AND 会因为“面积大 且 人口多”同时满足而查空
SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;


-- LeetCode 620. 有趣的电影（2026-11-27）
-- 考点：<> 不等于；id % 2 = 1 判奇数；ORDER BY 放最后且要在 % 运算之外
SELECT *
FROM cinema
WHERE description <> 'boring'
  AND id % 2 = 1
ORDER BY rating DESC;


-- LeetCode 627. 变更性别（2026-11-28）
-- 考点：一条 UPDATE + CASE 互换两值；写成两条 UPDATE 会互相覆盖
UPDATE Salary
SET sex = CASE
              WHEN sex = 'm' THEN 'f'
              ELSE 'm'
          END;



