--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-brm-dm.sql

--Student ID: 34600329
--Student Name: P'ng Yik Soon

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/
--3(a)
DROP SEQUENCE employee_seq;

DROP SEQUENCE quote_seq;

DROP SEQUENCE job_seq;

-- Sequence for EMPLOYEE primary key (emp_no)
CREATE SEQUENCE employee_seq START WITH 300 INCREMENT BY 5;

-- Sequence for QUOTE primary key (quote_no)
CREATE SEQUENCE quote_seq START WITH 300 INCREMENT BY 5;

-- Sequence for JOB primary key (job_no)
CREATE SEQUENCE job_seq START WITH 300 INCREMENT BY 5;

--3(b)
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( employee_seq.NEXTVAL,
           'Aurello',
           'Brown',
           '0431952053',
           NULL,
           'T',
    -- Subquery: dynamically find the emp_no of manager Sarah Mitchell
           (
               SELECT emp_no
                 FROM employee
                WHERE upper(emp_gname) = upper('Sarah')
                  AND upper(emp_fname) = upper('Mitchell')
                  AND upper(emp_role) = 'B'
           ) );

COMMIT;

--3(c)
-- Step 1: Insert the QUOTE
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( quote_seq.NEXTVAL,
           TO_DATE('17-May-2026','dd-Mon-yyyy'),
           TO_DATE('25-May-2026','dd-Mon-yyyy'),
           '29 Kuranda Road, Adelaide SA 5030',
           '9 Albatros Drive, Mount Gambier SA 5270',
           1000.00,
    -- Dynamically find Victoria Ella's customer number
           (
               SELECT cust_no
                 FROM customer
                WHERE UPPER(cust_gname) = 'VICTORIA'
                  AND UPPER(cust_fname) = 'ELLA'
                  AND UPPER(cust_bname) = upper('Flintstone Store')
           ),
    -- Dynamically find Aurello Brown's employee number
           (
               SELECT emp_no
                 FROM employee
                WHERE upper(emp_gname) = upper('Aurello')
                  AND upper(emp_fname) = upper('Brown')
                  AND upper(emp_role) = 'T'
           ) );

-- Step 2: Insert the JOB referencing the quote just created
-- job_cost is NULL because job cost equals quote cost
INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES ( job_seq.NEXTVAL,
    -- Pickup: 9 AM on 25 May 2026
           TO_DATE('25-May-2026 09:00','dd-Mon-yyyy HH24:MI'),
    -- Drop-off: 5 hours later = 2 PM on 25 May 2026
           TO_DATE('25-May-2026 09:00','dd-Mon-yyyy HH24:MI') + (5/24),
           NULL,
           'Y',
    -- Dynamically get the quote_no just inserted (prepared 17 May 2026 by Aurello Brown for Victoria Ella)
           (
               SELECT quote_no
                 FROM quote
                WHERE quote_prepared_date = TO_DATE('17-May-2026','dd-Mon-yyyy')
                  AND emp_no = (
                   SELECT emp_no
                     FROM employee
                    WHERE upper(emp_gname) = upper('Aurello')
                      AND upper(emp_fname) = upper('Brown')
                      AND upper(emp_role) = 'T'
               )
                  AND cust_no = (
                   SELECT cust_no
                     FROM customer
                    WHERE UPPER(cust_gname) = 'VICTORIA'
                      AND UPPER(cust_fname) = 'ELLA'
                      AND UPPER(cust_bname) = upper('Flintstone Store')
               )
           ),
    -- Dispatcher who schedules: Aurello Brown
           (
               SELECT emp_no
                 FROM employee
                WHERE upper(emp_gname) = upper('Aurello')
                  AND upper(emp_fname) = upper('Brown')
                  AND upper(emp_role) = 'T'
           ),
    -- Driver: Michael Johnson
           (
               SELECT emp_no
                 FROM employee
                WHERE upper(emp_gname) = upper('Michael')
                  AND upper(emp_fname) = upper('Johnson')
                  AND upper(emp_role) = 'D'
           ),
           'TRL08',
           '1HGBH41JXMN109186' );

-- Commit all changes from 3b and 3c as a single transaction
COMMIT;


--3(d)
UPDATE job
   SET job_pickup_dt           = TO_DATE('25-May-2026 14:00', 'dd-Mon-yyyy HH24:MI'),
       -- Drop-off = new pickup + 5 hours driving duration
       job_intended_dropoff_dt = TO_DATE('25-May-2026 14:00', 'dd-Mon-yyyy HH24:MI') + (5/24),
       -- Revised cost: 20% above the original quoted cost for this job
       job_cost = (
           SELECT ROUND(q1.quote_cost * 1.20, 2)
             FROM quote q1
            WHERE q1.quote_no = job.quote_no
       ),
       -- Mark payment as received
       job_payment_made = 'Y'
 WHERE quote_no = (
       SELECT q1.quote_no
         FROM quote q1
         JOIN customer c1 ON q1.cust_no = c1.cust_no
        WHERE UPPER(c1.cust_gname)   = 'VICTORIA'
          AND UPPER(c1.cust_fname)   = 'ELLA'
          AND UPPER(c1.cust_bname)   = UPPER('Flintstone Store')
          AND q1.quote_prepared_date = TO_DATE('17-May-2026', 'dd-Mon-yyyy')
);

COMMIT;


--3(e)
DELETE FROM job
-- Identify the job via its linked quote
 WHERE quote_no = (
    SELECT q1.quote_no
      FROM quote q1
      JOIN customer c1
    ON q1.cust_no = c1.cust_no
     WHERE UPPER(c1.cust_gname) = 'VICTORIA'
       AND UPPER(c1.cust_fname) = 'ELLA'
       AND UPPER(c1.cust_bname) = UPPER('Flintstone Store')
       AND q1.quote_prepared_date = TO_DATE('17-May-2026','dd-Mon-yyyy')
);

COMMIT;