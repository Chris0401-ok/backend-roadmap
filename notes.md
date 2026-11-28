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
- [x] 181 超过经理收入的员工（自连接）
- [x] 182 查找重复的电子邮箱（GROUP BY + HAVING）
- [x] 183 从不订购的客户（LEFT JOIN + IS NULL）
- [x] 196 删除重复的电子邮箱
- [x] 197 上升的温度（日期 + 自连接）
- [x] 595 大的国家（OR）
- [x] 620 有趣的电影（取模 + ORDER BY）
- [x] 627 变更性别（UPDATE + CASE）
- 176、177、178、180 是中等/窗口函数，等 Week 3 学完再回来做


## 2026-11-21（周六）

### 今天学了
- 9 条多表 JOIN 加练：用户订单数、商品销量、商品销售额、分类商品数与均价、
  买过某分类的用户、订单数 Top N、订单明细小计、无明细订单、最近一单商品
- LEFT JOIN 统计数量要用 `COUNT(o.id)`，不能用 `COUNT(*)`，否则没匹配的行会被算成 1
- 5 张表 ER 图：users→orders→order_items←products←categories
- LeetCode 181：同一张表 JOIN 两次（自连接）

### 踩的坑
- "每个用户最近一次下单的商品名"查出 0 行：订单 6–10 没有 order_items 明细，
  三个人的最近一单都没明细，JOIN 后全被过滤；
  补了 3 条明细（订单 8、9、10）后正常。
  教训：查不出结果先 `SELECT COUNT(*)` 确认数据，再怀疑 SQL。
- ER 图第一次导出把新旧两张图叠在一起（旧图还有 email、order_time 这些不存在的字段），
  重导后只留 5 张表。
- 中文说明又忘了加 `--`，整段执行报错 1064。

### 明天（2026-11-22 周日）
- 给 5 张表补 4 个外键约束
- LeetCode 182
- 重导 ER 图
- 周日复盘


## 2026-11-22（周日）

### 今天完成
- 给 5 张表补了 4 个外键：orders.user_id、order_items.order_id、
  order_items.product_id、products.category_id，用 information_schema 验证到 4 行
- LeetCode 182：GROUP BY + HAVING COUNT(*) > 1
- ER 图重导，只保留 5 张表
- 本周复盘（见下）

### 踩的坑
- 外键要先建主表再建从表，否则报 1215/1452
- `HAVING` 里才能放聚合函数，`WHERE COUNT(*) > 1` 会报错

### 档位
本周：标准档（实际约 8 小时）
下周：标准档（7–8 小时）
理由：正常上课 + 兼职约 5 小时 + 健身 4 次，没有整块时间；
本档已完成 Week 2 前半段，不需要冲刺档。

### 本周复盘
1. 实际学了几小时？约 8 小时。
2. 交出了什么？
   - 11.16 限时测试 10 条：10/10
   - 11.17 聚合加练 10 条：10/10
   - 11.18 10 条 JOIN + 8 条 LEFT JOIN
   - 11.19 8 条混合查询，搞懂 ON / WHERE
   - 11.20 5 张表体系 + 6 条多表 JOIN + LeetCode 175
   - 11.21 9 条 JOIN + 5 表 ER 图 + LeetCode 181
   - 11.22 4 个外键 + LeetCode 182 + ER 图重导
   - GitHub：day01–day08 已提交
3. 卡在哪？都是小问题，已全部解决：
   - LEFT JOIN 右表条件写 WHERE 会退化成 INNER JOIN
   - 多表 JOIN 的 ON 写错关联字段
   - 中文说明没加 `--`
   - order_items 误插进 orders，多出 id=11 脏数据
   - 订单 6–10 缺明细导致查空
   - ER 图导出残留旧图
4. 下周最重要的一件事？
   按文档推进：11.26 前完成 Week 2 全部（子查询、UNION、限时 8 条），
   11.27 进入 Week 3 索引与事务。不额外加任务，也不拖进度。

### 明天（2026-11-23 周一）
- 子查询：`WHERE amount > (SELECT AVG(...))`，写 5 条，存 `week2/day09.sql`
- LeetCode 183 从不订购的客户
- Commit + Push


## 2026-11-23（周一）

### 今天学了
- 子查询三种用法：
  1. 标量子查询：`WHERE amount > (SELECT AVG(amount) FROM orders)`
  2. IN 子查询：`WHERE id IN (SELECT user_id FROM orders ...)`
  3. 相关子查询：内层引用外层字段 `o.user_id`，外层每行重算一次
- 相关子查询的典型场景：比"自己所在分组"的平均值高
  `WHERE o.amount > (SELECT AVG(o2.amount) FROM orders o2 WHERE o2.user_id = o.user_id)`
- `NOT IN` 与 `NULL` 的坑：子查询结果里有 NULL 时，整个 NOT IN 返回空
- LeetCode 183：找"右表没有匹配"用 `LEFT JOIN ... WHERE 右表.id IS NULL`

### 今天完成
- `week2/day09.sql`：5 条子查询
  1. 高于平均金额的订单 → 3 行（899、459、299）
  2. 等于最高金额的一单 → 1 行（899）
  3. 买过"显示器"的用户 → 2 行（张三、李四）
  4. 从没下过单的用户 → 0 行（三个用户都有单）
  5. 高于自己均价的订单 → 4 行
- `week2/leetcode.sql`：追加 183（LEFT JOIN 版 + NOT IN 版注释）

### 明天（2026-11-24 周二）
- 子查询进阶：`EXISTS` / `NOT EXISTS`，写 5 条，存 `week2/day10.sql`
- LeetCode 196 删除重复的电子邮箱
- Commit + Push


## 2026-11-24（周二）

### 今天学了
- `EXISTS` / `NOT EXISTS`：只判断子查询"有没有返回行"，不关心返回什么，
  所以子查询里写 `SELECT 1` 就够，不用 `SELECT *`
- 相关子查询必须把外层字段写进内层：`WHERE o.user_id = u.id`，
  漏掉就变成全表判断，结果全错
- `EXISTS` 和 `IN` 怎么选：
  - 子查询结果集小 → 用 `IN`
  - 外层表小、子查询表大 → 用 `EXISTS`（找到一条就停）
  - 涉及 `NULL` → 用 `NOT EXISTS`（`NOT IN` 遇 NULL 会返回空）
- `DELETE` 也能用 `JOIN`：
  `DELETE p1 FROM Person p1 JOIN Person p2 ON p1.email = p2.email AND p1.id > p2.id`
  靠 `p1.id > p2.id` 保证留下 id 最小的那行

### 今天完成
- `week2/day10.sql`：5 条 EXISTS / NOT EXISTS
  1. 有过订单的用户 → 3 行（张三、李四、王五）
  2. 没有订单的用户 → 0 行
  3. 买过"配件"类商品的用户 → 2 行（李四、王五）
  4. 从未买过"数码"类商品的用户 → 1 行（王五）
  5. 有 cancelled 订单的用户 → 1 行（张三）
- `week2/leetcode.sql`：追加 196（DELETE + JOIN 写法）

### 踩的坑
- 第 4 条写成 `c.name LIKE'数码'`：没加通配符时 `LIKE` 等价于 `=`，
  这次结果对，但 `LIKE` 本意是模糊匹配，精确比较应该直接用 `=`
- 5 条注释都加了 `--`，前几次的错没再犯

### 明天（2026-11-25 周三）
- `UNION` / `CASE`，写 4 条，存 `week2/day11.sql`
- LeetCode 197 上升的温度
- Commit + Push


## 2026-11-25（周三）

### 今天学了
- `UNION` / `UNION ALL`：
  - `UNION` 会去重（要排序，慢）；`UNION ALL` 不去重（快）
  - 能确定没有重复时，一律用 `UNION ALL`
  - 两段 `SELECT` 的列数必须相同，列名以第一段为准
  - `ORDER BY` 只能写在最后一段
- `CASE WHEN ... THEN ... ELSE ... END`：
  - 从上往下匹配，第一个成立就停，所以范围小的要写在前面
  - `< 50` 必须写在 `BETWEEN 50 AND 300` 前面
- `CASE` + 聚合：`SUM(CASE WHEN 条件 THEN 1 ELSE 0 END)` 做条件计数
  - `ELSE 0` 不能省，否则不满足条件返回 NULL，整组 SUM 变 NULL
  - 等价写法：`COUNT(CASE WHEN 条件 THEN 1 END)`
- LeetCode 197：同一张表自连接 + `DATEDIFF(w1, w2) = 1` 找"昨天"

### 今天完成
- `week2/day11.sql`：4 条 UNION / CASE
  1. UNION 合并"金额 ≥ 500"和"cancelled" → 2 行（订单 4、7）
  2. UNION ALL 统计状态单数 → paid 9、cancelled 1
  3. CASE 打标签 → 小额 4、中额 4、大额 2
  4. CASE + 聚合 → 张三 3/1、李四 3/0、王五 3/0
- `week2/leetcode.sql`：追加 197（自连接 + DATEDIFF）

### 踩的坑
- 第 1 条用了 `SELECT *`：两段列数和顺序一致才能 UNION，
  表结构一改就会报错，规范写法是把列名都写出来
- 4 条注释都加了 `--`，连续两天没再犯

### 明天（2026-11-26 周四）
- Week 2 收尾：限时 30 分钟，从空白写 8 条（JOIN + 子查询 + CASE）
- LeetCode 595 大的国家
- 更新 README，Week 2 结束检查


## 2026-11-26（周四）· Week 2 收尾

### 限时测试结果
闭卷 30 分钟，8 条：**7 对 1 错**。
错的：第 6 题（CASE 统计金额档位）。

### 今天学了
- `GROUP BY` 写成 `GROUP BY 档位`（用 SELECT 里的别名）MySQL 能跑，
  但标准 SQL 要在 `GROUP BY` 里重复整个 `CASE` 表达式，换数据库就报错
- `CASE` 没有 `ELSE` 时，不满足任何 `WHEN` 的行返回 `NULL`，
  会单独聚成一组 `NULL`；这次数据刚好全覆盖，所以没暴露
- 分组统计后一定加 `ORDER BY`，否则行的顺序是随机的，
  和预期结果“看起来不一样”，容易被误判为写错
- LeetCode 595：两个独立条件用 `OR`，写成 `AND` 会查空

### 第 6 题的正确写法

```sql
SELECT
  CASE
    WHEN amount > 300 THEN '大额'
    WHEN amount BETWEEN 50 AND 300 THEN '中额'
    ELSE '小额'
  END AS 档位,
  COUNT(*) AS cnt
FROM orders
GROUP BY 档位
ORDER BY cnt DESC;
```

预期 3 行：中额 4、小额 4、大额 2

### 今天完成
- `week2/day12.sql`：限时 8 条
- `week2/leetcode.sql`：追加 595
- `README.md`：补 Week 2 进度、目录、5 表说明、LeetCode 清单

### Week 2 结束检查
- [x] 15 条 JOIN 能写出来（day07 六条 + day08 九条）
- [x] 5 表 ER 图（er.png）
- [x] 4 个外键
- [x] LeetCode 175 / 181 / 182 / 183 / 196 / 197 / 595
- [x] README 更新
- [ ] 第 6 题重写一遍（明天开始前 5 分钟做）

### 明天（2026-11-27 周五）
- Week 3 开始：索引概念、创建/删除索引、复合索引、最左前缀
- 存 `week3/day13.sql`
- LeetCode 620 有趣的电影


## 2026-11-27（周五）· Week 3 第 1 天

### 今天学了
- 索引 = 书的目录：不扫全表，先查目录再定位行
- `EXPLAIN` 看三个关键列：
  - `type`：`ALL` = 全表扫；`ref` = 走索引
  - `key`：实际用了哪个索引，`NULL` = 没用索引
  - `rows`：预计扫描行数
- **小表看不出索引效果**：几十行时优化器直接全表扫，
  必须造 1000 行以上（今天建了 `idx_test` 灌 1000 行）
- 复合索引 `(user_id, status)` 遵循**最左前缀**：
  - `WHERE user_id = ? AND status = ?` → 用得上
  - `WHERE user_id = ?` → 用得上
  - `WHERE status = ?` → **用不上**，因为跳过最左列
- 三种索引失效：
  1. 左边模糊 `LIKE '%paid%'`
  2. 索引列上做运算 `id + 1 = 5`
  3. 函数包住索引列 `DATE(created_at) = ...`
  → 第 3 种改写成范围查询就能用上索引
- 索引不是越多越好：每个索引都会拖慢 `INSERT/UPDATE`，还占空间

### 今天完成
- `week3/day13.sql`：
  - 建 `idx_test` 灌 1000 行
  - 无索引 → 建 `idx_user_id` → 再 EXPLAIN 对比
  - 复合索引 `idx_user_status` + 最左前缀 3 个实验
  - `SHOW INDEX` / `DROP INDEX`
  - 3 个索引失效实验 + 改写验证
- `week2/leetcode.sql`：追加 620

### 关键预期结果（记下来，明天加真实索引时对照）
| 场景 | type | key |
|---|---|---|
| 无索引 WHERE user_id | ALL | NULL |
| 有 idx_user_id | ref | idx_user_id |
| 复合索引 + 两个条件 | ref | idx_user_status |
| 复合索引 + 只用 status | ALL | NULL |
| LIKE '%paid%' | ALL | NULL |
| id + 1 = 5 | ALL | NULL |

### 踩的坑
- 索引第一天最容易的错觉：以为建了索引就一定走索引，
  实际优化器有成本判断，小表宁可全表扫

### 明天（2026-11-28 周六）
- 给 `orders.user_id`、`orders.created_at` 加索引
- 用 `EXPLAIN` 对比加索引前后，截图存 `week3/explain.md`
- LeetCode 627 变更性别
- Commit + Push


## 2026-11-28（周六）· Week 3 第 2 天

### 今天学了
- `EXPLAIN` 判断有没有走索引，只看两列：`type` 是不是 `ALL`、`key` 是不是 `NULL`
- 加索引前后实测（`idx_test` 1000 行，`WHERE user_id = 2`）：
  | 指标 | 加索引前 | 加索引后 |
  |---|---|---|
  | type | ALL | ref |
  | key | NULL | idx_user_id |
  | rows | 1000 | 333 |
  | filtered | 10.00 | 100.00 |
- `key_len = 4` 表示索引用了一个 INT 字段（4 字节）
- `ref = const` 表示条件里是常量，直接拿常量去索引里定位
- `filtered = 100.00` 表示索引定位出来的行全部满足条件，不用二次过滤
- 小表（10 行的 `orders`）加索引也看不出效果，优化器会直接全表扫
- 索引有代价：占磁盘 + 拖慢 `INSERT/UPDATE/DELETE`

### 今天完成
- `week3/day14.sql`：给 `orders` 加了 `idx_orders_user_id`、`idx_orders_order_date` 两个索引
- `week3/explain_before_small.png`、`week3/explain_after_small.png`：两张 EXPLAIN 截图
  （原图各 6 MB，裁到结果区 + 压成调色板 PNG，降到 56 KB / 63 KB）
- `week3/explain.md`：截图 + 前后字段对照表 + 自己的解释 + 三种索引失效写法
- `week2/leetcode.sql`：追加 627

### 踩的坑
- 截图文件各 6 MB，仓库会变大；后续截图只截结果区再压缩
- 图片不能打包成 zip 交给仓库：Markdown 显示不出来，面试官也不会解压
- 判断索引有没有生效，不只看“建了没有”，而是要看 `EXPLAIN` 的 `key`

### 明天（2026-11-29 周日）
- 事务：ACID、`START TRANSACTION` / `COMMIT` / `ROLLBACK`
- 写“转账”事务，演示回滚 → `week3/day15.sql`
- LeetCode 596 超过 5 名学生的课
- 周日复盘
