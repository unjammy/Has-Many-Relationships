DROP USER IF EXISTS has_many_user;
DROP DATABASE IF EXISTS has_many_blogs;

CREATE USER has_many_user;
CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\connect has_many_blogs

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) DEFAULT NULL,
  last_name VARCHAR(90) DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now()
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(180) DEFAULT NULL,
  url VARCHAR(510) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now(),
  user_id INTEGER REFERENCES users (id)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY NOT NULL,
  body VARCHAR(510) DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now(),
  user_id INTEGER REFERENCES users (id),
  post_id INTEGER REFERENCES posts (id)
);

\i scripts/blog_data.sql

