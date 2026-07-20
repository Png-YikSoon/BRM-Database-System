--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-brm-select.sql

--Student ID: 34600329
--Student Name: P'ng Yik Soon

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT c1.cust_no,
    -- Display business name if available, otherwise full name (given + family)
    -- TRIM removes any extra space when one name part is NULL
       CASE
           WHEN c1.cust_bname IS NOT NULL THEN
               c1.cust_bname
           ELSE
               TRIM(NVL(
                   c1.cust_gname,
                   ''
               )
                    || ' ' || NVL(
                   c1.cust_fname,
                   ''
               ))
       END AS customer_name,
       COUNT(q.quote_no) AS num_quotes,
       TO_CHAR(
           AVG(q.quote_cost),
           '$999,990.00'
       ) AS avg_quoted_cost
  FROM customer c1
  JOIN quote q
ON c1.cust_no = q.cust_no
 GROUP BY c1.cust_no,
          c1.cust_bname,
          c1.cust_gname,
          c1.cust_fname
HAVING
    -- Must have more than one quote
 COUNT(q.quote_no) > 1
    -- Average cost must exceed the overall average across ALL quotes
   AND AVG(q.quote_cost) > (
    SELECT AVG(quote_cost)
      FROM quote
)
 ORDER BY AVG(q.quote_cost) DESC,
          c1.cust_no ASC;


/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT e1.emp_no,
        -- TRIM and NVL handle nullable emp_gname and emp_fname
       -- to avoid leading or trailing spaces in the full name
       TRIM(NVL(
           e1.emp_gname,
           ''
       )
            || ' ' || NVL(
           e1.emp_fname,
           ''
       )) AS emp_name,
       CASE e1.emp_role
           WHEN 'B' THEN
               'Manager'
           WHEN 'T' THEN
               'Truck Dispatcher'
           WHEN 'M' THEN
               'Mechanic'
           WHEN 'D' THEN
               'Driver'
       END AS emp_role_full,
       -- Display manager full name or 'No Manager' if no manager is assigned
       CASE
           WHEN e2.emp_no IS NULL THEN
               'No Manager'
           ELSE
               TRIM(NVL(
                   e2.emp_gname,
                   ''
               )
                    || ' ' || NVL(
                   e2.emp_fname,
                   ''
               ))
       END AS manager_name,
       -- Only show job count for Truck Dispatchers (role T)
       -- Leave blank for all other roles
       CASE
           WHEN e1.emp_role = 'T' THEN
               TO_CHAR(COUNT(j1.job_no))
           ELSE
               ' '
       END AS jobs_dispatched
  FROM employee e1
  LEFT JOIN employee e2
ON e1.emp_no_manager = e2.emp_no
  LEFT JOIN job j1
ON j1.sched_emp_no = e1.emp_no
 GROUP BY e1.emp_no,
          e1.emp_gname,
          e1.emp_fname,
          e1.emp_role,
          e2.emp_no,
          e2.emp_gname,
          e2.emp_fname
 ORDER BY e1.emp_no;


/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT co.truck_vin,
       RPAD(
           t.truck_rego,
           10,
           ' '
       ) AS truck_rego,
       RPAD(
           co.trailer_code,
           12,
           ' '
       ) AS trailer_code,
       -- Trailer purchase cost: right-aligned in fixed width of 21 characters
       LPAD(
           TO_CHAR(
               tr.trailer_purchase_cost,
               'FM$999,990.00'
           ),
           21,
           ' '
       ) AS trailer_purchase_cost,
       -- Number of jobs this combination has been used in
       COUNT(j1.job_no) AS num_jobs,
       -- Total quoted cost: right-aligned in 17 chars, or 'No jobs' if unused
       CASE
           WHEN COUNT(j1.job_no) = 0 THEN
               LPAD(
                   'No jobs',
                   17,
                   ' '
               )
           ELSE
               LPAD(
                   TO_CHAR(
                       SUM(q.quote_cost),
                       'FM$999,990.00'
                   ),
                   17,
                   ' '
               )
       END AS total_quoted_cost,
       -- Usage classification based on average jobs per used combination
       CASE
           WHEN COUNT(j1.job_no) = 0 THEN
               'Never Used'
           WHEN COUNT(j1.job_no) > (
               -- Average job count only over combinations used in at least 1 job
               -- Grouping from job table excludes unused combinations
               SELECT AVG(num_of_job)
                 FROM (
                   SELECT COUNT(job_no) AS num_of_job
                     FROM job
                    GROUP BY truck_vin,
                             trailer_code
               )
           )                    THEN
               'High Use'
           ELSE
               'Standard Use'
       END AS usage
  FROM combination co
  JOIN truck t
ON co.truck_vin = t.truck_vin
  JOIN trailer tr
ON co.trailer_code = tr.trailer_code
-- Left join so combinations with zero jobs still appear
  LEFT JOIN job j1
ON co.truck_vin = j1.truck_vin
   AND co.trailer_code = j1.trailer_code
-- Left join to quote to get quoted cost for each job
  LEFT JOIN quote q
ON j1.quote_no = q.quote_no
 GROUP BY co.truck_vin,
          co.trailer_code,
          t.truck_rego,
          tr.trailer_purchase_cost
 ORDER BY num_jobs DESC,
          co.truck_vin ASC,
          co.trailer_code ASC;