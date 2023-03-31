SELECT posts.id, title
    FROM posts JOIN posts_tags ON posts.id = posts_tags.post_id
    JOIN tags ON posts_tags.tag_id = tags.id
    WHERE tags.name = 'travel';