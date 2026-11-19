# Reflection 06b — Polyglot Persistence & the Decision

## What I learned

Different storage shapes solve different problems. JSON fields let vendors add attributes without a table migration, while SQLite's `CHECK(json_valid(meta))` still enforces a useful contract. An expression index depends on the exact expression: two queries can return the same 334 vendors while one uses an index and the other scans the whole table.

## What I compared

The prepared 20,000-session experiment implements both a Python `shelve` store and a SQLite primary-key table. In the separate Linux execution environment, reads were close (0.100 s vs 0.095 s), while batched SQLite writes were much faster than per-key shelve assignments (0.027 s vs 3.957 s). The Python `shelve` backend was `dbm.sqlite3`. Those numbers are **not measurements from my own computer** and the write transaction shapes are not identical. SQLite can also group sessions by a city filter with SQL; shelve needs Python iteration.

The permitted local two-writer fallback demonstrated a SQLite write lock. I did **not** connect to the shared PostgreSQL server or observe the instructor's outage demonstration.

## How this connects to earlier modules

Module 4 gave me replay-safe ingestion, constraints and transactions. Module 5 quantified the trade-off between normalized data and a denormalized report copy. Module 6a prepared a Parquet/DuckDB analytics workflow. Module 6b makes the choices explicit in a decision record: SQLite for writes/JSON/session lookups; checked Parquet + DuckDB for long reports once the local 6a benchmarks support it; a server only when network concurrency requirements justify its overhead.

## What was difficult / what comes next

The hardest detail was seeing why `meta ->> 'vendor'` ignores an index created on `json_extract(meta, '$.vendor')` even though both return the same vendor. I also need to distinguish ACID transactions, a stale derived copy, and CAP's actual distributed-system partition problem, rather than calling every cache BASE.

My next actions are to rerun both Module 6a and 6b on my computer, attend or document the shared PostgreSQL activity, defend the decision to another pod and record any real change, then bring [my Module 7 project ticket](../Module06b/project-ticket.md) to the merged-team kickoff. I did not claim attendance, peer feedback or instructor approval that has not happened.

**Process note:** Scripts and explanatory drafts were prepared with AI assistance and checked in a separate test environment; this reflection distinguishes reproducible work from unobserved classroom activities.

Source: [Official Module 6b](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/modules/06b-polyglot-persistence.md).
