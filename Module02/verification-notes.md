# Module 02 — Local verification notes (4 November 2026)

These notes record the commands and the results visible in the student's VS Code Terminal screenshots from 4 November 2026. They are **not** a pasted full terminal transcript, and they are separate from the sample-data results documented in [er-audit.md](er-audit.md).

## 1. Rebuild the intentionally flawed database

```powershell
sqlite3 Module02/legacy.db ".read Module02/setup.sql"
```

The command returned to the PowerShell prompt without an error.

## 2. Run the defect queries

```powershell
sqlite3 -header -column Module02/legacy.db ".read Module02/defect-queries.sql"
```

The queries finished without a terminal error. The visible final results included:

```text
job_id  parts_used     n_parts
1       P-1001,P-1002  2
2       P-1003         1
3       P-1001         1
4       (NULL)         (NULL)

machine_name  COUNT(*)
cnc-01        2
cnc-02        1
cnc-05        1
```

The five expected integrity defects and their sample-data results are described in [er-audit.md](er-audit.md) and can be reproduced using [defect-queries.sql](defect-queries.sql).

## 3. Run the application/database contract

```powershell
uv run python Module02/contract.py
```

The final three lines visible in the terminal were:

```text
PASS: Pydantic rejected serial without SN- prefix
PASS: SQLite foreign key rejected orphan job
PASS: corrected schema created
```

The command generated the corrected schema on the local computer. The repository also contains [corrected-schema.sql](corrected-schema.sql). The passing checks show the *tested* rules work, but do not establish that every possible business rule is already enforced: for example, a nonnegative-price constraint and a separate Technician table are described as potential improvements in [er-audit.md](er-audit.md).

## Documentation boundary

- The ER diagrams, SQL audit and contract code are committed to the portfolio.
- A full raw terminal transcript and Discord-post evidence are **not** claimed by this file.
- The pod discussion took place at university; its learnings are documented in [study-log.md](study-log.md).
