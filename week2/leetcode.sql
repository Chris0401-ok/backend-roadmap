-- LeetCode 175. 组合两个表（2026-11-20）
-- 考点：LEFT JOIN 保留没有地址的人
SELECT p.firstName,
       p.lastName,
       a.city,
       a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;





