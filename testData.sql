-- Inserting values into: person
INSERT INTO person (first_name, last_name, age)
VALUES
('Iliana', 'Sampson', 14),
('Amela', 'Walker', 13),
('Laurel', 'Simpson', 12),
('Nolan', 'Reynolds', 15),
('Asia', 'Simpson', 18),
('Basia', 'Simpson', 20),
('Oliver', 'Johnson', 34),
('Mia', 'Williams', 22),
('Noah', 'Brown', 25),
('Emma', 'Davis', 19),
('Lucas', 'Garcia', 50),
('Sophia', 'Martinez', 52),
('Liam', 'Hernandez', 60),
('Olivia', 'Lopez', 40);

-- Inserting values into: instrument
INSERT INTO instrument (name_of_ins, type_of_ins, brand)
VALUES
('Piano', 'Keyboard', 'Yamaha'),
('Violin', 'String', 'Stradivarius'),
('Guitar', 'String', 'Fender'),
('Flute', 'Wind', 'Yamaha'),
('Drum Set', 'Percussion', 'Pearl'),
('Trumpet', 'Brass', 'Bach'),
('Clarinet', 'Wind', 'Buffet'),
('Electric Guitar', 'String', 'Gibson'),
('Bass Guitar', 'String', 'Ibanez'),
('Saxophone', 'Wind', 'Selmer'),
('Cello', 'String', 'Yamaha'),
('Triangle', 'Percussion', 'Ludwig'),
('Oboe', 'Wind', 'Yamaha'),
('Trombone', 'Brass', 'Conn'),
('Ukulele', 'String', 'Kala');

-- Inserting values into: cost
INSERT INTO cost (instrument_id, monthly_fee)
VALUES
(1,500),
(2,1000),
(3,1200),
(4,1500),
(5,2000),
(6,2500),
(7,3000),
(8,3500),
(9,4000),
(10,4500),
(11,5000),
(12,5000),
(13,500),
(14,1000),
(15,1200);

-- Inserting values into: phone
INSERT INTO phone (phone_no, person_id)
VALUES
('999-888-7777', 5),
('666-555-4444', 6),
('333-333-3333', 7),
('222-111-0000', 8),
('999-999-0000', 9),
('888-777-6666', 10),
('777-666-5555', 11),
('111-111-2222', 12),
('000-000-1111', 13),
('222-333-4444', 14);

-- Inserting values into: email
INSERT INTO email (email, person_id)
VALUES
('basia.simpson@example.com', 5),
('oliver.johnson@example.com', 6),
('mia.williams@example.com', 7),
('noah.brown@example.com', 8),
('emma.davis@example.com', 9),
('lucas.garcia@example.com', 10),
('sophia.martinez@example.com', 11),
('liam.hernandez@example.com', 12),
('olivia.lopez@example.com', 13),
('ethan.wilson@example.com', 14);

-- Inserting values into: ins_storage
INSERT INTO ins_storage (quantity, location_of_ins, instrument_id)
VALUES
(10, 'Corridor A', 1),
(5, 'Corridor A', 2),
(20, 'Corridor C', 3),
(15, 'Corridor D', 4);

-- Inserting values into: student
INSERT INTO student (person_id)
VALUES
(1 ),
(2 ),
(3 ),
(4 ),
(5);

-- Inserting values into: instructor
INSERT INTO instructor (person_id)
VALUES
(6),
(7),
(8),
(9),
(11);

-- Inserting values into: instructor_knowledge
INSERT INTO instructor_knowledge (instructor_id, instrument_id, genre)
VALUES
(1, 1, 'Classical'),
(1, 2, 'Rock'),
(2, 3, 'Rock'),
(2, 6, 'Jazz'),
(3, 4, 'Classical'),
(3, 7, 'Jazz'),
(3, 10, 'Blues'),
(4, 5, 'jazz'),
(4, 9, 'Funk'),
(4, 8, 'Rock'),
(4, 15, 'Hawaiian');

-- Inserting values into: guardian
INSERT INTO guardian (guardian_id, person_id, relation_type)
VALUES
(12, 1, 'Parent'),
(12, 3, 'Parent'),
(13, 2, 'Guardian'),
(14, 4, 'Guardian');

-- Inserting values into: sibling
INSERT INTO sibling (person_id, sibling_id, relation_type)
VALUES
(1, 2, 'sister'),
(1, 3, 'sister'),
(2, 1, 'sister'),
(2, 3, 'sister'),
(3, 1, 'sister'),
(3, 2, 'sister');

-- Inserting values into: lessons
INSERT INTO lessons (lesson_type, duration, instructor_id)
VALUES
('individual', 60, 1),
('group', 90, 2),
('ensemble', 90, 1),
('individual', 60, 3),
('group', 90, 4),
('ensemble', 90, 2),
('group', 90, 3),
('individual', 60, 4),
('ensemble', 90, 1),
('group', 90, 2),
('individual', 60, 3),
('group', 90, 4);

-- Inserting values into: pricing_for_lesson
INSERT INTO pricing_for_lesson (lesson_id, time_of_pricing, price)
VALUES
(1, '2024-01-01', 500),
(2, '2024-01-01', 750),
(3, '2024-01-01', 1000),
(4, '2024-01-01', 600),
(5, '2024-01-01', 800),
(6, '2024-01-01', 900),
(7, '2024-01-01', 700),
(8, '2024-01-01', 550),
(9, '2024-01-01', 950),
(10, '2024-01-01', 150),
(11, '2024-01-01', 1050),
(12, '2024-01-01', 850);

-- Inserting values into: individual_lesson
INSERT INTO individual_lesson (lesson_id, instrument_id, level_for_lesson)
VALUES
(1, 1, 'beginner'),
(4, 4, 'beginner'),
(8, 5, 'advanced'),
(11, 4, 'beginner');

-- Inserting values into: group_lesson
INSERT INTO group_lesson (lesson_id, student_max, student_min, level_for_lesson, instrument_id)
VALUES
(2, 10, 3, 'intermediate', 6),
(5, 8, 4, 'beginner', 5),
(7, 12, 5, 'advanced', 7),
(10, 15, 5, 'intermediate', 3),
(12, 20, 6, 'beginner', 9);

-- Inserting values into: ensemble_lesson
INSERT INTO ensemble_lesson (lesson_id, genre, student_max, student_min)
VALUES
(3, 'Classical', 15, 5),
(6, 'Jazz', 20, 5),
(9, 'Rock', 25, 8);

-- Inserting values into: want_to_learn
INSERT INTO want_to_learn (student_id, instrument_id, level_for_instrument)
SELECT
    s.student_id,
    i.instrument_id,
    CASE
        WHEN s.student_id = 2 AND i.instrument_id = 6 THEN 'intermediate'
        WHEN s.student_id = 2 AND i.instrument_id = 2 THEN 'intermediate'
        WHEN s.student_id = 3 AND i.instrument_id = 6 THEN 'advanced'
        WHEN s.student_id = 3 AND i.instrument_id = 3 THEN 'advanced'
        WHEN s.student_id = 4 AND i.instrument_id = 5 THEN 'advanced'
        WHEN s.student_id = 3 AND i.instrument_id = 5 THEN 'advanced'
        WHEN s.student_id = 3 AND i.instrument_id = 2 THEN 'advanced'
        WHEN s.student_id = 5 AND i.instrument_id = 1 THEN 'advanced'
        WHEN s.Student_id = 1 AND i.instrument_id = 7 THEN 'advanced'
        WHEN s.Student_id = 3 AND i.instrument_id = 7 THEN 'advanced'
        ELSE 'beginner'
    END AS level_for_instrument
FROM
    student s
CROSS JOIN
    instrument i;

-- Inserting values into: booking (Individual Lessons)
INSERT INTO booking (student_id, booking_status,  date_for_lesson, time_for_lesson, date_of_booking, lesson_id)
VALUES
(1, 'confirmed',  '2024-01-15', '10:00:00', '2024-01-10', 1),
(4, 'confirmed',  '2024-01-20', '11:00:00', '2024-01-15', 4),
(3, 'confirmed',  '2024-01-25', '14:00:00', '2024-01-20', 8),
(5, 'confirmed',  '2024-01-30', '13:00:00', '2024-01-25', 11);

-- Inserting values into: booking (Group Lessons)
INSERT INTO booking (student_id, booking_status, date_for_lesson, time_for_lesson, date_of_booking, lesson_id)
VALUES
(2, 'confirmed',  '2024-02-01', '13:00:00', '2024-01-27', 2),
(3, 'confirmed',  '2024-02-01', '13:00:00', '2024-01-27', 2),
(5, 'confirmed',  '2024-01-20', '11:00:00', '2024-01-15', 5),
(4, 'confirmed', '2024-01-20', '11:00:00', '2024-01-15', 5),
(1, 'confirmed',  '2024-01-22', '12:00:00', '2024-01-18', 7),
(3, 'confirmed',  '2024-01-22', '12:00:00', '2024-01-18', 7);

-- Inserting values into: booking (Ensemble Lessons)
INSERT INTO booking (student_id, booking_status, date_for_lesson, time_for_lesson, date_of_booking, lesson_id)
VALUES
(1, 'confirmed',  '2024-02-05', '15:00:00', '2024-01-30', 3),
(2, 'confirmed',  '2024-02-05', '15:00:00', '2024-01-30', 3),
(4, 'confirmed',  '2024-02-10', '16:00:00', '2024-02-05', 6),
(5, 'confirmed',  '2024-02-10', '16:00:00', '2024-02-05', 6),
(3, 'pending',  '2024-02-15', '14:00:00', '2024-02-10', 9);



-- Inserting values into: renting
INSERT INTO renting (start_date, rental_period, instrument_id, student_id, end_date)
VALUES
('2024-02-01', INTERVAL '3 months', 2, 1, '2024-05-01'),
('2024-03-01', INTERVAL '3 months', 3, 2, '2024-06-01'),
('2024-01-01', INTERVAL '3 months', 1, 1, '2024-07-01');


INSERT INTO payment_per_month (payment_month, amount, renting_id, payment_date, item_type, booking_id)
VALUES
    ('2024-01', 500, 3, '2024-01-01', 'renting', NULL ),
    ('2024-01', 500, NULL, '2024-01-15', 'booking', 1 ),
    ('2024-01', 600, NULL,'2024-01-20', 'booking', 2 ),
    ('2024-01', 550,NULL, '2024-01-25', 'booking', 3 ),
    ('2024-01', 1050,NULL, '2024-01-30', 'booking', 4 ),
    ('2024-01', 800,NULL, '2024-01-20', 'booking', 7 ),
    ('2024-01', 800,NULL, '2024-01-20', 'booking', 8 ),
    ('2024-01', 700,NULL, '2024-01-22', 'booking', 9 ),
    ('2024-01', 700,NULL, '2024-01-22', 'booking', 10 );

INSERT INTO student_bill (student_id, payment_month, payment_item, total_cost, discount)
VALUES
    (5,'2024-01',5, 1050, null),
    (1,'2024-01',8, 630, 0.1),
    (3,'2024-01',4, 495, 0.1),
    (1,'2024-01',1, 450, 0.1),
    (4,'2024-01',7, 800, NULL),
    (1,'2024-01',2, 450, 0.1),
    (4,'2024-01',3, 540, 0.1),
    (3,'2024-01',9, 630, 0.1),
    (5,'2024-01',6, 720, 0.1);

INSERT INTO instructor_earning (instructor_id, payment_month, payment_item, total_earnings)
VALUES
    (3,  '2024-01' , 3 , 600),
    (4,  '2024-01', 4, 550) ,
    (3,  '2024-01', 8, 700),
    (4, '2024-01' , 6 , 800) ,
    ( 4, '2024-01' , 7 , 800) , 
    (1,  '2024-01', 2 , 500) ,
    (3,  '2024-01' , 5 , 1050) ,
    (3,  '2024-01' , 9 , 700) ;