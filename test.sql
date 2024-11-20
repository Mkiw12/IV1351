DROP TABLE IF EXISTS payment_per_month, want_to_learn, sibling, guardian, student, instructor, person,
phone, email, lessons, individual_lesson, group_lesson, ensemble_lesson, booking, renting, ins_storage,
instrument, cost,instructor_knowledge , want_to_learn, pricing_for_lesson, student_bill, instructor_earning CASCADE;



CREATE TABLE instrument (
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 name_of_ins VARCHAR(50) NOT NULL,
 type_of_ins VARCHAR(50) NOT NULL,
 brand VARCHAR(50) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);







CREATE TABLE person (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 first_name VARCHAR(10) NOT NULL,
 last_name VARCHAR(10) NOT NULL,
 age INT NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_id);


CREATE TABLE phone (
 phone_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_no VARCHAR(100) NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (phone_id);



CREATE TABLE sibling (
 person_id INT NOT NULL,
 sibling_id INT NOT NULL,
 relation_type VARCHAR(100) NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (person_id,sibling_id);


CREATE TABLE student (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);



CREATE TABLE want_to_learn (
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 level_for_instrument VARCHAR(50)
);

ALTER TABLE want_to_learn ADD CONSTRAINT PK_want_to_learn PRIMARY KEY (student_id,instrument_id);


CREATE TABLE cost (
 instrument_id INT NOT NULL,
 monthly_fee INT NOT NULL
);

ALTER TABLE cost ADD CONSTRAINT PK_cost PRIMARY KEY (instrument_id);


CREATE TABLE email (
 email_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email VARCHAR(500) NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (email_id);


CREATE TABLE Guardian (
 person_id INT NOT NULL,
 guardian_id INT NOT NULL,
 relation_type VARCHAR(100) NOT NULL
);

ALTER TABLE Guardian ADD CONSTRAINT PK_Guardian PRIMARY KEY (person_id,guardian_id);


CREATE TABLE ins_storage (
 instrument_id INT NOT NULL,
 quantity INT NOT NULL,
 location_of_stor VARCHAR(500) NOT NULL
);

ALTER TABLE ins_storage ADD CONSTRAINT PK_ins_storage PRIMARY KEY (instrument_id);


CREATE TABLE instructor (
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_knowledge (
 instructor_id INT NOT NULL,
 genre VARCHAR(50) NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE instructor_knowledge ADD CONSTRAINT PK_instructor_knowledge PRIMARY KEY (instructor_id, instrument_id);


CREATE TABLE lessons (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_type VARCHAR(500) NOT NULL,
 duration INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE lessons ADD CONSTRAINT PK_lessons PRIMARY KEY (lesson_id);


CREATE TABLE pricing_for_lesson (
 lesson_id INT NOT NULL,
 time_of_pricing DATE NOT NULL,
 price INT NOT NULL
);

ALTER TABLE pricing_for_lesson ADD CONSTRAINT PK_pricing_for_lesson PRIMARY KEY (lesson_id);


CREATE TABLE renting (
 renting_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL,
 student_id INT NOT NULL,
 rental_cost INT NOT NULL,
 instrument_id INT NOT NULL,
 rental_period INTERVAL(6)
);

ALTER TABLE renting ADD CONSTRAINT PK_renting PRIMARY KEY (renting_id);


CREATE TABLE booking (
 booking_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 booking_status VARCHAR(50) NOT NULL,
 booking_price INT NOT NULL,
 date_for_lesson DATE NOT NULL,
 time_for_lesson TIME(6) NOT NULL,
 date_of_booking DATE NOT NULL,
 student_id INT NOT NULL,
 lesson_id INT
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (booking_id);


CREATE TABLE ensemble_lesson (
 lesson_id INT NOT NULL,
 genre VARCHAR(50) NOT NULL,
 student_max INT NOT NULL,
 student_min INT NOT NULL
);

ALTER TABLE ensemble_lesson ADD CONSTRAINT PK_ensemble_lesson PRIMARY KEY (lesson_id);


CREATE TABLE group_lesson (
 lesson_id INT NOT NULL,
 student_max INT NOT NULL,
 student_min INT NOT NULL,
 instrument_id INT NOT NULL,
 level_for_lesson VARCHAR(50) NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE individual_lesson (
 lesson_id INT NOT NULL,
 instrument_id INT NOT NULL,
 level_for_lesson VARCHAR(50) NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_id);


CREATE TABLE payment_per_month (
 payment_month VARCHAR(10) NOT NULL,
 payment_item INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 amount INT NOT NULL,
 renting_id INT,
 payment_date DATE NOT NULL,
 item_type CHAR(10) NOT NULL,
 booking_id INT
);

ALTER TABLE payment_per_month ADD CONSTRAINT PK_payment_per_month PRIMARY KEY (payment_month,payment_item);


CREATE TABLE student_bill (
 student_id INT NOT NULL,
 payment_month VARCHAR(10) NOT NULL,
 payment_item INT NOT NULL,
 total_cost INT NOT NULL
);

ALTER TABLE student_bill ADD CONSTRAINT PK_student_bill PRIMARY KEY (student_id,payment_month,payment_item);


CREATE TABLE instructor_earning (
 instructor_id INT NOT NULL,
 payment_month VARCHAR(10) NOT NULL,
 payment_item INT NOT NULL,
 total_earnings INT NOT NULL
);

ALTER TABLE instructor_earning ADD CONSTRAINT PK_instructor_earning PRIMARY KEY (instructor_id,payment_month,payment_item);


ALTER TABLE phone ADD CONSTRAINT FK_phone_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (person_id) REFERENCES person (person_id);
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (sibling_id) REFERENCES person (person_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE want_to_learn ADD CONSTRAINT FK_want_to_learn_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE want_to_learn ADD CONSTRAINT FK_want_to_learn_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE cost ADD CONSTRAINT FK_cost_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE email ADD CONSTRAINT FK_email_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE Guardian ADD CONSTRAINT FK_Guardian_0 FOREIGN KEY (person_id) REFERENCES person (person_id);
ALTER TABLE Guardian ADD CONSTRAINT FK_Guardian_1 FOREIGN KEY (guardian_id) REFERENCES person (person_id);


ALTER TABLE ins_storage ADD CONSTRAINT FK_ins_storage_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (person_id);


ALTER TABLE instructor_knowledge ADD CONSTRAINT FK_instructor_knowledge_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE instructor_knowledge ADD CONSTRAINT FK_instructor_knowledge_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE lessons ADD CONSTRAINT FK_lessons_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE pricing_for_lesson ADD CONSTRAINT FK_pricing_for_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id);


ALTER TABLE renting ADD CONSTRAINT FK_renting_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE renting ADD CONSTRAINT FK_renting_1 FOREIGN KEY (instrument_id) REFERENCES ins_storage (instrument_id);


ALTER TABLE booking ADD CONSTRAINT FK_booking_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_1 FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id);


ALTER TABLE ensemble_lesson ADD CONSTRAINT FK_ensemble_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE payment_per_month ADD CONSTRAINT FK_payment_per_month_0 FOREIGN KEY (renting_id) REFERENCES renting (renting_id);
ALTER TABLE payment_per_month ADD CONSTRAINT FK_payment_per_month_1 FOREIGN KEY (booking_id) REFERENCES booking (booking_id);


ALTER TABLE student_bill ADD CONSTRAINT FK_student_bill_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student_bill ADD CONSTRAINT FK_student_bill_1 FOREIGN KEY (payment_month,payment_item) REFERENCES payment_per_month (payment_month,payment_item);


ALTER TABLE instructor_earning ADD CONSTRAINT FK_instructor_earning_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE instructor_earning ADD CONSTRAINT FK_instructor_earning_1 FOREIGN KEY (payment_month,payment_item) REFERENCES payment_per_month (payment_month,payment_item);


CREATE OR REPLACE FUNCTION set_booking_price()
RETURNS TRIGGER AS $$
BEGIN
-- Fetch the current price for the lesson
SELECT price INTO NEW.booking_price
FROM pricing_for_lesson
WHERE lesson_id = NEW.lesson_id;

-- Ensure that the price is set
IF NEW.booking_price IS NULL THEN
RAISE EXCEPTION 'No price found for lesson_id %', NEW.lesson_id;
END IF;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: before_booking_insert
-- Purpose: This trigger invokes the associated function to validate data integrity or enforce rules.
CREATE TRIGGER before_booking_insert
BEFORE INSERT ON booking
FOR EACH ROW
EXECUTE FUNCTION set_booking_price();

-- Function: FUNCTION
-- Purpose: This function ensures specific business rules are met when interacting with the database.
CREATE OR REPLACE FUNCTION set_rental_cost()
RETURNS TRIGGER AS $$
BEGIN
-- Fetch the rental cost from the cost table for the given instrument_id
SELECT monthly_fee INTO NEW.rental_cost
FROM cost
WHERE cost.instrument_id = NEW.instrument_id;

-- Ensure the rental cost is set before inserting
IF NEW.rental_cost IS NULL THEN
RAISE EXCEPTION 'Rental cost could not be determined for instrument_id %', NEW.instrument_id;
END IF;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: before_renting_insert
-- Purpose: This trigger invokes the associated function to validate data integrity or enforce rules.
CREATE TRIGGER before_renting_insert
BEFORE INSERT ON renting
FOR EACH ROW
EXECUTE FUNCTION set_rental_cost();