# Single Table Design Recipe Template

## 1. Extract nouns from the user stories or specification

```
As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).
```

```
Nouns:

recipe, name, average cooking time, rating
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record        | Properties                        |
| ------------- | ------------------                |
| recipe        | name, average cooking time, rating|

Name of the table (always plural): `recipes` 

Column names: `name`, `avg_cooking_time`, `rating`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

id: SERIAL
name: text
avg_cooking_time: int
rating: smallint

```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: recipes_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name TEXT,
  avg_cooking_time int,
  rating SMALLINT
    check (rating <= 5) check (rating >= 1)
);
```

## 5. Create the table.

```bash
psql -h 127.0.0.1 database_name < recipes_table.sql
```


