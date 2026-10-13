# Task 7 — LLM-assisted SQL profiling

## Prompt given to ChatGPT
> Here is my SQLite table: `readings(ts TEXT, machine TEXT, temp_c REAL, vib_rms REAL, spindle_load REAL)`. Write a query that returns, for each machine, the average spindle load for readings taken overnight (after 18:00), ordered by average load descending.

## Generated SQL

```sql
SELECT machine, ROUND(AVG(spindle_load), 2) AS avg_spindle_load
FROM readings
WHERE time(ts) > '18:00:00'
GROUP BY machine
ORDER BY avg_spindle_load DESC;
```

## Run, profile, and challenge

**Execution output:** Pending a real run of `uv run python module-01/query_telemetry.py`.

**EXPLAIN QUERY PLAN output:** Pending a real run; the script executes this statement and prints the plan.

**Potential issue to verify:** The wording "overnight (after 18:00)" is ambiguous. This query includes timestamps later than 18:00 on *each date* and excludes exactly 18:00:00. It does not include the after-midnight hours, so it is not the right query if "overnight" means an entire 18:00–06:00 shift. Also check that each machine is grouped and the ordering is descending.

**Verification paragraph:** To be completed after executing the query and checking the output and plan. Do not claim results or timings without running the code.
