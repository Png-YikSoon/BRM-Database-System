//example use("abc001");
use("abc001");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.brm_customers.drop();

// Create collection and insert documents
db.brm_customers.insertMany([
{"_id":1,"customer_name":"Michael Benjamin","customer_business":"FreshBox","customer_address":"55 Lonsdale Street, Melbourne, 3008","customer_phone":"0478901017","customer_stats":{"number_of_quotes":4,"number_of_jobs":2,"total_paid_jobcost":"$4900.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":21,"quote_prepared_on":"04-May-2026","preferred_start_date":"14-May-2026","start_location":"55 Lonsdale Street, Melbourne VIC 3008","end_location":"61 Ann Street, Brisbane QLD 4101","quote_cost":"$1900.00","assigned_to_job":"Y","job_cost":"$1900.00"},{"quote_no":22,"quote_prepared_on":"06-May-2026","preferred_start_date":"16-May-2026","start_location":"55 Lonsdale Street, Melbourne VIC 3008","end_location":"23 Murray Street, Perth WA 6000","quote_cost":"$2700.00","assigned_to_job":"Y","job_cost":"$3000.00"},{"quote_no":23,"quote_prepared_on":"07-May-2026","preferred_start_date":"17-May-2026","start_location":"55 Lonsdale Street, Melbourne VIC 3008","end_location":"15 George Street, Sydney NSW 2000","quote_cost":"$1050.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":24,"quote_prepared_on":"09-May-2026","preferred_start_date":"20-May-2026","start_location":"55 Lonsdale Street, Melbourne VIC 3008","end_location":"78 Hay Street, Perth WA 6003","quote_cost":"$2900.00","assigned_to_job":"N","job_cost":"-"}]},
{"_id":5,"customer_name":"Jack Ethan","customer_business":"-","customer_address":"61 Ann Street, Brisbane, 4101","customer_phone":"0434567013","customer_stats":{"number_of_quotes":6,"number_of_jobs":4,"total_paid_jobcost":"$6200.00","total_unpaid_jobcost":"$2500.00"},"quotes":[{"quote_no":1,"quote_prepared_on":"01-May-2026","preferred_start_date":"10-May-2026","start_location":"61 Ann Street, Brisbane QLD 4101","end_location":"23 Murray Street, Perth WA 6000","quote_cost":"$1500.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":2,"quote_prepared_on":"02-May-2026","preferred_start_date":"12-May-2026","start_location":"61 Ann Street, Brisbane QLD 4101","end_location":"55 Lonsdale Street, Melbourne VIC 3008","quote_cost":"$1800.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":3,"quote_prepared_on":"01-May-2026","preferred_start_date":"10-May-2026","start_location":"61 Ann Street, Brisbane QLD 4101","end_location":"101 Pitt Street, Sydney NSW 2010","quote_cost":"$900.00","assigned_to_job":"Y","job_cost":"$900.00"},{"quote_no":4,"quote_prepared_on":"02-May-2026","preferred_start_date":"11-May-2026","start_location":"61 Ann Street, Brisbane QLD 4101","end_location":"78 Hay Street, Perth WA 6003","quote_cost":"$2100.00","assigned_to_job":"Y","job_cost":"$2400.00"},{"quote_no":5,"quote_prepared_on":"03-May-2026","preferred_start_date":"12-May-2026","start_location":"61 Ann Street, Brisbane QLD 4101","end_location":"42 Collins Street, Melbourne VIC 3000","quote_cost":"$2500.00","assigned_to_job":"Y","job_cost":"$2500.00"},{"quote_no":6,"quote_prepared_on":"04-May-2026","preferred_start_date":"15-May-2026","start_location":"61 Ann Street, Brisbane QLD 4101","end_location":"67 King William Street, Adelaide SA 5000","quote_cost":"$3200.00","assigned_to_job":"Y","job_cost":"$2900.00"}]},
{"_id":8,"customer_name":"Emma","customer_business":"Kreate Curtain","customer_address":"42 Collins Street, Melbourne, 3000","customer_phone":"0423456002","customer_stats":{"number_of_quotes":6,"number_of_jobs":6,"total_paid_jobcost":"$6500.00","total_unpaid_jobcost":"$4700.00"},"quotes":[{"quote_no":7,"quote_prepared_on":"02-May-2026","preferred_start_date":"11-May-2026","start_location":"42 Collins Street, Melbourne VIC 3000","end_location":"15 George Street, Sydney NSW 2000","quote_cost":"$1100.00","assigned_to_job":"Y","job_cost":"$1100.00"},{"quote_no":8,"quote_prepared_on":"03-May-2026","preferred_start_date":"14-May-2026","start_location":"42 Collins Street, Melbourne VIC 3000","end_location":"61 Ann Street, Brisbane QLD 4101","quote_cost":"$1400.00","assigned_to_job":"Y","job_cost":"$1600.00"},{"quote_no":9,"quote_prepared_on":"04-May-2026","preferred_start_date":"16-May-2026","start_location":"42 Collins Street, Melbourne VIC 3000","end_location":"78 Hay Street, Perth WA 6003","quote_cost":"$2800.00","assigned_to_job":"Y","job_cost":"$2800.00"},{"quote_no":10,"quote_prepared_on":"05-May-2026","preferred_start_date":"17-May-2026","start_location":"42 Collins Street, Melbourne VIC 3000","end_location":"88 Queen Street, Brisbane QLD 4000","quote_cost":"$1650.00","assigned_to_job":"Y","job_cost":"$1500.00"},{"quote_no":11,"quote_prepared_on":"06-May-2026","preferred_start_date":"18-May-2026","start_location":"42 Collins Street, Melbourne VIC 3000","end_location":"23 Murray Street, Perth WA 6000","quote_cost":"$3100.00","assigned_to_job":"Y","job_cost":"$3100.00"},{"quote_no":12,"quote_prepared_on":"07-May-2026","preferred_start_date":"20-May-2026","start_location":"42 Collins Street, Melbourne VIC 3000","end_location":"127 Parramatta Road, Sydney NSW 2150","quote_cost":"$950.00","assigned_to_job":"Y","job_cost":"$1100.00"}]},
{"_id":12,"customer_name":"Robert James","customer_business":"Wilson Confectionery","customer_address":"38 Wellington Street, Perth, 6107","customer_phone":"0490123019","customer_stats":{"number_of_quotes":3,"number_of_jobs":1,"total_paid_jobcost":"$2600.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":25,"quote_prepared_on":"05-May-2026","preferred_start_date":"14-May-2026","start_location":"38 Wellington Street, Perth WA 6107","end_location":"55 Lonsdale Street, Melbourne VIC 3008","quote_cost":"$2600.00","assigned_to_job":"Y","job_cost":"$2600.00"},{"quote_no":26,"quote_prepared_on":"06-May-2026","preferred_start_date":"15-May-2026","start_location":"38 Wellington Street, Perth WA 6107","end_location":"61 Ann Street, Brisbane QLD 4101","quote_cost":"$1700.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":27,"quote_prepared_on":"07-May-2026","preferred_start_date":"18-May-2026","start_location":"38 Wellington Street, Perth WA 6107","end_location":"67 King William Street, Adelaide SA 5000","quote_cost":"$1250.00","assigned_to_job":"N","job_cost":"-"}]},
{"_id":16,"customer_name":"Henry Lucas","customer_business":"-","customer_address":"92 Oxford Street, Sydney, 2060","customer_phone":"0412345011","customer_stats":{"number_of_quotes":3,"number_of_jobs":3,"total_paid_jobcost":"$4350.00","total_unpaid_jobcost":"$2600.00"},"quotes":[{"quote_no":18,"quote_prepared_on":"05-May-2026","preferred_start_date":"15-May-2026","start_location":"92 Oxford Street, Sydney NSW 2060","end_location":"55 Lonsdale Street, Melbourne VIC 3008","quote_cost":"$1350.00","assigned_to_job":"Y","job_cost":"$1350.00"},{"quote_no":19,"quote_prepared_on":"06-May-2026","preferred_start_date":"16-May-2026","start_location":"92 Oxford Street, Sydney NSW 2060","end_location":"67 King William Street, Adelaide SA 5000","quote_cost":"$2400.00","assigned_to_job":"Y","job_cost":"$2600.00"},{"quote_no":20,"quote_prepared_on":"08-May-2026","preferred_start_date":"18-May-2026","start_location":"92 Oxford Street, Sydney NSW 2060","end_location":"23 Murray Street, Perth WA 6000","quote_cost":"$3000.00","assigned_to_job":"Y","job_cost":"$3000.00"}]},
{"_id":17,"customer_name":"Lily Charlotte","customer_business":"-","customer_address":"18 Chapel Street, Melbourne, 3004","customer_phone":"0423456012","customer_stats":{"number_of_quotes":5,"number_of_jobs":5,"total_paid_jobcost":"$5100.00","total_unpaid_jobcost":"$2200.00"},"quotes":[{"quote_no":13,"quote_prepared_on":"03-May-2026","preferred_start_date":"12-May-2026","start_location":"18 Chapel Street, Melbourne VIC 3004","end_location":"67 King William Street, Adelaide SA 5000","quote_cost":"$1200.00","assigned_to_job":"Y","job_cost":"$1200.00"},{"quote_no":14,"quote_prepared_on":"05-May-2026","preferred_start_date":"15-May-2026","start_location":"18 Chapel Street, Melbourne VIC 3004","end_location":"15 George Street, Sydney NSW 2000","quote_cost":"$1750.00","assigned_to_job":"Y","job_cost":"$1600.00"},{"quote_no":15,"quote_prepared_on":"07-May-2026","preferred_start_date":"18-May-2026","start_location":"18 Chapel Street, Melbourne VIC 3004","end_location":"23 Murray Street, Perth WA 6000","quote_cost":"$2200.00","assigned_to_job":"Y","job_cost":"$2200.00"},{"quote_no":16,"quote_prepared_on":"08-May-2026","preferred_start_date":"20-May-2026","start_location":"18 Chapel Street, Melbourne VIC 3004","end_location":"61 Ann Street, Brisbane QLD 4101","quote_cost":"$1300.00","assigned_to_job":"Y","job_cost":"$1500.00"},{"quote_no":17,"quote_prepared_on":"09-May-2026","preferred_start_date":"22-May-2026","start_location":"18 Chapel Street, Melbourne VIC 3004","end_location":"92 Oxford Street, Sydney NSW 2060","quote_cost":"$800.00","assigned_to_job":"Y","job_cost":"$800.00"}]},
{"_id":18,"customer_name":"Victoria Ella","customer_business":"Flintstone Store","customer_address":"94 Henley Beach Road, Adelaide, 5095","customer_phone":"0401234020","customer_stats":{"number_of_quotes":1,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":300,"quote_prepared_on":"17-May-2026","preferred_start_date":"25-May-2026","start_location":"29 Kuranda Road, Adelaide SA 5030","end_location":"9 Albatros Drive, Mount Gambier SA 5270","quote_cost":"$1000.00","assigned_to_job":"N","job_cost":"-"}]},
{"_id":20,"customer_name":"Emily Harper","customer_business":"-","customer_address":"127 Parramatta Road, Sydney, 2150","customer_phone":"0467890016","customer_stats":{"number_of_quotes":3,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":28,"quote_prepared_on":"08-May-2026","preferred_start_date":"20-May-2026","start_location":"127 Parramatta Road, Sydney NSW 2150","end_location":"55 Lonsdale Street, Melbourne VIC 3008","quote_cost":"$1600.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":29,"quote_prepared_on":"09-May-2026","preferred_start_date":"22-May-2026","start_location":"127 Parramatta Road, Sydney NSW 2150","end_location":"67 King William Street, Adelaide SA 5000","quote_cost":"$2000.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":30,"quote_prepared_on":"10-May-2026","preferred_start_date":"24-May-2026","start_location":"127 Parramatta Road, Sydney NSW 2150","end_location":"23 Murray Street, Perth WA 6000","quote_cost":"$3500.00","assigned_to_job":"N","job_cost":"-"}]},
]);

// List all documents you added
db.brm_customers.find({});

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer
db.brm_customers.find(
    {
        "customer_address": { "$regex": "Melbourne" },
        "customer_stats.number_of_quotes": { "$gte": 2 }
    },
    {
        "_id": 1,
        "customer_name": 1,
        "customer_address": 1,
        "customer_phone": 1,
        "customer_stats.number_of_quotes": 1,
        "customer_stats.number_of_jobs": 1,
        "customer_stats.total_paid_jobcost": 1,
        "customer_stats.total_unpaid_jobcost": 1
    }
);


// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// (i)  Add the new customer
db.brm_customers.insertOne(
    {
        "_id": 1001,
        "customer_name": "Patrick Bosse",
        "customer_business": "-",
        "customer_address": "10 King William Street, Adelaide, 5000",
        "customer_phone": "0412345099",
        "customer_stats": {
            "number_of_quotes": 0,
            "number_of_jobs": 0,
            "total_paid_jobcost": "-",
            "total_unpaid_jobcost": "-"
        },
        "quotes": []
    }
);

// Show the customer details
db.brm_customers.find({ "_id": 1001 });


// (ii) Add new quote
db.brm_customers.updateOne(
    { "_id": 1001 },
    {
        "$set": {
            "customer_stats.number_of_quotes": 1,
            "customer_stats.number_of_jobs": 1,
            "customer_stats.total_paid_jobcost": "$3200.00",
            "customer_stats.total_unpaid_jobcost": "-"
        },
        "$push": {
            "quotes": {
                "quote_no": 2002,
                "quote_prepared_on": "01-Jun-2026",
                "preferred_start_date": "10-Jun-2026",
                "start_location": "Adelaide SA",
                "end_location": "Melbourne VIC",
                "quote_cost": "$3200.00",
                "assigned_to_job": "Y",
                "job_cost": "$3200.00"
            }
        }
    }
);


// Show the customer details
db.brm_customers.find({ "_id": 1001 });


// End of file - do not remove
