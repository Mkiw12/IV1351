
-- 1. Create view for the number of lessons given per month during a specified year

CREATE VIEW lessons_per_month AS
SELECT
    EXTRACT(YEAR FROM b.date_for_lesson) AS year,
    EXTRACT(MONTH FROM b.date_for_lesson) AS month,
    COUNT(*) AS total_lessons,
    COUNT(CASE WHEN i.lesson_id IS NOT NULL THEN 1 END) AS individual_lessons,
    COUNT(CASE WHEN g.lesson_id IS NOT NULL THEN 1 END) AS group_lessons,
    COUNT(CASE WHEN e.lesson_id IS NOT NULL THEN 1 END) AS ensemble_lessons
FROM
    booking b
LEFT JOIN individual_lesson i ON b.lesson_id = i.lesson_id
LEFT JOIN group_lesson g ON b.lesson_id = g.lesson_id
LEFT JOIN ensemble_lesson e ON b.lesson_id = e.lesson_id
GROUP BY
    EXTRACT(YEAR FROM b.date_for_lesson),
    EXTRACT(MONTH FROM b.date_for_lesson);

-- Query to run based on the created view 

SELECT 
    month, 
    total_lessons, 
    individual_lessons, 
    group_lessons, 
    ensemble_lessons
FROM lessons_per_month
WHERE year = 2024
ORDER BY month;



-- 2. Create materialized view to show how many students there are with 0,1 or 2 siblings

CREATE MATERIALIZED VIEW student_sibling_counts AS
SELECT
    stu.person_id,
    COUNT(CASE WHEN sib.sibling_id IS NOT NULL THEN sib.sibling_id END) AS num_siblings
FROM
    student stu
LEFT JOIN sibling sib ON stu.person_id = sib.person_id
GROUP BY
    stu.person_id;

-- Query to run based on the created materialized view
SELECT 
    num_siblings, 
    COUNT(*) AS num_students
FROM student_sibling_counts
GROUP BY num_siblings
ORDER BY num_siblings;

