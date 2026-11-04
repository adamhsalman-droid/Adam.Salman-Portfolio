# Module 01 — Introduction and Local-First Foundations

This is the main portfolio entry for Module 1. Practical work and reproducible scripts are in [module-01](../module-01/README.md).

## Learning goals and proof

| Learning goal | Evidence |
| --- | --- |
| Explain the course's CBL/PBL model and portfolio assessment | [My reflection](../Reflections/ref01.md) |
| Maintain a personal portfolio, commits and safe Git files | [Portfolio home](../README.md), [module links](../module-01/README.md), [Git ignore](../.gitignore) |
| Set up Python 3.14 and database tooling using uv | [Recorded tool versions](../module-01/uv-check-output.txt), [uv-check.py](../uv-check.py), [pyproject.toml](../pyproject.toml), [uv.lock](../uv.lock) |
| Explain and measure embedded vs client/server database trade-offs | [Local-first explanation and measurement status](../module-01/local-first-comparison.md) |
| Reproducibly load rows into SQLite using Python bound parameters | [Generator](../module-01/generate_telemetry.py), [loader](../module-01/load_telemetry.py), [saved results](../module-01/query-results.txt) |
| Verify rather than trust AI-generated SQL | [AI query verification](../module-01/task-07-ai-verification.md) |

## Work done

- Created an HSBI Databases GitHub portfolio and collaborated in a three-person Task Pod.
- Set up Python and uv-managed database packages and recorded their versions.
- Practised SQL in [SQL Island](../module-01/sql-island.md), with [progress image](../module-01/sql-island-progress.png).
- Generated two days of CNC telemetry for three machines, **172,800 rows**, then loaded and queried them with SQLite.
- Inspected an actual `EXPLAIN QUERY PLAN` for an AI-generated query, identified an ambiguity in its interpretation of *overnight*, and documented an untested correction.

## Task Pod

- [Adam Salman](https://github.com/adamhsalman-droid/Adam.Salman-Portfolio): telemetry analysis and AI verification (Tasks 6–7).
- [Mohamed Nassar](https://github.com/nassarrrrr/M.Nassar-HSBI-Database-Portofolio): Tasks 1–4.
- [Mohamed Alsayed / Hamed](https://github.com/mbahnasy426/Mohamed-Hamed): SQL Island (Task 5).

The pod collaborated and discussed findings. [Personal reflection](../Reflections/ref01.md).

## Reproduce the work

From the repository root, after installing uv:

```powershell
uv sync
uv run python uv-check.py
uv run python module-01/generate_telemetry.py
uv run python module-01/load_telemetry.py
uv run python module-01/query_telemetry.py
uv run python module-01/parameter-demo.py
```

The generated `.csv` and `.db` are intentionally ignored by Git. The stored query results reflect a previous local run; rerun locally to verify on your own machine.

## Evidence status and limits

- **Core Module 1 work is documented:** Tasks 1–7 have linked portfolio files, including environment records, SQL Island practice, telemetry scripts, SQL query results, AI checking, and [Reflection 01](../Reflections/ref01.md). [Mohamed Hamed's Module 1 README](https://github.com/mbahnasy426/Mohamed-Hamed/blob/main/Module01/README.md) describes the same Task Pod division.
- **Instructor access:** the student previously reported adding the professor; this permission cannot be verified from the public file listing. Confirm in GitHub Settings if asked at the checkpoint.
- **Live peer Git/Markdown check:** the portfolio has commits and working links, but an observed peer editing round was not independently documented here.
- **Embedded versus client/server measurement:** an actual equivalent-workload PostgreSQL/MySQL benchmark was **not** recorded. The [local-first comparison](../module-01/local-first-comparison.md) distinguishes explanation from measured evidence.
- **SQL Island and reproducibility:** the saved progress screenshot and sample outputs document pod activity; they should be explained at the checkpoint, and scripts can be rerun locally.

[Module 1 instructions](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/modules/01-introduction-and-local-first.md) · [Syllabus](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/syllabus.md)
