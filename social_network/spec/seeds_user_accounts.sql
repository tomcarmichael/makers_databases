TRUNCATE TABLE user_accounts, posts RESTART IDENTITY;

INSERT INTO user_accounts ("username", "email") VALUES
('dave', 'dave@gmail.com'),
('john_lennon', 'dayinthelife@gmail.com');

INSERT INTO posts ("title", "content", "views", "user_account_id") VALUES
('Complaint', 'TDD is really annoying', 500, 1),
('Oh Yoko', 'My love will turn you on', 50000, 2);