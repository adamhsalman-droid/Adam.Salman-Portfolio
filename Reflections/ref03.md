# Reflection 03 — LLM-Assisted SQL & Query Profiling

## 1. Take-away and advice
The main thing I want to remember is that a SQL query running successfully does not prove it is correct. I learned how to examine an execution plan using `EXPLAIN QUERY PLAN`, and why a `SEARCH` using an index can be helpful while a `SCAN` sometimes makes more sense. My advice is to compare the answer, the plan, and the timing — not just trust the LLM.

## 2. What was good?
The warehouse example makes the effects of JOIN, GROUP BY, and indexes visible. I especially liked the idea of testing an AI suggestion against a reference query and showing a single-day query where indexing matters.

## 3. What was difficult?
Relational algebra symbols (σ, π, ⋈, γ) were unfamiliar at first, and I had to distinguish the order SQL is written from the order it is logically evaluated. It was also surprising that an index does not necessarily make every query faster.

## 4. Exploration and showstoppers
The reproducible runner checks the dashboard result, looks for a city with no orders, tests SQL injection safely on sample data, and compares three versions of a late-order report. This was useful evidence for understanding why checking only the output is not enough. The in-class neighbor-pod exchange is still pending.

## 5. Interaction with peers and instructors
This portfolio uses the same setup and topic coverage as my teammates. I compared [Mohamed Nassar's Module 03 work](https://github.com/nassarrrrr/M.Nassar-HSBI-Database-Portofolio/tree/main/Module03) and [Mohamed Hamed's reflection](https://github.com/mbahnasy426/Mohamed-Hamed/blob/main/Reflections/ref03.md). I have not documented a Module 3 discussion with another pod or the instructor.

## 6. Who helped me?
AI assistance was used to prepare and explain the code and algebra, and my teammates' published portfolio notes provided useful points of comparison. The database workload and safety claims were independently verified in an execution environment; I still need to execute the repository's runner in VS Code on my own laptop.

## 7. Who did I help or give feedback to?
I have not recorded giving feedback to another group in Module 3. The curiosity list is ready to discuss and exchange when we meet.

## 8. How did I verify AI suggestions?
The script compares the AI-assisted SQL report row-by-row with the course reference, records the query plan, checks that an empty city is excluded by an inner join, and benchmarks the index candidates individually. A parameterized query is checked against an intentionally vulnerable example. See [verification output](../Module03/results.txt).

## 9. Presentation, implementation and contributions
I prepared a self-contained Module 3 implementation and notes in my personal portfolio, including the optional Task 5. I have not documented a presentation or pull request to the course repository. My next step is to run it on my Windows machine and explain the findings without relying on AI.
