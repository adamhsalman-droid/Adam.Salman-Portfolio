# Module 01 — Introduction and Local-First Foundations

## Learning goals

By the end of this module, I should be able to:

1. Explain the CBL/PBL approach, portfolio assessment, and evolving course requirements.
2. Set up a personal GitHub portfolio with an appropriate `.gitignore`.
3. Reproduce the course Python environment with `uv`, SQLite, DuckDB, and Datasette.
4. Measure and explain how an embedded database differs from a client/server database.
5. Load real telemetry rows into SQLite and use bound parameters in Python.
6. Run and verify an AI-generated SQL query rather than trusting it immediately.

My goal is to understand the basics of databases and practise using them through small exercises.

## Course and portfolio links

- [Module 01 instructions](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/modules/01-introduction-and-local-first.md)
- [Course syllabus](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/syllabus.md)
- [My portfolio home](../README.md)
- [SQL Island notes](sql-island.md)
- [AI query verification](task-07-ai-verification.md)

## Task Pod

Our Task Pod has three members:

- Adam Salman — [Portfolio](https://github.com/adamhsalman-droid/Adam.Salman-Portfolio)
- Mohamed Alsayed — [Portfolio](https://github.com/mbahnasy426/Mohamed-Hamed)
- Mohamed Nassar — [Portfolio](https://github.com/nassarrrrr/M.Nassar-HSBI-Database-Portofolio)

## Contributions

- **Mohamed Nassar (Tasks 1–4):** Set up the GitHub portfolio, configured the Python environment, and completed the SQLite shell exercises.
- **Mohamed Alsayed (Task 5):** Completed the SQL Island exercises, practiced SQL commands, and documented the learning experience.
- **Adam Salman (Tasks 6–7):** Generated and analyzed telemetry data using Python and SQLite, and verified AI-generated SQL queries.

**Teamwork:** All three members discussed the assignments, reviewed the results, and supported each other throughout the project.


## Task evidence checklist

- [ ] **Task 1:** Instructor collaborator, local clone, and first commit verified
- [ ] **Task 2:** Several clear commits, at least three working links including a teammate
- [ ] **Task 3:** Run `uv` and commit the generated `pyproject.toml` and `uv.lock` alongside `uv-check.py` output
- [ ] **Task 4:** Use `sqlite3` to create `shell-tour.txt` and a fresh `tour.sql` dump; record my favourite dot-command
- [ ] **Task 5:** Play SQL Island and complete [my answers](sql-island.md) with a real progress screenshot
- [x] **Task 6:** Run `generate_telemetry.py`, `load_telemetry.py`, and `query_telemetry.py`; save file size, row counts, and timed results
- [ ] **Task 7:** Run and inspect the AI query; record its real query plan and a verification paragraph
- [ ] Complete [Module 01 reflection](reflection.md)

## Reproducing Tasks 3, 6 and 7

From the **root of this repository** (after installing `uv`):

```sh
uv python install 3.14
uv init --name databases-portfolio
uv add duckdb datasette sqlite-utils pydantic sqlalchemy
uv run uv-check.py
uv run python module-01/generate_telemetry.py
uv run python module-01/load_telemetry.py
uv run python module-01/query_telemetry.py
```

Use `uv init` only if a `pyproject.toml` does not already exist. The `.db`, CSV, virtual environment, and secrets stay out of the repository. Commit the generated lockfile and save **genuine** output after running the commands.

Task 4 uses the real `sqlite3` terminal. The included `tour.sql` is an illustrative starting script, not evidence that a shell session has taken place.
