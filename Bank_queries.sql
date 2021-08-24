-- Lab | SQL basics (selection and aggregation)
-- In this lab, you will be using the Bank database.
-- Here, we will practice selecting and projecting data. You can finish all questions with only those clauses:
use bank;
-- Assume that any _id columns are incremental, meaning that higher ids always occur after lower ids. 
-- For example, a client with a higher client_id joined the bank after a client with a lower client_id.
/*Query 1
Get the id values of the first 5 clients from district_id with a value equals to 1.*/
select client_id from bank.client where district_id = 1 limit 5;
/*Query 2

In the client table, get an id value of the last client where the district_id equals to 72.*/
select client_id from bank.client where district_id = 72 order by client_id desc limit 1;

