# 📘 SQL Practice: Joins, CTEs, Window Functions, Indexing, Pagination

This project contains a complete SQL practice file covering essential concepts using one single script file.

---

## 📁 File Structure
📦 sql-practice/
├── README.md ← This file
└── Implementation.sql ← Table setup + data + all queries

---


---

## ✅ What’s Inside `Implementation.sql`?

### 1. 🔨 Table Setup
- `CREATE TABLE employees(...)`
- `CREATE TABLE departments(...)`

### 2. 📥 Data Insertion
- Sample rows for employees and departments

### 3. 📌 Query Tasks:
- `INNER`, `LEFT`, `RIGHT`, and `FULL OUTER JOIN` (simulated in MySQL)
- `CTE` using `WITH` to simplify nested queries
- `RANK()` + `PARTITION BY` for per-department salary ranking
- Indexing with `CREATE INDEX` and `EXPLAIN`
- Pagination using `LIMIT` and `OFFSET`

---

## 🚀 How to Use

1. Open your SQL client (MySQL Workbench, DBeaver, etc.)
2. Load the file: `Implementation.sql`
3. Run queries step by step, or all at once

---

## 🎯 Learning Goals

- Practice SQL joins in different combinations
- Understand how CTEs clean up complex logic
- Learn how window functions work on row groups
- Measure performance benefits of indexing
- Use pagination in real UI-backed SQL queries

---

## 💡 Notes

- MySQL doesn’t support `FULL OUTER JOIN` directly — we simulate it using `LEFT JOIN + RIGHT JOIN + UNION`.
- For performance testing, use `EXPLAIN` before and after index creation.

---

