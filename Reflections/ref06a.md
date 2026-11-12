# Reflection 06a — The Analytical Engine (DuckDB)

## What I am trying to learn

The practical question is not simply which SQL engine is faster, but **which engine should handle each workload**. Module 05 used a denormalized table to speed up an operational dashboard. Module 06a extends the same data into historical analytics, tests a column-oriented Parquet copy, and asks how the copy can remain trustworthy.

## Learning goals and my implementation

1. **Reproducible export:** I prepared `prepare.py` to take the existing 200,000 `report_jobpart` rows from `Module05/normalize.db` and expand them to 2 million history rows. `to_parquet.py` converts the same source and checks row count and total price against SQLite.
2. **Honest engine benchmark:** I prepared `race.py` to warm up both engines, alternate five measurements, report median and min–max spreads, and **verify identical results before comparing speeds**. One important SQL detail is that SQLite's `strftime` arguments are reversed relative to DuckDB's; I corrected this to avoid a false comparison.
3. **Execution plans:** `plan.py` shows how DuckDB actually executes an aggregate over Parquet (`EXPLAIN ANALYZE`) and compares this with SQLite's planned access path (`EXPLAIN QUERY PLAN`). Projecting only the columns needed for a report reduces work.
4. **The limits of DuckDB:** `boundary.py` tests many single-row inserts and point lookups; DuckDB's strong aggregation performance does not imply it is appropriate for an operational workload dominated by tiny transactions.
5. **Refreshing the analytical copy:** The intense-track `refresh.py --check` recreates Parquet from the operational history, validates count and price total, and avoids publishing a mismatched copy. The core homework compares Snappy and zstd compression. Count and sum checks are useful, but do not guarantee every individual row matches.

## Evidence and follow-up

Run `uv run python Module06a/run_module6a.py` inside my portfolio to produce hardware-specific timings in `Module06a/results.txt` and `Module06a/metrics.json`; after success it also fills in the numbers in `memo.md`. **Until that has run successfully on my machine, I will not claim the local DuckDB timing outcomes as observed results.** I also have **not** claimed any nearest-pod discussion, attendance checkpoint, or instructor feedback; those must be documented only if they actually take place.

## Decision I would test

Keep live transaction processing in SQLite and export historical reporting to Parquet for DuckDB, using a checked scheduled refresh and a visible data freshness indicator. The report's accuracy and freshness are as important as latency. The final recommendation should include measured medians and measured insert/lookup costs rather than a generic statement that one engine is always faster.

Official source: [Module 06a](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/modules/06a-duckdb-analytical-engine.md).
