BEGIN;

TRUNCATE
  "word",
  "language",
  "user";

INSERT INTO "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    'admin',
    'ADMIN',
    -- password = "pass"
    '$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG'
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'Hmong', 1);

INSERT INTO "word" ("id", "language_id", "original", "translation", "next")
VALUES
  (1, 1, 'yeej tsis', 'never', 2),
  (2, 1, 'mus', 'gonna', 3),
  (3, 1, 'muab', 'give', 4),
  (4, 1, 'koj', 'you', 5),
  (5, 1, 'up', 'up', 6),
  (6, 1, 'cia', 'let', 7),
  (7, 1, 'lawm os', 'down', 8),
  (8, 1, 'khiav', 'run', 9),
  (9, 1, 'ib ncig', 'around', 10),
  (10, 1, 'thiab', 'and', 11),
  (11, 1, 'suab puam', 'desert', null);

UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('user_id_seq', (SELECT MAX(id) from "user"));

COMMIT;
