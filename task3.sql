
-- 1. Show the number of lessons given per month during a specified year
SELECT
    TO_CHAR(b.date_for_lesson, 'Mon') AS month,  -- Abbreviated month name
    COUNT(*) AS total,  -- Total lessons in that month
    COUNT(CASE WHEN i.lesson_id IS NOT NULL THEN 1 END) AS individual,  -- Count individual lessons
    COUNT(CASE WHEN g.lesson_id IS NOT NULL THEN 1 END) AS group,  -- Count group lessons
    COUNT(CASE WHEN e.lesson_id IS NOT NULL THEN 1 END) AS ensemble  -- Count ensemble lessons
FROM
    booking b
LEFT JOIN individual_lesson i ON b.lesson_id = i.lesson_id  -- Join to individual lessons table
LEFT JOIN group_lesson g ON b.lesson_id = g.lesson_id  -- Join to group lessons table
LEFT JOIN ensemble_lesson e ON b.lesson_id = e.lesson_id  -- Join to ensemble lessons table
WHERE
    EXTRACT(YEAR FROM b.date_for_lesson) = 2024  -- Filter for year
GROUP BY
    TO_CHAR(b.date_for_lesson, 'Mon'),  -- Group by the month (name)
    EXTRACT(MONTH FROM b.date_for_lesson)  -- Ensure months are ordered correctly
ORDER BY
    EXTRACT(MONTH FROM b.date_for_lesson);  -- Order by the month in chronological order


-- 2. Show how many students there are with 0,1 or 2 siblings

    -- First group by the number of siblings.

SELECT    
    num_siblings,
    COUNT(*) AS num_students
FROM (
    SELECT
        stu.person_id,
        -- For each student, count distinct siblings.
        COUNT(CASE
            WHEN sib.sibling_id IS NOT NULL THEN sib.sibling_id
        END) AS num_siblings
    FROM
        student stu
    LEFT JOIN sibling sib
        ON stu.person_id = sib.person_id
    GROUP BY
        stu.person_id
) AS sibling_counts
-- Now group by the number of siblings to count how many students have 0, 1, or 2 siblings
WHERE num_siblings IN (0, 1, 2)
GROUP BY
    num_siblings
ORDER BY
    num_siblings;  -- To ensure results are ordered by number of siblings (0, 1, 2)

