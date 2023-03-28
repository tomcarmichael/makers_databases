CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name TEXT,
  avg_cooking_time int,
  rating SMALLINT
    check (rating <= 5) check (rating >= 1)
);