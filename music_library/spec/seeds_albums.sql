TRUNCATE TABLE albums RESTART IDENTITY;

INSERT INTO "public"."albums" ("title", "release_year", "artist_id") VALUES ('Doolittle', 1989, 1);
INSERT INTO "public"."albums" ("title", "release_year", "artist_id") VALUES ('Surfer Rosa', 1988, 1);
INSERT INTO "public"."albums" ("title", "release_year", "artist_id") VALUES ('Waterloo', 1974, 2);