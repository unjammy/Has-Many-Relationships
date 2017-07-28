DROP USER IF EXISTS has_many_user;
DROP DATABASE IF EXISTS has_many_blogs;

CREATE USER has_many_user;
CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\connect has_many_blogs

CREATE TABLE users (
  id SERIAL NOT NULL,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) DEFAULT NULL,
  last_name VARCHAR(90) DEFAULT NULL,
  created_at time NOT NULL DEFAULT now(),
  updated_at time NOT NULL DEFAULT now(),
  PRIMARY KEY (id)
);

CREATE TABLE posts(
  id SERIAL NOT NULL,
  title VARCHAR(180) DEFAULT NULL,
  url VARCHAR(510) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  created_at time NOT NULL DEFAULT now(),
  updated_at time NOT NULL DEFAULT now(),
  user_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE comments (
  id SERIAL NOT NULL,
  body VARCHAR(510) DEFAULT NULL,
  created_at time NOT NULL DEFAULT now(),
  updated_at time NOT NULL DEFAULT now(),
  user_id INTEGER,
  post_id INTEGER
  PRIMARY KEY (id),
  FOREIGN KEY (user_id, post_id) REFERENCES users (id), posts (id)
);

\i scripts/blog_data.sql


