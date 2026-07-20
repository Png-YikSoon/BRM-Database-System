# BigRig Movers Database Management System

A full relational database system built with Oracle SQL and MongoDB 
for a trucking logistics company.

## Tech Stack
- Oracle SQL (19c)
- MongoDB
- Git

## Project Overview
Designed and implemented a complete database system to manage 
truck-trailer logistics operations including customer quotes, 
job scheduling, employee hierarchy, and service management.

## What's Included

| File | Description |
|------|-------------|
| T1-brm-schema.sql | DDL - Table creation and constraints |
| T2-brm-insert.sql | Sample data population |
| T3-brm-dm.sql | DML - Transactions and data manipulation |
| T4-brm-mods.sql | Live schema modifications |
| T5-brm-select.sql | Advanced SQL analytical queries |
| T6-brm-json.sql | JSON document generation from relational data |
| T6-brm-mongo.mongodb.js | MongoDB queries and operations |

## Key Features
- Normalised relational schema across 9 tables with full 
  constraint enforcement including composite PKs, 
  self-referencing FKs, and conditional CHECK constraints
- Live schema evolution using ALTER TABLE on a populated 
  database without data loss
- Complex analytical SQL queries with correlated subqueries, 
  dynamic classification, and formatted output
- Relational to NoSQL migration using Oracle JSON functions 
  and MongoDB embedded documents

## Database Schema
- **TRUCK** / **TRAILER** / **COMBINATION** - Fleet management
- **CUSTOMER** - Customer registration
- **EMPLOYEE** - Staff with manager hierarchy
- **QUOTE** - Customer quote requests
- **JOB** - Scheduled jobs linked to quotes
- **SERVICE** / **TASK_TYPE** / **SERVICE_TASK** - 
  Truck maintenance tracking

## Academic Context
This was completed as Assignment 2 for FIT2094 Databases 
at Monash University Malaysia (2026 Semester 1).