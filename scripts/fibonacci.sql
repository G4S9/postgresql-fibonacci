create or replace view fibonacci as (
  with recursive fibonacci(val, next_val) as (
    select 1::DECIMAL, 1::DECIMAL union all select next_val, val + next_val from fibonacci
  )
  select * from fibonacci
  -- note: there is no need to add a stop condition using a WHERE clause here
);
