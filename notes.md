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
