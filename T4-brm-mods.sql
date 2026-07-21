--4(a)
ALTER TABLE quote ADD (
    quote_assigned          CHAR(1) DEFAULT 'N' NOT NULL,
    quote_unassigned_reason VARCHAR2(100),
    CONSTRAINT quote_assigned_chk CHECK ( quote_assigned IN ( 'Y',
                                                             'N' ) )
);

-- Column comments for new columns
COMMENT ON COLUMN quote.quote_assigned IS
    'Flag to note whether the quote has been assigned to a job: Y = assigned, N = not assigned'
    ;

COMMENT ON COLUMN quote.quote_unassigned_reason IS
    'Reason the quote was not converted to a job by the preferred start date (NULL if assigned)'
    ;

-- Update quotes that have been converted to a job to Y.
-- All others remain N (set by DEFAULT above).
UPDATE quote
   SET
    quote_assigned = 'Y'
 WHERE quote_no IN (
    SELECT quote_no
      FROM job
);

COMMIT;

-- Verify structural changes to QUOTE table
DESC quote;

-- Verify data: show all quotes with their assigned status
SELECT quote_no,
       TO_CHAR(
           quote_prepared_date,
           'dd-Mon-yyyy'
       ) AS prepared_date,
       TO_CHAR(
           quote_pref_start_date,
           'dd-Mon-yyyy'
       ) AS pref_start,
       quote_cost,
       quote_assigned,
       quote_unassigned_reason
  FROM quote
 ORDER BY quote_no;


--4(b)
-- Drop tables
DROP TABLE service_task CASCADE CONSTRAINTS PURGE;
DROP TABLE service CASCADE CONSTRAINTS PURGE;
DROP TABLE task_type CASCADE CONSTRAINTS PURGE;

-- CREATE TABLE task_type
-- Lookup table of possible service task types.
CREATE TABLE task_type (
    task_type_id   NUMBER(3) NOT NULL,
    task_type_name VARCHAR2(50) NOT NULL
);

-- Column comments
COMMENT ON COLUMN task_type.task_type_id IS
    'Unique identifier for each service task type';

COMMENT ON COLUMN task_type.task_type_name IS
    'Name of the service task type (e.g. Oil Change, Tyre Rotation, Brake Inspection)'
    ;

ALTER TABLE task_type ADD CONSTRAINT task_type_pk PRIMARY KEY ( task_type_id );

-- Task type name must be unique to prevent duplicate entries
ALTER TABLE task_type ADD CONSTRAINT task_type_name_uq UNIQUE ( task_type_name );


-- CREATE TABLE service
-- One row per service event for a truck.
CREATE TABLE service (
    service_id       NUMBER(5) NOT NULL,
    service_start_dt DATE NOT NULL,
    service_end_dt   DATE,
    truck_vin        CHAR(17) NOT NULL
);

-- Column comments
COMMENT ON COLUMN service.service_id IS
    'Unique identifier for each truck service event';

COMMENT ON COLUMN service.service_start_dt IS
    'Date and time the service started';

COMMENT ON COLUMN service.service_end_dt IS
    'Date and time the service ended (NULL if service still in progress)';

COMMENT ON COLUMN service.truck_vin IS
    'The truck VIN that this service is for';

-- Add PK
ALTER TABLE service ADD CONSTRAINT service_pk PRIMARY KEY ( service_id );

-- End date must be after start date when recorded
ALTER TABLE service
    ADD CONSTRAINT service_dates_chk CHECK ( service_end_dt IS NULL
        OR service_end_dt > service_start_dt );

-- Add FK: service belongs to a truck
ALTER TABLE service
    ADD CONSTRAINT service_truck_fk FOREIGN KEY ( truck_vin )
        REFERENCES truck ( truck_vin );


-- CREATE TABLE service_task
-- Bridge table between SERVICE and TASK_TYPE.
-- Composite PK (service_id, task_type_id) prevents
-- the same task type appearing twice in one service.
CREATE TABLE service_task (
    service_id        NUMBER(5) NOT NULL,
    task_type_id      NUMBER(3) NOT NULL,
    mechanic_emp_no   NUMBER(3) NOT NULL,
    service_task_note VARCHAR2(200)
);

-- Column comments
COMMENT ON COLUMN service_task.service_id IS
    'The service event this task belongs to';

COMMENT ON COLUMN service_task.task_type_id IS
    'The type of task performed';

COMMENT ON COLUMN service_task.mechanic_emp_no IS
    'The employee number of the mechanic who performed this task';

COMMENT ON COLUMN service_task.service_task_note IS
    'Free text description or notes about this service task (up to 200 characters)';

-- Add Composite PK: prevents same task type recorded twice in one service
ALTER TABLE service_task ADD CONSTRAINT service_task_pk PRIMARY KEY ( service_id,
                                                                      task_type_id );

-- Add FK: task belongs to a service event
ALTER TABLE service_task
    ADD CONSTRAINT service_task_service_fk FOREIGN KEY ( service_id )
        REFERENCES service ( service_id );

-- Add FK: task is of a known expandable task type
ALTER TABLE service_task
    ADD CONSTRAINT service_task_type_fk FOREIGN KEY ( task_type_id )
        REFERENCES task_type ( task_type_id );

-- Add FK: task was performed by a mechanic employee
ALTER TABLE service_task
    ADD CONSTRAINT service_task_mechanic_fk FOREIGN KEY ( mechanic_emp_no )
        REFERENCES employee ( emp_no );

-- Verify new table structures
DESC task_type;
DESC service;
DESC service_task;
