SET PAGESIZE 100
SET WRAP OFF
SET HEADING OFF

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    JSON_OBJECT(
        -- Customer identifier as document _id
        '_id' VALUE cust_no,
        -- Full customer name; TRIM/NVL handles nullable name parts
                'customer_name' VALUE TRIM(NVL(
            cust_gname,
            ''
        )
                                           || ' ' || NVL(
            cust_fname,
            ''
        )),
        -- Business name or '-' if not supplied
                'customer_business' VALUE NVL(
            cust_bname,
            '-'
        ),
        -- Full address concatenated from street, town, postcode
                'customer_address' VALUE cust_street
                                         || ', '
                                         || cust_town
                                         || ', '
                                         || cust_pcode,
        -- Customer contact number
                'customer_phone' VALUE cust_contact_no,
        -- Nested statistics object for this customer
                'customer_stats' VALUE
            JSON_OBJECT(
                'number_of_quotes' VALUE COUNT(DISTINCT quote_no),
                        'number_of_jobs' VALUE COUNT(DISTINCT job_no),
            -- Total paid job cost; NVL to job_cost then quote_cost for effective cost
                        'total_paid_jobcost' VALUE NVL(
                    TO_CHAR(
                        SUM(
                            CASE
                                WHEN job_payment_made = 'Y' THEN
                                    NVL(
                                        job_cost,
                                        quote_cost
                                    )
                            END
                        ),
                        'FM$999990.00'
                    ),
                    '-'
                ),
            -- Total unpaid job cost
                        'total_unpaid_jobcost' VALUE NVL(
                    TO_CHAR(
                        SUM(
                            CASE
                                WHEN job_payment_made = 'N' THEN
                                    NVL(
                                        job_cost,
                                        quote_cost
                                    )
                            END
                        ),
                        'FM$999990.00'
                    ),
                    '-'
                )
            )
        FORMAT JSON,
        -- Array of all quotes made by this customer
                'quotes' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'quote_no' VALUE quote_no,
                        'quote_prepared_on' VALUE TO_CHAR(
                    quote_prepared_date,
                    'dd-Mon-yyyy'
                ),
                        'preferred_start_date' VALUE TO_CHAR(
                    quote_pref_start_date,
                    'dd-Mon-yyyy'
                ),
                        'start_location' VALUE quote_start_location,
                        'end_location' VALUE quote_end_location,
                        'quote_cost' VALUE TO_CHAR(
                    quote_cost,
                    'FM$999990.00'
                ),
                -- quote_assigned column added in Task 4
                        'assigned_to_job' VALUE quote_assigned,
                -- Job cost: use NVL(job_cost, quote_cost) if assigned; '-' if not
                        'job_cost' VALUE
                    CASE
                        WHEN quote_assigned = 'N' THEN
                            '-'
                        ELSE
                            TO_CHAR(
                                NVL(
                                    job_cost,
                                    quote_cost
                                ),
                                'FM$999990.00'
                            )
                    END
            )
        FORMAT JSON
         ORDER BY quote_no)
    FORMAT JSON)
  FROM customer
  JOIN quote
USING ( cust_no )
  LEFT JOIN job
USING ( quote_no )
 GROUP BY cust_no,
          cust_gname,
          cust_fname,
          cust_bname,
          cust_street,
          cust_town,
          cust_pcode,
          cust_contact_no
 ORDER BY cust_no;
