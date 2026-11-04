# Reflection 01 — Introduction and Local-First Databases

## Take-away
Before this lecture, databases and SQL were new to me. I learned that **data** is information, a **database** stores and organizes it, and **SQL** is the language used to find, add, update, and delete information. **SQLite** is a database engine that can keep the data in a local file, even without internet access. My advice to my past self is to learn the basic terms before trying all the commands.

## What was good?
I learned to use GitHub to organize my course work and practised `SELECT` and `WHERE` in SQL Island. We also worked with **172,800 readings** from three CNC machines, using Python and SQLite. The practical tasks made the lecture concepts easier to understand.

## What was difficult?
At first I confused **SQL** (the language) with **SQLite** (the database engine). Using the Terminal and understanding `EXPLAIN QUERY PLAN` were also challenging. I needed practice to understand the difference between a SQL query's *result* and the database's *execution plan*.

## Exploration and show stoppers
SQL Island was a useful way to experiment with SQL and learn from mistakes. In the telemetry work, I saw how one local database file can hold many measurements. One surprising problem was an AI-written SQL query that ran without an error but did not cover the full requested overnight period. I still want more SQL practice.

## Interaction with peers and instructors
Our Task Pod had three members: [Mohamed Nassar](https://github.com/nassarrrrr/M.Nassar-HSBI-Database-Portofolio), [Mohamed Hamed / Alsayed](https://github.com/mbahnasy426/Mohamed-Hamed) and me. Nassar mainly worked on Tasks 1–4, Hamed on Task 5, and I mainly worked on Tasks 6–7. We discussed and checked our work together. There was not enough time to finish Tasks 6 and 7 in class, so we completed them afterwards.

## How did I verify AI suggestions?
We asked AI to help with a query about **overnight spindle load**. Its condition `WHERE time(ts) > '18:00:00'` includes times after 18:00 but **excludes the hours after midnight**. I reviewed the SQL condition and the saved query results instead of trusting that the query ran. I also inspected `EXPLAIN QUERY PLAN` to understand the database's execution strategy; a query plan alone does **not** prove that the SQL logic is right. The suggested corrected time filter has **not** yet been tested.

## Help and extra work
My Task Pod helped me understand the exercises, and I contributed the telemetry data scripts and AI-query review. We kept our results, scripts and reflections in GitHub so they can be checked or rerun. I learned that **AI suggestions must be verified using the data and the actual question**.

See [Module 1 evidence](../Module01/README.md) and the [longer lecture reflection](../module-01/reflection.md).
