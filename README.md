# backend-roadmap

2026.11.13 开始，目标：Python 后端 + AI 应用。

先拿 8-10k 入行，12k 是冲刺目标。计划见本地《后端上岸作战地图 v2》。

## 进度

- [x] **Week 1**（11.13–11.19）：建库建表、CRUD、单表查询、聚合、JOIN 入门
- [x] **Week 2**（11.20–11.26）：5 表体系、多表 JOIN、子查询、EXISTS、UNION / CASE、外键
- [ ] Week 3（11.27–12.3）：索引 + 事务
- [ ] Week 4（12.4–12.10）：Python + pymysql
- [ ] Week 5（12.11–12.17）：整合 + 限时测试

## 目录结构

```
backend-roadmap/
├── notes.md                  # 每日笔记 + 每周复盘
├── week1/
│   ├── day01.sql             # 建库建表、基础查询
│   ├── day02.sql             # UPDATE/DELETE/NULL/IN/DISTINCT、聚合
│   ├── day03.sql             # 限时测试 10 条
│   ├── day04.sql             # 聚合加练 + JOIN 预习
│   ├── day05.sql             # JOIN + LEFT JOIN 练习
│   └── day06.sql             # ON vs WHERE + 混合查询
└── week2/
    ├── day07.sql             # 5 张表 + 6 条多表 JOIN
    ├── day08.sql             # 9 条 JOIN 加练 + 4 个外键
    ├── day09.sql             # 5 条子查询
    ├── day10.sql             # 5 条 EXISTS / NOT EXISTS
    ├── day11.sql             # UNION / CASE
    ├── day12.sql             # Week 2 限时测试（8 条，7 对）
    ├── er.png                # 5 表 ER 图
    └── leetcode.sql          # LeetCode SQL 50 题解（175–197）
```

## 数据库

库名 `study_db`，5 张表：

| 表 | 说明 | 关键字段 |
|---|---|---|
| `users` | 用户 | id, name, age, city |
| `orders` | 订单 | id, user_id, product, amount, quantity, order_date, status |
| `order_items` | 订单明细 | id, order_id, product_id, quantity |
| `products` | 商品 | id, name, price, category_id |
| `categories` | 分类 | id, name |

表关系：

```
users 1 ──< orders 1 ──< order_items >── products >── categories
```

外键 4 个：`orders.user_id`、`order_items.order_id`、`order_items.product_id`、`products.category_id`。

## LeetCode SQL 50 进度

| 题号 | 题名 | 考点 |
|---:|---|---|
| 175 | 组合两个表 | LEFT JOIN |
| 181 | 超过经理收入的员工 | 自连接 |
| 182 | 查找重复的电子邮箱 | GROUP BY + HAVING |
| 183 | 从不订购的客户 | LEFT JOIN + IS NULL |
| 196 | 删除重复的电子邮箱 | DELETE + JOIN |
| 197 | 上升的温度 | 自连接 + DATEDIFF |

## 学到的东西

- `ON` 决定“两张表怎么连”，`WHERE` 决定“连完留哪些行”；`LEFT JOIN` 的右表条件写进 `WHERE` 会退化成 `INNER JOIN`
- `LEFT JOIN` 统计数量用 `COUNT(右表.id)`，不能用 `COUNT(*)`
- 子查询三种：标量、`IN`、相关子查询（内层引用外层字段）
- `NOT IN` 遇到 `NULL` 返回空 → 优先 `NOT EXISTS`
- `UNION` 去重且慢，`UNION ALL` 不去重且快
- `SUM(CASE WHEN 条件 THEN 1 ELSE 0 END)` 做条件计数，`ELSE 0` 不能省
- 查询不出结果时，先 `SELECT COUNT(*)` 确认数据，再怀疑 SQL