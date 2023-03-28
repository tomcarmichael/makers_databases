TRUNCATE TABLE recipes RESTART IDENTITY;

INSERT INTO recipes ("name", "avg_cooking_time", "rating") VALUES
('Curry', 90, 4),
('Daal', 60, 3),
('Salad', 15, 2),
('Lasagne', 120, 5);
