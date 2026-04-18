-- Create a new table called workshop_roster

CREATE TABLE WORKSHOP_ROSTER(
	ROSTER_ID INT PRIMARY KEY,
	CONTACT_EMAIL TEXT UNIQUE NOT NULL,
	DISPLAY_NAME TEXT NOT NULL,
	WANTS_CERITIFICATE BOOLEAN NOT NULL DEFAULT 0,
	START_DATE date NOT NULL,
	LAST_ACTIVITY datetime NOT NULL,
	COMPETITION_SCORE REAL CHECK (COMPETITION_SCORE BETWEEN 0 AND 100),
	GROUP_LABEL TEXT NOT  NULL DEFAULT 'starter'
);

-- Insert exactly 5 rows from the sample table below

INSERT INTO WORKSHOP_ROSTER
VALUES(1, 'mika@campus.com', 'Mika', 1, '2026-04-01', '2026-04-14 08:15:00', 94, 'advanced'),
(2, 'matan@campus.com', 'Matan', 1, '2026-04-05', '2026-04-12 18:20:00', 82, 'advanced'),
(3, 'nora@campus.com', 'Nora', 0, '2026-04-07', '2026-04-09 10:00:00', 74, 'starter'),
(4, 'liam@campus.com', 'Liam', 1, '2026-04-10', '2026-04-15 07:45:00', 88, 'regular'),
(5, 'dana@campus.com', 'Dana', 0, '2026-04-11', '2026-04-11 21:05:00', 69.5, 'starter');

-- Write these SELECT queries using only lesson 2 material:
-- 1) show all rows and all columns

SELECT *
FROM WORKSHOP_ROSTER;

-- 2) show only display_name, contact_email, completion_score

SELECT DISPLAY_NAME, CONTACT_EMAIL, COMPETITION_SCORE
FROM WORKSHOP_ROSTER;

-- 3) show rows where wants_certificate = FALSE and last_activity < '2026-04-10'

SELECT *
FROM WORKSHOP_ROSTER
WHERE WANTS_CERITIFICATE = 0 AND LAST_ACTIVITY < '2026-04-10'

-- 4) show rows where display_name and contact_email both start with m (use LIKE)

SELECT *
FROM WORKSHOP_ROSTER
WHERE DISPLAY_NAME LIKE 'm%' AND CONTACT_EMAIL LIKE 'm%';

-- 5) show rows where completion_score < 85

SELECT *
FROM WORKSHOP_ROSTER
WHERE COMPETITION_SCORE > 85;

-- Try one insert with duplicate contact_email and explain which constraint blocks it

INSERT INTO WORKSHOP_ROSTER
VALUES(6, 'dana@campus.com', 'Avi', 1, '2026-04-09', '2026-04-16 17:45:00', 99, 'advanced');

-- Result: UNIQUE constraint failed: WORKSHOP_ROSTER.CONTACT_EMAIL
--first part is the error type (which CONSTRAINT was causing the error) and the second part is what value it happened- in this case it was because i tried to input a unique value that already exist


-- Try one insert with completion_score = 120 and explain which constraint blocks it

INSERT INTO WORKSHOP_ROSTER
VALUES(6, 'avi@campus.com', 'Avi', 1, '2026-04-09', '2026-04-16 17:45:00', 120, 'advanced');

-- Result: CHECK constraint failed: COMPETITION_SCORE BETWEEN 0 AND 100
-- first part is the error because of check CONSTRAINT, second part is the value which it happend
