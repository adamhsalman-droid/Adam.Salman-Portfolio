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

## Evidence still to verify live

- Instructor collaborator access (cannot be proven by the public file list).
- Successful edit/commit in the peer feedback round.
- A measured embedded vs client/server comparison on equivalent workloads (not yet recorded; see linked note).
- SQL Island progress screenshot ownership and explanation, and a full local command-line rerun.

[Module 1 instructions](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/modules/01-introduction-and-local-first.md) · [Syllabus](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/syllabus.md)
