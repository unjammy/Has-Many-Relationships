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
  updated_at time NOT NULL DEFAULT now()
);

CREATE TABLE posts(
  id SERIAL NOT NULL,
  title VARCHAR(180) DEFAULT NULL,
  url VARCHAR(510) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  created_at time NOT NULL DEFAULT now(),
  updated_at time NOT NULL DEFAULT now()
);

\i scripts/blog_data.sql


