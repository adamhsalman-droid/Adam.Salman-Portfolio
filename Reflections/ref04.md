# Reflection 04 — Data Integrity, Constraints & Edge Triggers

*Draft based on reproducible Module04 evidence. Review and personalize after running the lab on your own machine.*

## Take-away: what do I want to remember?

- Integrity has **three layers**: entity (`PRIMARY KEY`, `NOT NULL`, `UNIQUE`), referential (`FOREIGN KEY`) and semantic/domain (`CHECK`, `STRICT`, triggers).
- The SQLite database must enforce important rules, not just the Python application.
- `PRAGMA foreign_keys = ON` must be enabled **on each connection**.
- A unique `(sensor_id, ts)` key plus `UPSERT` handles replay after an edge outage without duplicates.

## What worked well?

- The automated tests gave concrete error messages for invalid temperatures, text in REAL fields, missing sensors and duplicate keys.
- In the test run, inserting vibration `2.7` created an alarm, changing it to `1.4` created an audit record, and loading the same CSV twice kept 11 rows.
- A read-only connection could query the database but could not delete readings.

## What was difficult or surprising?

- A `CHECK` constraint alone does not reject NULL; it needs `NOT NULL` if missing data is forbidden.
- `STRICT` still converts valid numeric text such as `'20'` into REAL.
- `chmod` can behave differently on Windows or for privileged users. Read-only SQLite connections are more portable for demonstrations.

## Exploration and performance

The runner benchmarks 10,000 reading inserts three times both with and without the alarm trigger. It shows extra work and overhead from creating 2,664 alarm records. The exact timings in [Module04/results.txt](../Module04/results.txt) were obtained in an independent execution environment, **not on my laptop**; I should re-run and compare my own results before presenting them.

The optional exercise also demonstrates an `INSTEAD OF INSERT` trigger on a view.

## Interaction with peers and instructors

[Module04 is aligned with Nassar's schema and sample CSV](https://github.com/nassarrrrr/M.Nassar-HSBI-Database-Portofolio/tree/main/Module04), but **actual Pod Task B / neighboring-pod exchange is not yet documented**. No peer discussion or instructor feedback is claimed.

## Help, tools and next action

An AI assistant helped prepare and verify reproducible scripts. The assertions and saved output are the evidence, not a claim that AI answers were correct without testing. Next: run `uv run python Module04/run_module4.py` locally in VS Code, review the resulting `results.txt`, and add real pod feedback after class.

## Status

- **Implemented and independently tested:** Task A, Tasks 1–4, optional Task 5.
- **Manual follow-up:** local verification on my PC and Pod Task B conversation.
