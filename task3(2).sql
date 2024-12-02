-- Hardcoded data to get output in the query tables 

-- Bookings for November 2024
INSERT INTO Booking (student_id, booking_status, date_for_lesson, time_for_lesson, date_of_booking, lesson_id)
VALUES
-- Week 1 (Nov 1 - Nov 7)
(1, 'confirmed', '2024-11-01', '10:00:00', '2024-10-30', 1),
(2, 'confirmed', '2024-11-02', '11:00:00', '2024-10-31', 2),
(3, 'confirmed', '2024-11-03', '14:00:00', '2024-11-01', 3),
(4, 'confirmed', '2024-11-04', '13:00:00', '2024-11-01', 4),
(5, 'confirmed', '2024-11-05', '12:00:00', '2024-11-02', 5),
(1, 'confirmed', '2024-11-06', '15:00:00', '2024-11-03', 6),

-- Week 2 (Nov 8 - Nov 14)
(2, 'confirmed', '2024-11-08', '10:00:00', '2024-11-05', 7),
(3, 'confirmed', '2024-11-09', '11:00:00', '2024-11-06', 8),
(4, 'confirmed', '2024-11-10', '14:00:00', '2024-11-07', 9),
(5, 'confirmed', '2024-11-11', '13:00:00', '2024-11-08', 10),
(1, 'confirmed', '2024-11-12', '12:00:00', '2024-11-09', 11),
(2, 'confirmed', '2024-11-13', '15:00:00', '2024-11-10', 12),

-- Week 3 (Nov 15 - Nov 21)
(3, 'confirmed', '2024-11-15', '10:00:00', '2024-11-12', 1),
(4, 'confirmed', '2024-11-16', '11:00:00', '2024-11-13', 2),
(5, 'confirmed', '2024-11-17', '14:00:00', '2024-11-14', 3),
(1, 'confirmed', '2024-11-18', '13:00:00', '2024-11-15', 4),
(2, 'confirmed', '2024-11-19', '12:00:00', '2024-11-16', 5),
(3, 'confirmed', '2024-11-20', '15:00:00', '2024-11-17', 6),

-- Week 4 (Nov 22 - Nov 30)
(4, 'confirmed', '2024-11-22', '10:00:00', '2024-11-19', 7),
(5, 'confirmed', '2024-11-23', '11:00:00', '2024-11-20', 8),
(1, 'confirmed', '2024-11-24', '14:00:00', '2024-11-21', 9),
(2, 'confirmed', '2024-11-25', '13:00:00', '2024-11-22', 10),
(3, 'confirmed', '2024-11-26', '12:00:00', '2024-11-23', 11),
(4, 'confirmed', '2024-11-27', '15:00:00', '2024-11-24', 12);

-- Bookings for December 2024
INSERT INTO Booking (student_id, booking_status, date_for_lesson, time_for_lesson, date_of_booking, lesson_id)
VALUES
-- Week 1 (Dec 1 - Dec 7)
(5, 'confirmed', '2024-12-01', '10:00:00', '2024-11-28', 1),
(1, 'confirmed', '2024-12-02', '11:00:00', '2024-11-29', 2),
(2, 'confirmed', '2024-12-03', '14:00:00', '2024-11-30', 3),
(3, 'confirmed', '2024-12-04', '13:00:00', '2024-12-01', 4),
(4, 'confirmed', '2024-12-05', '12:00:00', '2024-12-02', 5),
(5, 'confirmed', '2024-12-06', '15:00:00', '2024-12-03', 6),

-- Week 2 (Dec 8 - Dec 14)
(1, 'confirmed', '2024-12-08', '10:00:00', '2024-12-05', 7),
(2, 'confirmed', '2024-12-09', '11:00:00', '2024-12-06', 8),
(3, 'confirmed', '2024-12-10', '14:00:00', '2024-12-07', 9),
(4, 'confirmed', '2024-12-11', '13:00:00', '2024-12-08', 10),
(5, 'confirmed', '2024-12-12', '12:00:00', '2024-12-09', 11),
(1, 'confirmed', '2024-12-13', '15:00:00', '2024-12-10', 12),

-- Week 3 (Dec 15 - Dec 21)
(2, 'confirmed', '2024-12-15', '10:00:00', '2024-12-12', 1),
(3, 'confirmed', '2024-12-16', '11:00:00', '2024-12-13', 2),
(4, 'confirmed', '2024-12-17', '14:00:00', '2024-12-14', 3),
(5, 'confirmed', '2024-12-18', '13:00:00', '2024-12-15', 4),
(1, 'confirmed', '2024-12-19', '12:00:00', '2024-12-16', 5),
(2, 'confirmed', '2024-12-20', '15:00:00', '2024-12-17', 6),

-- Week 4 (Dec 22 - Dec 31)
(3, 'confirmed', '2024-12-22', '10:00:00', '2024-12-19', 7),
(4, 'confirmed', '2024-12-23', '11:00:00', '2024-12-20', 8),
(5, 'confirmed', '2024-12-24', '14:00:00', '2024-12-21', 9),
(1, 'confirmed', '2024-12-25', '13:00:00', '2024-12-22', 10),
(2, 'confirmed', '2024-12-26', '12:00:00', '2024-12-23', 11),
(3, 'confirmed', '2024-12-27', '15:00:00', '2024-12-24', 12);


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


-- 2. Instructor details
CREATE VIEW InstructorDetails AS
SELECT
    ins.instructor_id,
    p.first_name,
    p.last_name
FROM
    Instructor ins
JOIN
    Person p ON ins.person_id = p.person_id;

-- 3. Ensemble booking details (genre, date, slots)
CREATE VIEW EnsembleLessonBookings AS
SELECT
    e.lesson_id,
    e.genre,
    e.student_max,
    b.date_for_lesson,
    COUNT(b.booking_id) AS booked_count
FROM
    ensemble_lesson e
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
    InstructorDetails id
JOIN 
    BookingDetails bd USING (instructor_id)
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
