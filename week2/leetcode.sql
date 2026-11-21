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



