# Week 1 笔记

## 2026-11-13

### 今天学了
- 建库、建表、INSERT、SELECT，github建仓库---->git
- WHERE、ORDER BY、LIMIT、LIKE、BETWEEN...AND...
- SQLZoo刷了select专题的习题

### 踩的坑
- `INSERT` 最后一行用了逗号，导致后面的 `SELECT` 报语法错误 1064。
- 解决：最后一行数据后面用分号 `;`，SQL 语句之间用分号隔开

- 'BETWEEN...AND...' 查询日期间隔的时候 日期条件没有用单引号括上导致查询不出结果
- 解决：加上条件日期的单引号

### 明天
- 加练 UPDATE/DELETE、NULL/IN/DISTINCT、聚合查询；复习 10 条查询。



## 2026-11-15
### 今天学了
- SQL查询语句的使用方法：UPDATE/DELETE/NULL/IN/DISTINCT + 聚合查询（COUNT/SUM/AVG/GROUP BY/HAVING）
- SQLZoo刷了专题的习题

### 踩的坑
- select选择的多个对象多加 逗号 导致报语法错误 1064
- 解决：删除多余逗号---->注意一下
 
### 明天
- 复盘 + 10 条限时测试


## 2026-11-16
### 今天学了
- SQL查询语句的复习 聚合函数的使用
- SQLZoo刷了sum+count的习题
- 10 条限时测试：10/10 全对

### 踩的坑
-  WHERE 里不能直接使用聚合函数作为条件，要用的话用having
- Having和Where的区别：
- WHERE（分组前过滤）：在数据分组和计算聚合函数之前执行。此时 SUM() 还没算出来，所以 WHERE 后面不能写 SUM(area) > 15000000

- HAVING（分组后过滤）：在数据分组并计算完聚合函数之后执行。所以它专门用来对 SUM()、COUNT() 等聚合后的结果进行过滤
 
### 明天（2026-11-17 周二）
- 今天 10/10，单表查询和聚合已过关，不再复盘错题
- 加练 10 条聚合查询，限时完成，重点练 GROUP BY + HAVING + ORDER BY 聚合结果
- 预习 INNER JOIN：理解“两张表通过 id 关联”，写 3 条简单 JOIN
- SQLZoo：SUM and COUNT 剩余题目，做完对答案
- 新建 `week1/day04.sql`，保存后 Commit + Push


## 2026-11-17
### 今天学了
- SQL查询语句的复习 聚合函数的使用
- 加练 10 条聚合查询测试：10/10 全对
- SQLZoo刷了sum+count的剩余习题
- 预习 INNER JOIN：理解“两张表通过 id 关联”，写了 3 条简单 JOIN
- 表别名：`users u`、`orders o`

### 踩的坑
- ORDER BY、GROUP BY、WHERE的顺序写错导致报错
- 解决：ORDER BY 要放在 GROUOP BY后面；WHERE放在FROM后GROUOP BY前
- 注意：SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT
 
### 明天（2026-11-18 周三）
- 10 条 JOIN 加练：JOIN + GROUP BY + HAVING + ORDER BY
- 预习 LEFT JOIN：保留左表所有行，右表没有匹配就是 NULL
- SQLZoo `JOIN` 章节做 2-3 题
- 新建 `week1/day05.sql`，保存后 Commit + Push


## 2026-11-18
### 今天学了
- SQL的内连接复习 10条语句 ，left join 8条语句全部自己独立完成
- SQLZoo刷了专项习题
- 看了20分钟b站尚硅谷数据库视频

### 踩的坑
- 条件写在where中导致输出结果不符合题目要求
- 解决：写在 on 中
- 注意：ON 和 WHERE区别：
- ON 决定“两张表怎么连起来”（包括连哪些行）；WHERE 决定“连完以后留下哪些行”
- INNER JOIN 里两者结果一样，只有 LEFT JOIN 时差别才暴露
 
### 明天（2026-11-19 周四）
- 混合查询
- 更新notes.md
- SQLZoo 刷对应习题
- 新建 `week1/day06.sql`，保存后 Commit + Push



## 2026-11-19

### 今天学了
- 复习ON 和 WHERE 的区别：ON 决定怎么连，WHERE 决定连完留哪些行
- LEFT JOIN + WHERE 过滤右表会使结果退化成 INNER JOIN
- 要保留左表所有行，右表条件必须写 在ON

### 踩的坑
- 把 LEFT JOIN 的右表条件写到 WHERE，导致“应该显示 0”的行消失

### 明天（2026-11-20 周五）
- Week 2 开始：多表 JOIN（5 张表）
- 新建 day07.sql



## 2026-11-20（Week 2 第 1 天）

### 今天学了
- 建了 3 张新表：categories、products、order_items，加上 users、orders 共 5 张表
- 表关系：users.id → orders.user_id；orders.id → order_items.order_id；
  products.id → order_items.product_id；categories.id → products.category_id
- 三表/四表 JOIN：从哪张表出发，就顺着外键一张张接
- 金额必须用明细算：SUM(p.price * oi.quantity)，不能用 orders.amount 直接乘
- 开始刷 LeetCode SQL 50，完成了 175 ：组合两个表

### 今天完成
- `week2/day07.sql`：建表 + 插数据 + 6 条多表 JOIN
- `week2/leetcode.sql`：LeetCode 175

### 踩的坑
- 多表 JOIN 的 ON 条件写错表之间的关系：
  错：`JOIN products p ON oi.order_id = p.id`
  对：`JOIN products p ON oi.product_id = p.id`
  原因：order_items 里关联商品的是 product_id，不是 order_id

- SQL 文件里中文说明没加 `--` 注释符，整段执行会报语法错误
  解决：说明写成 `-- 每个订单的总金额（单价 × 数量）`

- 疑问：为什么不直接用 `orders.amount * orders.quantity`？
  答：orders 是"一单一行"，amount 已是整单总价；
  一单买多个商品时，orders 里没有每个商品的单价和数量，
  只能靠 order_items + products 逐条算，再加总

### SQL 执行顺序（已记住）
SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT

### 明天（2026-11-21 周六）
- 造一个"一单两件商品"的订单，验证 orders.amount 和明细算出来的金额对不上
- LeetCode：每天 1 题 → 181 超过经理收入的员工（自连接）
- SQLZoo More JOIN
- 新建 `week2/day08.sql`，保存后 Commit + Push

### LeetCode 刷题顺序（每天 1 题，不要一次刷多题）
- [x] 175 组合两个表（LEFT JOIN）
- [ ] 181 超过经理收入的员工（自连接）
- [ ] 182 查找重复的电子邮箱（GROUP BY + HAVING）
- [ ] 183 从不订购的客户（LEFT JOIN + IS NULL）
- [ ] 196 删除重复的电子邮箱
- [ ] 197 上升的温度（日期 + 自连接）
- 176、177、178、180 是中等/窗口函数，等 Week 3 学完再回来做
