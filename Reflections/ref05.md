# Reflection 05 — Normalization vs. Denormalization

**Context.** I missed the live Module 5 session, so these are the results of a reproducible **independent** run, not a claim of in-class attendance or a completed neighbour-pod gate.

## What I built and checked

I implemented Ulno's seven-round Module 5 workflow in `Module05/`. I generated 200,000 flat job-part rows and decomposed them into 3NF `machine`, `part`, `job` and `job_part` tables. I used a five-row flat example to demonstrate update, insert and delete anomalies. I compared the four-way aggregate against the denormalized `report_jobpart` table, verified identical grouped results, inspected both query plans and measured warm-cache medians. For the homework, I measured the one-row versus 4,000-row site update, collected per-object storage from SQLite `dbstat`, tested the reporting index effect and wrote a recommendation memo.

## What surprised me

A denormalized report does not automatically win by a huge factor: its wider rows and the choice of index matter. I also learned that removing an index sometimes makes a full-table aggregation faster because the engine avoids index lookups for every row. The update-anomaly price (1 row versus 4,000) is more important than any single laptop timing.

## What I checked instead of trusting AI output

The program verifies table cardinalities (200k/50/10/20k/200k/200k), foreign-key integrity, and equality of the two report result sets. It executes the index experiment and rolls back test site changes so the next module starts with an unchanged database. Benchmarks in `results.txt` are local measurements, **not** numbers from the lecture and not claimed as measurements on my personal laptop.

## Still to do in person

I have **not** completed the nearest-pod gate conversations, swapped the Round 7 curiosity list, or participated in the live recap. I should use the questions in `normalization-notes.md` during the next session, then document what classmates actually said. The `normalize.db` file is generated locally and should not be deleted before Module 06a.
