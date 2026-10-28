# Reflection 02 — Data Contracts and ER Diagrams

## What I learned

In this module I learned that a database is more than tables: the tables must have the right relationships. An **entity** is something like a machine or a part; an **attribute** describes it. **Cardinality** tells us if relationships are one-to-one, one-to-many, or many-to-many.

## What I practised

I worked through a maintenance database example and used SQL to check for defects. The example had a job for a machine that did not exist (`cnc-05`), a duplicated part number (`P-1003`), a bad date (`unknown`), and parts stored as a comma-separated list. I documented an ER diagram and a corrected schema.

## What was difficult?

The most confusing part was the many-to-many relationship. I learned that when many jobs use many parts, we need a **junction table** like `job_part` rather than one text column.

## How AI was checked

I used AI assistance for drafting explanations and code, but checked the claims with actual SQL queries against the provided dataset. A query returning rows does not automatically mean the data is correct.

## Teamwork and next step

This portfolio currently contains reproducible examples and explanations. I still need to discuss and verify my ER sketches with my Task Pod and record the feedback. I also want to become more confident drawing ER diagrams by myself.

## My takeaway

**Good database design means correct tables, keys and relationships. SQL can help us find problems before they cause real mistakes.**

[Module 2 evidence](../Module02/README.md)
