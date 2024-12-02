-- Views 

-- 1. Combines booking and lesson details 
CREATE VIEW BookingDetails AS
SELECT
    b.booking_id,
    b.date_for_lesson,
    b.time_for_lesson,
    b.student_id,
    l.lesson_id,
    l.instructor_id
FROM
    Booking b
JOIN
    Lessons l ON b.lesson_id = l.lesson_id;

-- 3. Ensemble booking details (genre, date, slots)
CREATE VIEW EnsembleLessonBookings AS
SELECT
    e.lesson_id,
    e.genre,
    e.student_max,
    b.date_for_lesson,
    COUNT(b.booking_id) AS booked_count
FROM
    Ensemble_lesson e
JOIN
    BookingDetails b ON e.lesson_id = b.lesson_id
GROUP BY
    e.lesson_id, e.genre, e.student_max, b.date_for_lesson;

-- Q3. List ids and names of all instructors who has given more than a specific number of lessons during the current month
SELECT -- retrives attributes and counts number of lessons given per instructor
    id.instructor_id AS "Instructor Id", 
    id.first_name AS "First Name", 
    id.last_name AS "Last Name", 
    COUNT(bd.booking_id) AS "Number of Lessons"
FROM -- joins all tables to fetch relevant data
    BookingDetails bd
JOIN
    Instructor i ON bd.instructor_id = i.instructor_id
JOIN
    Person p ON i.person_id = p.person_id
WHERE
    date_trunc('month', bd.date_for_lesson) = date_trunc('month', CURRENT_DATE) -- fiter for current month
GROUP BY -- groups by instructor details
    id.instructor_id, id.first_name, id.last_name
HAVING -- will set the min value of no. of lessons
    COUNT(*) > 0 -- can be replaced with any desired specific number
ORDER BY -- organized sorting
    COUNT(*) DESC;



-- Q4. List all ensembles held during the next week
SELECT -- will extract the weekday of the lessons, the genre of the ensemble and calculate no. of seats
    TO_CHAR(elb.date_for_lesson, 'Dy') AS "Day",
    elb.genre AS "Genre",
    CASE
        WHEN (elb.student_max - elb.booked_count) = 0 THEN 'No Seats'
        WHEN (elb.student_max - elb.booked_count) BETWEEN 1 AND 2 THEN '1 or 2 Seats'
        ELSE 'Many Seats'
    END AS "No of Free Seats"
FROM -- joins all tables to fetch relevant data
    EnsembleLessonBookings elb
WHERE 
    elb.date_for_lesson >= CURRENT_DATE
    AND elb.date_for_lesson < CURRENT_DATE + INTERVAL '7 days' -- filter for current week
ORDER BY -- organized sorting
    elb.genre, TO_CHAR(elb.date_for_lesson, 'Dy');
