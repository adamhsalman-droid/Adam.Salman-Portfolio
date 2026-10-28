# Reflection 01 — Introduction and Local-First Databases

## My take-away

Before this class, I could not clearly explain the difference between data, a database, SQL, and SQLite. I learned that data is information, a database organizes that information, and SQL (Structured Query Language) is how we ask a relational database to retrieve or change records. SQLite is an embedded database engine, not a programming language.

My advice to myself is to practise writing and **running** queries instead of just reading SQL examples. I also learned why AI output must be checked against real database results.

## What went well?

Creating my GitHub portfolio helped me organize the course work. I practised `SELECT`, `WHERE`, grouping and other SQL operations in SQL Island. I also helped generate and query a small CNC telemetry dataset containing 172,800 readings. I could inspect actual query results and understand why SQLite can be practical for a local application.

## What was difficult?

At first I confused data, databases, SQL and SQLite. Setting up tools and using the command line also took practice. Understanding query execution plans was new to me: a successful query can still perform a full table scan. I want to improve writing queries without relying on examples.

## Exploration and an important correction

During the lecture we did not have enough time for Tasks 6 and 7, so we worked on them afterwards. One useful discovery came while verifying an AI-generated query: its filter for readings 'after 18:00' did **not** represent a full overnight shift through 06:00. The SQL ran and returned reasonable-looking numbers, but it did not necessarily answer the intended question. I documented the original run, the execution plan, and the suggested correction without claiming that the correction was tested.

## Interaction with peers and instructor

Our Task Pod divided the work and discussed results: Mohamed Nassar focused on Tasks 1–4, Mohamed Alsayed/Hamed on Task 5, and I focused on Tasks 6–7. Working with the pod helped me understand different steps in the workflow. I would like feedback on our evidence and how best to explain the query-plan results.

## Help, contributions and AI verification

I contributed the telemetry-data work and AI-query verification. We used ChatGPT to assist with a query, but I checked its output and `EXPLAIN QUERY PLAN` instead of assuming it was right. We learned that a query running successfully is not proof that its meaning is correct.

See the [Module 1 evidence](../Module01/README.md) and [detailed original reflection](../module-01/reflection.md).
