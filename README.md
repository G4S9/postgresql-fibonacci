# TL;DR

Creating an infinite (as long as DECIMALs go) view in PostgreSQL with fibonacci numbers:

```sql

create or replace view fibonacci as (
  with recursive fibonacci(val, next_val) as (
    select 1::DECIMAL, 1::DECIMAL union all select next_val, val + next_val from fibonacci
  )
  select * from fibonacci
  -- note: there is no need to add a stop condition using a WHERE clause here
);

```

Usage (first N = 1, 10, 100, 1000, etc. fibonacci numbers):

```sql

-- simply use LIMIT when selecting the values from the view

select val from fibonacci limit 1;

select val from fibonacci limit 10;

select val from fibonacci limit 100;

select val from fibonacci limit 1000;

```

## Demo

[10,000th fibonacci number :)](https://github.com/G4S9/postgresql-fibonacci/assets/96652361/7fb2245b-5d08-47a2-b536-13a041cbc9ac)
