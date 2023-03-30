TRUNCATE TABLE cohorts, students;

INSERT INTO cohorts (id, name, start_date)
  VALUES (1, 'March 2023', '13-Mar-2023'),
         (2, 'April 2023', '13-Apr-2023');

INSERT INTO students (id, name, cohort_id)
  VALUES (1, 'Tom', 1),
         (2, 'Pablo', 1),
         (3, 'Sunny', 1),
         (4, 'Oana', 1),
         (5, 'Harry', 2),
         (6, 'Ron', 2),
         (7, 'Hermione', 2);