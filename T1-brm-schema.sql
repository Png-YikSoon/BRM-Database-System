--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-brm-schema.sql

--Student ID: 34600329
--Student Name: P'ng Yik Soon

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/


/* drop table statements - do not remove*/

DROP TABLE employee CASCADE CONSTRAINTS PURGE;

DROP TABLE quote CASCADE CONSTRAINTS PURGE;

DROP TABLE job CASCADE CONSTRAINTS PURGE;

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- EMPLOYEE
CREATE TABLE employee (
    emp_no         NUMBER(3) NOT NULL,
    emp_gname      VARCHAR2(30),
    emp_fname      VARCHAR2(30),
    emp_contact_no CHAR(10) NOT NULL,
    emp_licenceno  VARCHAR2(11),
    emp_role       CHAR(1) NOT NULL,
    emp_no_manager NUMBER(3)
);

-- Column comments for EMPLOYEE
COMMENT ON COLUMN employee.emp_no IS
    'Unique identifier for each employee';

COMMENT ON COLUMN employee.emp_gname IS
    'Employee given name';

COMMENT ON COLUMN employee.emp_fname IS
    'Employee family name';

COMMENT ON COLUMN employee.emp_contact_no IS
    'Employee contact phone number';

COMMENT ON COLUMN employee.emp_licenceno IS
    'Drivers licence number - only applicable for drivers (role D)';

COMMENT ON COLUMN employee.emp_role IS
    'Employee Role: B = Manager, T = Truck Dispatcher, M = Mechanic, D = Driver';

COMMENT ON COLUMN employee.emp_no_manager IS
    'Employee number of this employees manager';

-- Primary key constraint
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( emp_no );

-- Role must be one of B, T, M, D
ALTER TABLE employee
    ADD CONSTRAINT chk_employee_role
        CHECK ( emp_role IN ( 'B',
                              'T',
                              'M',
                              'D' ) );

-- Licence number is only required for drivers;
-- it must not be null when role is D
ALTER TABLE employee
    ADD CONSTRAINT chk_employee_licenceno
        CHECK ( emp_role != 'D'
            OR emp_licenceno IS NOT NULL );

-- Contact number must be unique across all employees
ALTER TABLE employee ADD CONSTRAINT employee_contact_uq UNIQUE ( emp_contact_no );

-- Licence number must be unique (each driver has their own licence)
ALTER TABLE employee ADD CONSTRAINT employee_licenceno_uq UNIQUE ( emp_licenceno );


-- QUOTE
CREATE TABLE quote (
    quote_no              NUMBER(5) NOT NULL,
    quote_prepared_date   DATE NOT NULL,
    quote_pref_start_date DATE NOT NULL,
    quote_start_location  VARCHAR2(50) NOT NULL,
    quote_end_location    VARCHAR2(60) NOT NULL,
    quote_cost            NUMBER(6,2) NOT NULL,
    cust_no               NUMBER(4) NOT NULL,
    emp_no                NUMBER(3) NOT NULL
);

-- Column comments for QUOTE
COMMENT ON COLUMN quote.quote_no IS
    'Unique identifier for each quote';

COMMENT ON COLUMN quote.quote_prepared_date IS
    'The date the quote was prepared by the dispatcher';

COMMENT ON COLUMN quote.quote_pref_start_date IS
    'The customer preferred start date for the job';

COMMENT ON COLUMN quote.quote_start_location IS
    'Pickup location specified in the quote';

COMMENT ON COLUMN quote.quote_end_location IS
    'Drop-off (destination) location specified in the quote';

COMMENT ON COLUMN quote.quote_cost IS
    'Quoted price for the job';

COMMENT ON COLUMN quote.cust_no IS
    'Customer who requested the quote';

COMMENT ON COLUMN quote.emp_no IS
    'Truck Dispatcher employee who prepared the quote';

-- Primary key constraint
ALTER TABLE quote ADD CONSTRAINT quote_pk PRIMARY KEY ( quote_no );

-- Quoted cost must be positive
ALTER TABLE quote ADD CONSTRAINT chk_quote_cost CHECK ( quote_cost > 0 );


-- JOB
CREATE TABLE job (
    job_no                  NUMBER(5) NOT NULL,
    job_pickup_dt           DATE NOT NULL,
    job_intended_dropoff_dt DATE NOT NULL,
    job_cost                NUMBER(6,2),
    job_payment_made        CHAR(1) NOT NULL,
    quote_no                NUMBER(5) NOT NULL,
    sched_emp_no            NUMBER(3) NOT NULL,
    driver_emp_no           NUMBER(3) NOT NULL,
    trailer_code            CHAR(5) NOT NULL,
    truck_vin               CHAR(17) NOT NULL
);

-- Column comments for JOB
COMMENT ON COLUMN job.job_no IS
    'Unique identifier for each job';

COMMENT ON COLUMN job.job_pickup_dt IS
    'Scheduled pickup date and time for the job';

COMMENT ON COLUMN job.job_intended_dropoff_dt IS
    'Intended drop-off date and time for the job';

COMMENT ON COLUMN job.job_cost IS
    'The revised job cost - only recorded when different from the quoted cost';

COMMENT ON COLUMN job.job_payment_made IS
    'Flag to indicate if the customer has paid: Y = paid, N = not paid';

COMMENT ON COLUMN job.quote_no IS
    'Quote number';

COMMENT ON COLUMN job.sched_emp_no IS
    'Employee number of the truck Dispatcher who scheduled/assigned this job';

COMMENT ON COLUMN job.driver_emp_no IS
    'Employee number of the driver assigned to drive this job';

COMMENT ON COLUMN job.trailer_code IS
    'Trailer assigned to this job';

COMMENT ON COLUMN job.truck_vin IS
    'Truck VIN (Vehicle Identification Number) assigned to this job';

-- Primary key constraint
ALTER TABLE job ADD CONSTRAINT job_pk PRIMARY KEY ( job_no );

-- Payment flag must be Y or N
ALTER TABLE job
    ADD CONSTRAINT chk_job_payment_made CHECK ( job_payment_made IN ( 'Y',
                                                                      'N' ) );

-- Job cost, when recorded, must be positive
ALTER TABLE job
    ADD CONSTRAINT chk_job_cost CHECK ( job_cost IS NULL
        OR job_cost > 0 );

-- Drop-off must be after pickup
ALTER TABLE job ADD CONSTRAINT chk_job_dates CHECK ( job_intended_dropoff_dt > job_pickup_dt
);



-- Add all missing FK Constraints below here
-- EMPLOYEE: self-referencing FK for manager reporting line
ALTER TABLE employee
    ADD CONSTRAINT employee_manager_employee_fk FOREIGN KEY ( emp_no_manager )
        REFERENCES employee ( emp_no );

-- QUOTE: FK to customer who requested the quote
ALTER TABLE quote
    ADD CONSTRAINT quote_customer_fk FOREIGN KEY ( cust_no )
        REFERENCES customer ( cust_no );

-- QUOTE: FK to dispatcher employee who prepared the quote
ALTER TABLE quote
    ADD CONSTRAINT quote_employee_fk FOREIGN KEY ( emp_no )
        REFERENCES employee ( emp_no );

-- JOB: FK to the quote it was converted from
ALTER TABLE job
    ADD CONSTRAINT job_quote_fk FOREIGN KEY ( quote_no )
        REFERENCES quote ( quote_no );

-- JOB: FK to dispatcher who scheduled the job
ALTER TABLE job
    ADD CONSTRAINT job_sched_emp_fk FOREIGN KEY ( sched_emp_no )
        REFERENCES employee ( emp_no );

-- JOB: FK to the driver assigned to the job
ALTER TABLE job
    ADD CONSTRAINT job_driver_emp_fk FOREIGN KEY ( driver_emp_no )
        REFERENCES employee ( emp_no );

-- JOB: FK to the truck+trailer combination (composite FK)
ALTER TABLE job
    ADD CONSTRAINT job_combination_fk
        FOREIGN KEY ( trailer_code,
                      truck_vin )
            REFERENCES combination ( trailer_code,
                                     truck_vin );