
CREATE TABLE recipes (
    id INTEGER UNIQUE PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(150) NOT NULL,
    slug VARCHAR(150) NOT NULL UNIQUE,
    content TEXT DEFAULT 'Hello' NOT NULL,
    duration SMALLINT DEFAULT 10 NOT NULL,
    online BOOLEAN,
    created_at DATETIME
);

CREATE TABLE IF NOT EXISTS recipes (
    id INTEGER UNIQUE PRIMARY KEY  AUTOINCREMENT NOT NULL,
    title VARCHAR(150) NOT NULL,
    slug VARCHAR(50) NOT NULL UNIQUE,
    content TEXT,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS categories (
    id INTEGER UNIQUE PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(150),
    description TEXT
);

DROP TABLE recipes;

INSERT INTO recipes (
    title,
    content,
    slug,
    duration,
    online,
    created_at
) values (
    'salade',
    'contenu de test',
    'salade',
    10,
    FALSE,
    CURRENT_TIMESTAMP
), (
    'soupe2',
    'contenu de test',
    'soupe',
    20,
    FALSE,
    CURRENT_TIMESTAMP
);

SELECT *
FROM recipes
WHERE slug = 'soupe';

SELECT *
FROM recipes
WHERE duration BETWEEN 10 AND 30;


SELECT *
FROM recipes
WHERE slug LIKE '%ade%';

UPDATE recipes SET duration = 10 WHERE slug LIKE 'sou%';

DELETE FROM recipes WHERE title = 'soupe';

EXPLAIN QUERY PLAN UPDATE recipes SET duration = 10 WHERE id = 2;

CREATE UNIQUE INDEX idx_slug ON recipes (slug);

DROP INDEX idx_slug;

SELECT *
FROM recipes r
JOIN categories C ON r.category_id = c.id;
