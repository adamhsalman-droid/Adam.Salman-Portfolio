-- Example shell-tour dataset.
-- To meet Task 4, replace or confirm this using sqlite3 .dump of your own tour.db.
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE reading(machine TEXT, vib REAL);
INSERT INTO reading VALUES('cnc-01',1.2);
INSERT INTO reading VALUES('cnc-02',2.4);
INSERT INTO reading VALUES('cnc-01',0.9);
COMMIT;
