# Module 02 — Data Contracts & Reading Legacy Schemas

**Focus:** inspect a broken maintenance database, reconstruct its intended ER model, prove defects using SQL, and describe a corrected executable contract.

## Learning goals and evidence

| Learning goal | Evidence |
|---|---|
| Reconstruct entities, keys, relationships and cardinality | [ER audit with Mermaid diagram](er-audit.md) |
| Distinguish 1:1, 1:n and m:n and draw examples | [Four ER sketches and SQL proof](er-examples.md) |
| Find defects using real queries, not guesses | [SQL for five defects](defect-queries.sql) and [recorded results](er-audit.md) |
| Explain natural vs surrogate keys | [ER audit — key choices](er-audit.md) |
| Implement a code-first data contract | [Pydantic + SQLAlchemy contract](contract.py) |
| Describe the missing business requirements | [Business rules](er-audit.md) |
| Record sources, verification and learning | [Study log](study-log.md), [Reflection 02](../Reflections/ref02.md), and [local verification notes](verification-notes.md) |

## Reproduce the legacy database and tests

From the repository root (SQLite CLI installed):

```powershell
sqlite3 Module02/legacy.db ".read Module02/setup.sql"
sqlite3 -header -column Module02/legacy.db ".read Module02/defect-queries.sql"
uv run python Module02/contract.py
```

The `setup.sql` is rerunnable and intentionally creates an **incorrect** schema. It must not be mistaken for the repaired one. Database files (`*.db`) are ignored by Git.

## Findings to explain in the checkpoint

1. `maint_job` references missing machine `cnc-05` (orphan).
2. `P-1003` exists twice (no uniqueness).
3. `unit_price` is `TEXT`, so comparing it with `'15'` can give misleading results.
4. A machine has installed date `unknown`.
5. `parts_used` contains comma-separated values, which hides a many-to-many relationship.

## Verified work and teamwork

- **SQL audit tested locally on 4 November 2026:** the five-defect script ran without an error. See [verification notes](verification-notes.md) and [the documented defect findings](er-audit.md).
- **Data contract tested locally on 4 November 2026:** the student ran `uv run python Module02/contract.py` and observed three PASS checks for serial validation, foreign-key enforcement, and corrected-schema creation. See [verification notes](verification-notes.md) and the committed [corrected schema](corrected-schema.sql).
- **University pod discussion completed:** we compared diagrams with the neighboring pod including Habiba Aladdin Darwish, Arshia and Asima. The professor also joined and provided feedback, as recorded by [our teammate Mohamed Hamed](https://github.com/mbahnasy426/Mohamed-Hamed/blob/main/Reflections/ref02.md). Our 1:1, 1:n and m:n conclusions are recorded in [study-log.md](study-log.md).
- **Reflection recorded:** [Reflection 02](../Reflections/ref02.md).

## What is not yet confirmed

- **Discord:** No proof of the selected diagram being posted is available here. [Mohamed Nassar's study log](https://github.com/nassarrrrr/M.Nassar-HSBI-Database-Portofolio/blob/main/Module02/study-log.md) last recorded it as pending; add the actual screenshot or link if the team posted it later.
- **Runtime evidence:** the passing terminal output was observed in VS Code screenshots and summarized in the verification notes, but a complete raw output file has not been committed.
- **Optional stretchers:** EER inheritance and extra Mermaid curiosities are not included.

## One-minute explanation in English

"I learned how to read an old database schema and find problems. I drew an ER diagram to show the tables and relationships. I used SQL to prove five problems, including a maintenance job linked to a machine that does not exist and a duplicated part. I learned that a many-to-many relationship needs a junction table. Finally, I used Pydantic and SQLAlchemy to describe rules for a better database."

[Course Module 2](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/modules/02-data-contracts-and-legacy-schemas.md) · [Back to main portfolio](../README.md)
