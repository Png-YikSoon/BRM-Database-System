/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--Student ID: 34600329
--Student Name: P'ng Yik Soon

/*
Indicate if AI was used (Yes/No): Yes

If AI was used:
I used Gemini (https://gemini.google.com/) for populating sample data only for this task

I used these prompts:
EMPLOYEE — at least 10 entries:

At least 2 managers, 2 truck dispatchers, 1 mechanic and 2 drivers

QUOTE — at least 30 entries:

At least 5 different customers and 2 truck dispatchers
At least 2 customers who place at minimum 2 quotes

JOB — at least 20 entries:

At least 10 truck/trailer combinations used
At least 5 truck/trailer combinations used in at least 2 jobs
At least 2 quotes that have never been placed as job
At least 5 jobs that have slightly higher or lower cost than the quote
At least 5 jobs that have the same cost as the quote

Rules:

Treat all data as a single transaction (one COMMIT at end)
Primary key values hardcoded below 100
Dates between 01-May-2026 and 31-Jul-2026
Data must be sensible (drop-off after pickup, only drivers can drive, job aligns with quote)
*/

--------------------------------------
--INSERT INTO employee
--------------------------------------

-- Manager 1: Sarah Mitchell (required by Task 3)
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (1, 'Sarah', 'Mitchell', '0411111001', NULL, 'B', NULL);

-- Manager 2: James Rodriguez
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (2, 'James', 'Rodriguez', '0411111002', NULL, 'B', NULL);

-- Truck Dispatcher 1: Emily Chen - reports to Sarah Mitchell
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (10, 'Emily', 'Chen', '0422222010', NULL, 'T', 1);

-- Truck Dispatcher 2: Marcus Thompson - reports to Sarah Mitchell
-- This dispatcher is used for multiple quotes to satisfy T5(b) jobs_dispatched count
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (11, 'Marcus', 'Thompson', '0422222011', NULL, 'T', 1);

-- Mechanic: Jennifer - reports to James Rodriguez
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (21, 'Jennifer', 'Adams', '0433333021', NULL, 'M', 2);

-- Driver 1: Michael Johnson (required by Task 3) - reports to James Rodriguez
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (30, 'Michael', 'Johnson', '0444444030', 'DL123456789', 'D', 2);

-- Driver 2: Lisa Anderson - reports to James Rodriguez
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (31, 'Lisa', 'Anderson', '0444444031', 'DL987654321', 'D', 2);

-- Driver 3: David Wilson - reports to Sarah Mitchell
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (32, 'David', 'Wilson', '0444444032', 'DL456789123', 'D', 1);

-- Driver 4: Priya Patel - reports to Sarah Mitchell
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (33, 'Priya', 'Patel', '0444444033', 'DL321654987', 'D', 1);

-- Mechanic 2: Tom Nguyen - reports to James Rodriguez
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (22, 'Tom', 'Nguyen', '0433333022', NULL, 'M', 2);


--------------------------------------
--INSERT INTO quote
--------------------------------------
-- Quotes for cust_no 5 (Jack Ethan, Brisbane) - multiple quotes
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (1, TO_DATE('01-May-2026','dd-Mon-yyyy'), TO_DATE('10-May-2026','dd-Mon-yyyy'),
        '61 Ann Street, Brisbane QLD 4101', '23 Murray Street, Perth WA 6000',
        1500.00, 5, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (2, TO_DATE('02-May-2026','dd-Mon-yyyy'), TO_DATE('12-May-2026','dd-Mon-yyyy'),
        '61 Ann Street, Brisbane QLD 4101', '55 Lonsdale Street, Melbourne VIC 3008',
        1800.00, 5, 11);

-- quote_no 1 and 2 are intentionally left WITHOUT jobs (unfulfilled)

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (3, TO_DATE('01-May-2026','dd-Mon-yyyy'), TO_DATE('10-May-2026','dd-Mon-yyyy'),
        '61 Ann Street, Brisbane QLD 4101', '101 Pitt Street, Sydney NSW 2010',
        900.00, 5, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (4, TO_DATE('02-May-2026','dd-Mon-yyyy'), TO_DATE('11-May-2026','dd-Mon-yyyy'),
        '61 Ann Street, Brisbane QLD 4101', '78 Hay Street, Perth WA 6003',
        2100.00, 5, 11);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (5, TO_DATE('03-May-2026','dd-Mon-yyyy'), TO_DATE('12-May-2026','dd-Mon-yyyy'),
        '61 Ann Street, Brisbane QLD 4101', '42 Collins Street, Melbourne VIC 3000',
        2500.00, 5, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (6, TO_DATE('04-May-2026','dd-Mon-yyyy'), TO_DATE('15-May-2026','dd-Mon-yyyy'),
        '61 Ann Street, Brisbane QLD 4101', '67 King William Street, Adelaide SA 5000',
        3200.00, 5, 11);

-- Quotes for cust_no 8 (Emma, Kreate Curtain, Melbourne) - multiple quotes
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (7, TO_DATE('02-May-2026','dd-Mon-yyyy'), TO_DATE('11-May-2026','dd-Mon-yyyy'),
        '42 Collins Street, Melbourne VIC 3000', '15 George Street, Sydney NSW 2000',
        1100.00, 8, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (8, TO_DATE('03-May-2026','dd-Mon-yyyy'), TO_DATE('14-May-2026','dd-Mon-yyyy'),
        '42 Collins Street, Melbourne VIC 3000', '61 Ann Street, Brisbane QLD 4101',
        1400.00, 8, 11);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (9, TO_DATE('04-May-2026','dd-Mon-yyyy'), TO_DATE('16-May-2026','dd-Mon-yyyy'),
        '42 Collins Street, Melbourne VIC 3000', '78 Hay Street, Perth WA 6003',
        2800.00, 8, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (10, TO_DATE('05-May-2026','dd-Mon-yyyy'), TO_DATE('17-May-2026','dd-Mon-yyyy'),
        '42 Collins Street, Melbourne VIC 3000', '88 Queen Street, Brisbane QLD 4000',
        1650.00, 8, 11);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (11, TO_DATE('06-May-2026','dd-Mon-yyyy'), TO_DATE('18-May-2026','dd-Mon-yyyy'),
        '42 Collins Street, Melbourne VIC 3000', '23 Murray Street, Perth WA 6000',
        3100.00, 8, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (12, TO_DATE('07-May-2026','dd-Mon-yyyy'), TO_DATE('20-May-2026','dd-Mon-yyyy'),
        '42 Collins Street, Melbourne VIC 3000', '127 Parramatta Road, Sydney NSW 2150',
        950.00, 8, 11);

-- Quotes for cust_no 17 (Lily Charlotte, Melbourne) - multiple quotes
-- Melbourne customer needed for Task 6(c)
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (13, TO_DATE('03-May-2026','dd-Mon-yyyy'), TO_DATE('12-May-2026','dd-Mon-yyyy'),
        '18 Chapel Street, Melbourne VIC 3004', '67 King William Street, Adelaide SA 5000',
        1200.00, 17, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (14, TO_DATE('05-May-2026','dd-Mon-yyyy'), TO_DATE('15-May-2026','dd-Mon-yyyy'),
        '18 Chapel Street, Melbourne VIC 3004', '15 George Street, Sydney NSW 2000',
        1750.00, 17, 11);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (15, TO_DATE('07-May-2026','dd-Mon-yyyy'), TO_DATE('18-May-2026','dd-Mon-yyyy'),
        '18 Chapel Street, Melbourne VIC 3004', '23 Murray Street, Perth WA 6000',
        2200.00, 17, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (16, TO_DATE('08-May-2026','dd-Mon-yyyy'), TO_DATE('20-May-2026','dd-Mon-yyyy'),
        '18 Chapel Street, Melbourne VIC 3004', '61 Ann Street, Brisbane QLD 4101',
        1300.00, 17, 11);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (17, TO_DATE('09-May-2026','dd-Mon-yyyy'), TO_DATE('22-May-2026','dd-Mon-yyyy'),
        '18 Chapel Street, Melbourne VIC 3004', '92 Oxford Street, Sydney NSW 2060',
        800.00, 17, 10);

-- Quotes for cust_no 16 (Henry Lucas, Sydney)
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (18, TO_DATE('05-May-2026','dd-Mon-yyyy'), TO_DATE('15-May-2026','dd-Mon-yyyy'),
        '92 Oxford Street, Sydney NSW 2060', '55 Lonsdale Street, Melbourne VIC 3008',
        1350.00, 16, 11);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (19, TO_DATE('06-May-2026','dd-Mon-yyyy'), TO_DATE('16-May-2026','dd-Mon-yyyy'),
        '92 Oxford Street, Sydney NSW 2060', '67 King William Street, Adelaide SA 5000',
        2400.00, 16, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (20, TO_DATE('08-May-2026','dd-Mon-yyyy'), TO_DATE('18-May-2026','dd-Mon-yyyy'),
        '92 Oxford Street, Sydney NSW 2060', '23 Murray Street, Perth WA 6000',
        3000.00, 16, 11);

-- Quotes for cust_no 1 (Michael Benjamin, FreshBox, Melbourne)
-- Melbourne customer needed for Task 6(c)
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (21, TO_DATE('04-May-2026','dd-Mon-yyyy'), TO_DATE('14-May-2026','dd-Mon-yyyy'),
        '55 Lonsdale Street, Melbourne VIC 3008', '61 Ann Street, Brisbane QLD 4101',
        1900.00, 1, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (22, TO_DATE('06-May-2026','dd-Mon-yyyy'), TO_DATE('16-May-2026','dd-Mon-yyyy'),
        '55 Lonsdale Street, Melbourne VIC 3008', '23 Murray Street, Perth WA 6000',
        2700.00, 1, 11);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (23, TO_DATE('07-May-2026','dd-Mon-yyyy'), TO_DATE('17-May-2026','dd-Mon-yyyy'),
        '55 Lonsdale Street, Melbourne VIC 3008', '15 George Street, Sydney NSW 2000',
        1050.00, 1, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (24, TO_DATE('09-May-2026','dd-Mon-yyyy'), TO_DATE('20-May-2026','dd-Mon-yyyy'),
        '55 Lonsdale Street, Melbourne VIC 3008', '78 Hay Street, Perth WA 6003',
        2900.00, 1, 11);

-- Quotes for cust_no 12 (Robert James, Wilson Confectionery)
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (25, TO_DATE('05-May-2026','dd-Mon-yyyy'), TO_DATE('14-May-2026','dd-Mon-yyyy'),
        '38 Wellington Street, Perth WA 6107', '55 Lonsdale Street, Melbourne VIC 3008',
        2600.00, 12, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (26, TO_DATE('06-May-2026','dd-Mon-yyyy'), TO_DATE('15-May-2026','dd-Mon-yyyy'),
        '38 Wellington Street, Perth WA 6107', '61 Ann Street, Brisbane QLD 4101',
        1700.00, 12, 11);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (27, TO_DATE('07-May-2026','dd-Mon-yyyy'), TO_DATE('18-May-2026','dd-Mon-yyyy'),
        '38 Wellington Street, Perth WA 6107', '67 King William Street, Adelaide SA 5000',
        1250.00, 12, 10);

-- Quotes for cust_no 20 (Emily Harper, Sydney)
INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (28, TO_DATE('08-May-2026','dd-Mon-yyyy'), TO_DATE('20-May-2026','dd-Mon-yyyy'),
        '127 Parramatta Road, Sydney NSW 2150', '55 Lonsdale Street, Melbourne VIC 3008',
        1600.00, 20, 11);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (29, TO_DATE('09-May-2026','dd-Mon-yyyy'), TO_DATE('22-May-2026','dd-Mon-yyyy'),
        '127 Parramatta Road, Sydney NSW 2150', '67 King William Street, Adelaide SA 5000',
        2000.00, 20, 10);

INSERT INTO quote (quote_no, quote_prepared_date, quote_pref_start_date, quote_start_location, quote_end_location, quote_cost, cust_no, emp_no)
VALUES (30, TO_DATE('10-May-2026','dd-Mon-yyyy'), TO_DATE('24-May-2026','dd-Mon-yyyy'),
        '127 Parramatta Road, Sydney NSW 2150', '23 Murray Street, Perth WA 6000',
        3500.00, 20, 11);

--------------------------------------
--INSERT INTO job
--------------------------------------
-- Job 1: from quote 3 (cust 5), same cost as quote (job_cost NULL)
-- Combination: 1HGBH41JXMN109186 + TRL01 (first use of this combo)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (1,
        TO_DATE('10-May-2026 08:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('10-May-2026 16:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'Y', 3, 11, 30, 'TRL01', '1HGBH41JXMN109186');

-- Job 2: from quote 4 (cust 5), job cost higher than quote
-- Combination: 2FMDK3GC8BBA12345 + TRL02 (first use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (2,
        TO_DATE('11-May-2026 09:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('12-May-2026 17:00','dd-Mon-yyyy HH24:MI'),
        2400.00, 'Y', 4, 10, 31, 'TRL02', '2FMDK3GC8BBA12345');

-- Job 3: from quote 5 (cust 5), same cost as quote (job_cost NULL)
-- Combination: 3VWFE21C04M000001 + TRL03 (first use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (3,
        TO_DATE('12-May-2026 08:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('13-May-2026 18:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'N', 5, 11, 32, 'TRL03', '3VWFE21C04M000001');

-- Job 4: from quote 6 (cust 5), job cost lower than quote
-- Combination: 4T1BF1FK5CU123456 + TRL04 (first use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (4,
        TO_DATE('15-May-2026 07:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('16-May-2026 19:00','dd-Mon-yyyy HH24:MI'),
        2900.00, 'Y', 6, 10, 33, 'TRL04', '4T1BF1FK5CU123456');

-- Job 5: from quote 7 (cust 8), same cost as quote (job_cost NULL)
-- Combination: 5FNRL5H40BB098765 + TRL05 (first use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (5,
        TO_DATE('11-May-2026 09:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('12-May-2026 15:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'Y', 7, 11, 30, 'TRL05', '5FNRL5H40BB098765');

-- Job 6: from quote 8 (cust 8), job cost higher than quote
-- Combination: 1FTFW1ET5DFC10112 + TRL06 (first use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (6,
        TO_DATE('14-May-2026 08:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('15-May-2026 14:00','dd-Mon-yyyy HH24:MI'),
        1600.00, 'N', 8, 10, 31, 'TRL06', '1FTFW1ET5DFC10112');

-- Job 7: from quote 9 (cust 8), same cost as quote (job_cost NULL)
-- Combination: 2C4RDGCG8ER123789 + TRL07 (first use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (7,
        TO_DATE('16-May-2026 10:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('18-May-2026 18:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'Y', 9, 11, 32, 'TRL07', '2C4RDGCG8ER123789');

-- Job 8: from quote 10 (cust 8), job cost lower than quote
-- Combination: 1HGBH41JXMN109186 + TRL05 (first use, 2nd combo for this truck)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (8,
        TO_DATE('17-May-2026 07:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('17-May-2026 15:00','dd-Mon-yyyy HH24:MI'),
        1500.00, 'Y', 10, 10, 33, 'TRL05', '1HGBH41JXMN109186');

-- Job 9: from quote 11 (cust 8), same cost as quote (job_cost NULL)
-- Combination: 2FMDK3GC8BBA12345 + TRL08 (first use, 2nd combo for this truck)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (9,
        TO_DATE('18-May-2026 09:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('20-May-2026 17:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'N', 11, 11, 30, 'TRL08', '2FMDK3GC8BBA12345');

-- Job 10: from quote 12 (cust 8), job cost higher than quote
-- Combination: 5XYKT3A69CG234567 + TRL08 (first use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (10,
        TO_DATE('20-May-2026 08:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('20-May-2026 16:00','dd-Mon-yyyy HH24:MI'),
        1100.00, 'Y', 12, 10, 31, 'TRL08', '5XYKT3A69CG234567');

-- Job 11: from quote 13 (cust 17), same cost as quote (job_cost NULL)
-- Combination: 1HGBH41JXMN109186 + TRL01 (2nd use - combo appears in 2 jobs now)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (11,
        TO_DATE('12-May-2026 08:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('12-May-2026 18:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'Y', 13, 11, 32, 'TRL01', '1HGBH41JXMN109186');

-- Job 12: from quote 14 (cust 17), job cost lower
-- Combination: 2FMDK3GC8BBA12345 + TRL02 (2nd use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (12,
        TO_DATE('15-May-2026 09:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('16-May-2026 15:00','dd-Mon-yyyy HH24:MI'),
        1600.00, 'Y', 14, 10, 33, 'TRL02', '2FMDK3GC8BBA12345');

-- Job 13: from quote 15 (cust 17), same cost as quote
-- Combination: 3VWFE21C04M000001 + TRL03 (2nd use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (13,
        TO_DATE('18-May-2026 07:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('20-May-2026 19:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'N', 15, 11, 30, 'TRL03', '3VWFE21C04M000001');

-- Job 14: from quote 16 (cust 17), job cost higher
-- Combination: 4T1BF1FK5CU123456 + TRL04 (2nd use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (14,
        TO_DATE('20-May-2026 08:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('20-May-2026 18:00','dd-Mon-yyyy HH24:MI'),
        1500.00, 'Y', 16, 10, 31, 'TRL04', '4T1BF1FK5CU123456');

-- Job 15: from quote 17 (cust 17), same cost
-- Combination: 5FNRL5H40BB098765 + TRL05 (2nd use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (15,
        TO_DATE('22-May-2026 09:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('22-May-2026 15:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'Y', 17, 11, 32, 'TRL05', '5FNRL5H40BB098765');

-- Job 16: from quote 18 (cust 16)
-- Combination: 1FTFW1ET5DFC10112 + TRL06 (2nd use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (16,
        TO_DATE('15-May-2026 08:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('16-May-2026 16:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'Y', 18, 10, 33, 'TRL06', '1FTFW1ET5DFC10112');

-- Job 17: from quote 19 (cust 16)
-- Combination: 2C4RDGCG8ER123789 + TRL07 (2nd use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (17,
        TO_DATE('16-May-2026 07:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('18-May-2026 19:00','dd-Mon-yyyy HH24:MI'),
        2600.00, 'N', 19, 11, 30, 'TRL07', '2C4RDGCG8ER123789');

-- Job 18: from quote 20 (cust 16)
-- Combination: 1HGBH41JXMN109186 + TRL05 (2nd use - now this combo has 2 jobs)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (18,
        TO_DATE('18-May-2026 09:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('20-May-2026 17:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'Y', 20, 10, 31, 'TRL05', '1HGBH41JXMN109186');

-- Job 19: from quote 21 (cust 1, Melbourne)
-- Combination: 2FMDK3GC8BBA12345 + TRL08 (2nd use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (19,
        TO_DATE('14-May-2026 08:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('16-May-2026 14:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'Y', 21, 11, 32, 'TRL08', '2FMDK3GC8BBA12345');

-- Job 20: from quote 22 (cust 1, Melbourne)
-- Combination: 5XYKT3A69CG234567 + TRL08 (2nd use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (20,
        TO_DATE('16-May-2026 09:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('18-May-2026 17:00','dd-Mon-yyyy HH24:MI'),
        3000.00, 'Y', 22, 10, 33, 'TRL08', '5XYKT3A69CG234567');

-- Job 21: from quote 25 (cust 12, Wilson Confectionery)
-- Combination: 1HGBH41JXMN109186 + TRL01 (3rd use)
INSERT INTO job (job_no, job_pickup_dt, job_intended_dropoff_dt, job_cost, job_payment_made, quote_no, sched_emp_no, driver_emp_no, trailer_code, truck_vin)
VALUES (21,
        TO_DATE('14-May-2026 08:00','dd-Mon-yyyy HH24:MI'),
        TO_DATE('16-May-2026 18:00','dd-Mon-yyyy HH24:MI'),
        NULL, 'Y', 25, 10, 30, 'TRL01', '1HGBH41JXMN109186');

-- Commit all inserts as a single transaction
COMMIT;

