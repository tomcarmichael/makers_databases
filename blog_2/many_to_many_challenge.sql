-- Use SQL to insert a new tag 'sql' and associate the post titled 'SQL basics' with this tag.
-- Then use a SELECT query with a JOIN to retrieve all posts associated with the tag 'sql' and
-- verify the above worked.

INSERT INTO tags (name) VALUES ('sql');
INSERT INTO posts_tags (tag_id, post_id) VALUES (5, 7);
SELECT posts.id, title FROM posts
    JOIN posts_tags ON post_id = posts.id
    JOIN tags ON tag_id = tags.id
        WHERE name = 'sql';



