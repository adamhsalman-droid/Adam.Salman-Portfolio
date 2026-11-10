# HSBI Databases Portfolio

**Adam Salman** — Databases course, Hochschule Bielefeld (HSBI).

This is my personal learning portfolio for the course. It collects the scripts, recorded observations, SQL practice, Task Pod collaboration and reflections that I can explain and reproduce.

## Module index

- [Module 01 — Introduction and Local-First Foundations](Module01/README.md) — [practical scripts and results](module-01/README.md)
- [Module 02 — Data Contracts and Legacy Schemas](Module02/README.md) — ER models, tested defect queries, and data contract
- [Module 03 — LLM-Assisted SQL and Query Profiling](Module03/README.md) — runnable profiler, SQL injection demo, query verification and relational algebra
- [Module 04 — Data Integrity, Constraints & Edge Triggers](Module04/README.md) — STRICT constraints, UPSERT, alarms, audit, local read-only access

## Module 01 highlights

- Python 3.14 + SQLite, DuckDB, Datasette and uv environment records.
- SQL Island exercise and a screenshot of pod progress.
- Generated **172,800** telemetry readings across three CNC machines, stored in embedded SQLite.
- Saved real query outputs and a query plan.
- A checked AI-generated SQL query, including a documented meaning error.
- [Module 1 reflection](Reflections/ref01.md).

## Module 02 highlights

- Reconstructed the old maintenance database as an ER model, including 1:1, 1:n, and m:n examples.
- Used SQL to demonstrate five data-integrity defects and documented an improved schema.
- Tested the Pydantic/SQLAlchemy data contract locally, with three successful checks on 4 November 2026.
- Recorded the university neighboring-pod exchange and its learning points in the [study log](Module02/study-log.md).
- [Module 2 reflection](Reflections/ref02.md) · [Verification notes](Module02/verification-notes.md) · [Module 2 portfolio evidence](Module02/README.md).
- The Discord image share is not confirmed in the current portfolio and is not claimed as completed.

## Module 03 highlights

- [Module 3 reproducible lab](Module03/README.md): warehouse generator, AI-assisted city revenue query, plans and median index benchmark.
- [SQL injection demo](Module03/injection_demo.py) with bound parameters and [algebra + optional window-function work](Module03/algebra.md).
- [Module 3 study notes](Module03/sql-notes.md) · [Reflection 03](Reflections/ref03.md). Actual neighboring-pod exchange remains to be recorded.

## Module 04 highlights

- [Module 04 reproducible lab](Module04/README.md) checks entity, referential and domain constraints (including deliberate failing inserts).
- [Replay-safe CSV ingestion](Module04/ingest.py) demonstrated 11 readings after each of two passes, with no duplicates.
- [Alarm and audit triggers](Module04/triggers.sql), [10,000-row benchmark evidence](Module04/results.txt), and a read-only `machine_health` view.
- [Study notes](Module04/integrity-notes.md) · [Reflection 04](Reflections/ref04.md). Local Windows verification and the real pod exchange remain follow-ups.

## Task Pod

- [Adam Salman](https://github.com/adamhsalman-droid/Adam.Salman-Portfolio)
- [Mohamed Nassar](https://github.com/nassarrrrr/M.Nassar-HSBI-Database-Portofolio)
- [Mohamed Alsayed / Hamed](https://github.com/mbahnasy426/Mohamed-Hamed)

See [Module 1](Module01/README.md) for roles, links, evidence and reproducibility steps.

## Links

- [Course syllabus](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/syllabus.md)
- [Module 1 course instructions](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/modules/01-introduction-and-local-first.md)
