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
/*Query 3
Get the 3 lowest amounts in the loan table.*/
select amount from bank.loan order by amount limit 3;
/*Query 4
What are the possible values for status, ordered alphabetically in ascending order in the loan table?*/
select distinct(`status`) from bank.loan order by `status`;
-- Query 5
-- What is the loan_id of the highest payment received in the loan table?
select loan_id from bank.loan order by payments desc limit 1;
/*Query 6
What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount*/
select account_id as`#id`, amount from bank.loan order by  `#id` limit 5;
select amount from bank.loan order by amount limit 1;
-- Query 7
-- What are the account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
select account_id as `id` from bank.loan where duration = 60 and amount = 4980;
select amount from bank.loan where duration = 60 order by amount limit 1;
select account_id as `id` from bank.loan where amount = 18720 and duration = 60;
-- Query 8
-- What are the unique values of k_symbol in the order table?
-- Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause.
 -- You have to use backticks to escape the order table name.
 select distinct(k_symbol) from bank.`order`;
 -- Query 9

-- In the order table, what are the order_ids of the client with the account_id 34?
select order_id from bank.`order` where account_id=34;

-- Query 10

-- In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
select distinct(account_id) from bank.`order` where order_id between 29540 and 29560;

-- Query 11
-- In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
select distinct(amount) from bank.`order` where account_to=30067122;
-- Query 12

-- In the trans table, show the trans_id, date, 
-- type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
select trans_id, `date`, `type`, amount from bank.trans where account_id=793 order by `date` desc limit 10;
-- Query 13

-- In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id?
 -- Show the results sorted by the district_id in ascending order.
 select district_id, count(client_id) from bank.`client` where district_id<10 group by  district_id order by district_id;
-- Query 14
-- In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
select `type`, count(card_id) from bank.card group by `type` order by count(card_id) desc;
-- Query 15
-- Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
select account_id, sum(amount) as total_amount from bank.loan group by account_id order by total_amount desc limit 10;
-- Query 16
-- In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, 
-- ordered by date in descending order.
select `date`, count(loan_id) from bank.loan where `date`< 930907 group by `date` order by `date` desc;
-- Query 17
-- In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration,
-- ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
select `date`, count(loan_id), count(duration) from bank.loan where `date` between 971201 and 971231 order by `date` asc, duration asc;



 




















