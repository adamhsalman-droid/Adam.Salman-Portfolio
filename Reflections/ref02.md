# Reflection 02 — Data Contracts and Legacy Schemas

## Take-away
I learned that a database is more than a set of tables. It needs correct **keys**, **relationships**, and rules so that the data stays reliable. In an old (legacy) database, a SQL query can run without errors and still give a wrong answer. My advice is to inspect the schema and verify the results before trusting them.

## What was good?
The maintenance database example made the concepts easier to understand. We found a maintenance job for a machine that did not exist (`cnc-05`), a duplicated part number (`P-1003`), an invalid date (`unknown`), and a comma-separated list of parts. I documented the findings in an ER diagram and SQL queries. On 4 November 2026, I also ran the SQL checks and the data-contract script in VS Code; the contract printed three PASS checks.

## What was difficult?
At first, I found **many-to-many (m:n)** relationships confusing. I learned that many jobs can use many parts, so we need a **junction table** such as `job_part`, not a list of part numbers in one text column. Distinguishing an **entity** from an **attribute**, and understanding primary versus foreign keys, also took practice.

## Exploration and show stoppers
What surprised me was that a query can return believable but incorrect results: comparing prices stored as text can miss a price of `9.90`, and joining a comma-separated list can omit a maintenance job entirely. There was no major remaining technical blocker in the local tests; the learning was in explaining *why* those queries were wrong.

## Interaction with peers and instructors
Our Task Pod discussed the ER sketches with a neighboring group at university, including Habiba Aladdin Darwish, Arshia, and Asima. We compared **1:1**, **1:n**, and **m:n** relationships, and discussed why the foreign key belongs on the many side and why a many-to-many relationship needs a junction table. My teammates' reflections also record that the professor joined the discussion and helped correct misunderstandings. See [our study log](../Module02/study-log.md) and [Mohamed Hamed's reflection](https://github.com/mbahnasy426/Mohamed-Hamed/blob/main/Reflections/ref02.md).

## How did I verify AI suggestions?
I used AI to help explain the schema and draft code, but verified the important claims with SQL queries against the sample data. I checked the duplicated part, the missing machine, the invalid date, and the incorrect join. I also ran the Pydantic/SQLAlchemy contract and saw checks pass for an invalid serial number and an orphan job. Working code or a successful query is **not** proof that the answer is correct.

## Help and extra work
Working with my Task Pod and the neighboring group helped me understand the diagrams. My main technical contribution to this portfolio is the reproducible ER audit and the tested data contract. The **Discord image post is not yet independently confirmed** in this portfolio, so I am not claiming it was posted.

See [Module 2 evidence](../Module02/README.md) and [local verification notes](../Module02/verification-notes.md).
