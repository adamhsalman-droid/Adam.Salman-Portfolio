# Module 06b — Engine notes and one-page decision record

**Owner:** Adam Salman · **Case:** Kortmann plant.  
Sources: [Module 6b instructions](https://github.com/iotempire/iotempire-teaching/blob/main/full-classes/hsbi-databases-10d/modules/06b-polyglot-persistence.md), [Module 4 evidence](../Module04/results.txt), [Module 5 evidence](../Module05/results.txt), [Module 6a memo](../Module06a/memo.md), and [Module 6b experiment output](results.txt).

## Task 1 — server boundary (pending classroom lab)

The shared PostgreSQL bench requires instructor-provided LMS access and an actual two-writer/server-stop demonstration. **Not performed**; do not claim instructor observation.

Three *expectations*, to replace with direct observations:
1. **Easier:** users on separate machines can reach one central data source, with server-side permissions.
2. **Harder:** credentials, network latency, deployment, monitoring and reliable backup.
3. **New failure mode:** a server or network outage can stop all remote clients even if their SQL is correct; a standalone embedded SQLite file has no dependency on that remote process.

**Permitted fallback actually tested:** two SQLite connections update the same row. The second write fails with `database is locked` while the first holds `BEGIN IMMEDIATE`, and after commit/retry `parts_produced=2`. This is not evidence about PostgreSQL's wait or lost-update behavior; an actual PostgreSQL demonstration still needs recording. The SQL `UPDATE machine SET parts_produced = parts_produced + 1 WHERE machine_id = 1` avoids an application-side read–modify–write race.

## Task 2 — JSON and key–value comparison

- **Why the vendor index works only in one query:** SQLite expression indexes are based on the *expression written in the query*. An index on `json_extract(meta, '$.vendor')` matches that expression and returns `SEARCH`; the semantically equivalent `meta ->> 'vendor'` is another expression and returns `SCAN`. [Measured plans](results.txt).
- **Why flexible JSON is still designed:** `CHECK(json_valid(meta))` rejected malformed JSON. JSON can add unknown vendor attributes without a migration. Frequently filtered stable fields could later become typed generated columns; arbitrary JSON keys need application documentation and deliberate indexes.
- **Session state choice:** `shelve` is easy for Python key lookup but has no SQL grouping; a SQLite primary-key table handles both lookup and cross-session analysis. Separate measured timings on the 20,000-key test host: shelve set/get **3.957/0.100 s**; SQLite set/get **0.027/0.095 s**. SQLite's writes used one batch transaction and shelve used `dbm.sqlite3`, so the large write difference must not be interpreted as pure engine superiority. The four grouping buckets each had 5,000 sessions and 25 distinct users.

### ACID, BASE, CAP in this portfolio

- **ACID:** Module 4's replay-safe UPSERT kept 11 readings after two CSV ingestions and rejected broken values via constraints. Transactional atomicity/isolation/durability matter for the source of truth.
- **BASE / eventual consistency analogy:** The nightly Parquet export proposed in Module 6a is a *potentially stale derived copy*, not itself a distributed BASE database. A new operational row may be absent until refresh. That is an eventual-freshness trade-off, not proof of BASE guarantees.
- **CAP:** CAP addresses consistency versus availability **during a network partition in a distributed system**. Single-file SQLite is not a distributed CAP system; one remotely accessed PostgreSQL server adds availability dependence on a network but is not automatically an AP/CP distributed cluster. A future replicated setup would need an explicit partition policy.

## One-page engine decision record

| Workload | Engine | Why / course evidence | Cost accepted | If unavailable or stale |
|---|---|---|---|---|
| Sensor/job ingest every 30 s | **SQLite** | Module 4's constraints rejected bad data; replaying CSV twice left **11 total rows and zero duplicate natural keys** | Single-writer coordination, backups | Treat as authoritative; retry transactions safely, never replace it with an unchecked copy |
| Month-end report over two years | **DuckDB reading checked Parquet copy** | Module 6a implemented an equivalent 2M-row history and comparison runner, but own-device performance measurements are **pending**; the professor's *reference example* is approx. **600 ms vs 6 ms** (not Adam's result). Module 5 *did* measure 57.603 ms for its 200k-row report query on a different workload | Separate snapshot, scheduled refresh, reconciliation, freshness timestamp | Missing or stale shift distorts report; keep last validated copy and show an “as of” time |
| Vendor metadata with changing fields | **SQLite JSON column** | 1,000-device generated dataset; malformed JSON rejected, new field read without migration; expression-index query **SEARCH** vs shorthand **SCAN** on 334 matching vendors | Weaker field-level typing; must match expression when filtering | Validate incoming JSON; stable promoted keys may need migration/index management |
| Dashboard session state | **SQLite key–value table** | This test environment: 20,000 keys, SQLite 0.027 s write / 0.095 s read, shelve 3.957 s write / 0.100 s read; `GROUP BY` across sessions possible | A SQL schema and explicit transaction management | Sessions can expire and be recreated; ensure TTL/privacy policy in production |
| Optional concurrent network users | **PostgreSQL server** *if required* | Shared-server timing and lock observation **not performed**; local fallback showed a second SQLite writer being blocked | Network, authentication, deployment and outage risk | Server/network failure affects all remote users; use failover/retry plans if the requirement merits the cost |

**If Kortmann could run only one engine:** **SQLite.** It offers transactions, integrity checks, flexible JSON, and indexed lookups without additional server operations. **The first workload to suffer would be long historical reports** competing with operational writes; Module 6a proposes moving those scans to a checked Parquet copy, but its own-device speedup remains to be measured. At greater network-user concurrency, a server also becomes worth considering.

## Defence questions / change log

- Which engine choice is supported by actual *Adam* measurements, which by this execution environment, and which by instructor reference?
- Who refreshes Parquet, checks counts and price totals, and publishes a freshness timestamp?
- What happens with two simultaneous writers, and how do transactions prevent double counting?
- Why not several spreadsheets? We need constraints, joins, reproducible imports, audit and reliable queries.
- **Pod defence:** not yet performed. After a real cross-pod exchange, record the other pod's question, one changed decision row (if any), and why it changed.
- **Still missing:** own-device key-value results and Module 6a benchmark; instructor's PostgreSQL session; real peer defence.
