SELECT * FROM users;

SELECT * FROM users WHERE id = 100;

SELECT users.first_name, users.last_name, posts.*
FROM posts INNER JOIN users ON users.id = posts.user_id
WHERE posts.user_id = 200;

SELECT users.username, posts.*
FROM posts INNER JOIN users ON posts.user_id = users.id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

SELECT username
FROM users INNER JOIN posts ON users.id = posts.user_id
WHERE posts.created_at > date '2015-01-01';

SELECT posts.title, posts.content, users.username
FROM posts INNER JOIN users ON users.id = posts.user_id
WHERE users.created_at > date '2015-01-01';

SELECT posts.title AS "Post Title", comments.*
FROM comments INNER JOIN posts ON posts.id = comments.post_id;

SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
FROM comments INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at < date '2015-01-01';

SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
FROM comments INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at > date '2015-01-01';

SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
FROM comments INNER JOIN posts ON comments.post_id = posts.id
WHERE comments.body LIKE '%USB%';