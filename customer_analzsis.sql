create schema customers;
use customers;
-- Which columns are numerical?  Which columns are categorical?   Check and deal with NaN values.
explain analysis;
describe analysis;
-- Datetime format - Extract the months from the dataset and store in a separate column. 
-- Then filter the data to show only the information 
ALTER TABLE analysis ADD `month` varchar(20);
SET SQL_SAFE_UPDATES = 0;
update analysis set `month` = "JANUARY" where `Effective To Date` like "1%";
update analysis set `month` = "FEBRUARY" where `Effective To Date` like "2%";
select `month` from analysis;
-- 



