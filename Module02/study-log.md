# Module 02 — Study log: ER models and legacy schemas

## Resources and what they taught me

| Source | Main idea to understand |
|---|---|
| [Course Module 2](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/modules/02-data-contracts-and-legacy-schemas.md) | Understand the meaning behind a legacy database |
| [SQLite foreign keys](https://www.sqlite.org/foreignkeys.html) | Enable `PRAGMA foreign_keys=ON` so links are enforced |
| [Mermaid ER diagrams](https://mermaid.js.org/syntax/entityRelationshipDiagram.html) | Show entities, attributes and cardinality graphically |
| [Pydantic](https://docs.pydantic.dev/latest/) | Validate input in Python |
| [SQLAlchemy](https://docs.sqlalchemy.org/) | Declare tables and constraints in Python |

## Concepts I looked up

- **Entity:** an independent thing, e.g. Machine, Part, Technician.
- **Attribute:** a fact about an entity, e.g. serial number.
- **Relationship:** how entities connect, e.g. one machine has many jobs.
- **Cardinality:** 1:1, 1:n, or m:n.
- **Natural key:** meaningful unique value like `part_no`.
- **Surrogate key:** generated ID with no business meaning, e.g. `machine_id`.
- **Orphan:** a job references a missing machine.
- **1NF:** do not store comma-separated lists in one database column.
- **Data contract:** rules written as code, checked by the application and database.

## Four drawn ER examples

See [er-examples.md](er-examples.md) for four Mermaid diagrams (1:1 nameplate, 1:n sensors, m:n work orders/parts, and maintenance jobs) and a `CREATE TABLE` / `COUNT` demonstration.

## Two reference diagram styles and our redraws

1. **Chen ER notation:** [ER model examples on Wikipedia](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model) show relationships as diamonds. This helped me see the difference between a relationship and an attribute.
2. **Crow's-foot ER notation:** [Mermaid's ER diagram examples](https://mermaid.js.org/syntax/entityRelationshipDiagram.html) show how to express one-to-one, one-to-many and many-to-many connections visually.

We redrew and applied these ideas in our own [four ER examples](er-examples.md), especially **Machine → Sensor (1:n)** and **WorkOrder ↔ Part via OrderPart (m:n)**. These are our own Mermaid drawings, not photographs of external diagrams.

## LLM-assisted Q&A and verification

**Prompt:** "From this schema, identify the intended entities and cardinalities. Could any maintenance jobs reference machines that do not exist?"

**Draft answer to verify:** Machine has many MaintenanceJobs; Technician has many jobs; jobs and parts are many-to-many. Missing FK allows orphan jobs.

**Verification:** [defect-queries.sql](defect-queries.sql) returns `(3, cnc-05)` as an orphan; job 1 stores two part numbers. The diagram alone does not prove these defects — the queries do.

**Prompt:** "Why is `parts_used='P-1001,P-1002'` a problem?"

**Draft answer to verify:** One column contains multiple values, breaking 1NF and making normal joins unreliable.

**Verification:** The naive join in the defect queries excludes job 1, even though it has valid part numbers.

These prompts and summaries document the reasoning used to audit the dataset; they are not presented as an archived transcript from another model.

## Remarkable findings / counterexamples

- Query results can look believable even when wrong: the text price filter excludes `9.90` from values less than `15`.
- `P-1003` is duplicated; a join duplicates job 2.
- Job 1 completely disappears from a join because its two part numbers were stored as one string.

## Agreed learning (pod discussion)

The university pod exchange **took place** with a neighboring group that included **Habiba Aladdin Darwish, Arshia and Asima**, as also documented in [Mohamed Hamed's Module 2 reflection](https://github.com/mbahnasy426/Mohamed-Hamed/blob/main/Reflections/ref02.md) and [Mohamed Nassar's study log](https://github.com/nassarrrrr/M.Nassar-HSBI-Database-Portofolio/blob/main/Module02/study-log.md). The professor joined and gave feedback, as reported in Hamed's reflection.

We discussed these points:

1. **1:1:** A machine and its nameplate can be modeled separately, with a unique key, or the nameplate details can be attributes of Machine depending on requirements.
2. **1:n:** One machine may have many sensors. The foreign key goes in the **Sensor** table (the many side).
3. **m:n:** Many work orders may use many parts. A **junction table** is required; storing a list of part numbers in a text cell is not a proper relationship.
4. **Keys:** Primary keys identify records; foreign keys link records to another table. Constraints matter because names and free text do not guarantee valid links.
5. **Verify findings:** SQL counts and joins are needed to check assumptions made from a diagram.

Nassar's notes report **no outstanding disagreement** from that exchange. **Discord status:** the shared image is *not confirmed as posted*; Nassar's last written note says it was still pending. This section records the real discussion without inventing a Discord link.

## Verified local work and next steps

- On **4 November 2026**, the SQL defect queries ran in VS Code and the Pydantic/SQLAlchemy contract printed three PASS checks. Details: [verification-notes.md](verification-notes.md).
- Confirm with the Task Pod whether the selected diagram was actually posted to Discord; add a real link or screenshot only if available.
- Keep practising drawing ER diagrams independently and explain the differences between 1:1, 1:n and m:n.
