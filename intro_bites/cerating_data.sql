INSERT INTO albums (title, release_year) VALUES ('Mezzanine', 1998);
UPDATE ALBUMS SET artist_id = 5 WHERE title = 'Mezzanine';

INSERT INTO artists (name, genre) VALUES ('D Angelo', 'Neo-soul');
UPDATE artists SET name = 'D''Angelo' WHERE genre = 'Neo-soul';
INSERT INTO albums (title, release_year, artist_id) VALUES ('Voodoo', 2000, 6);
SELECT * FROM albums;