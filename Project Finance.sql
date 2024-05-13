create database live;
use live;
select * from financial_loan_dataset;

select count(id) as toatal_loan_aplication from financial_loan_dataset; -- 38576

select sum(loan_amount) as toatal_amount_funded from financial_loan_dataset; -- 435757075
select sum(total_payment) as toatal_amount_received from financial_loan_dataset; -- 473070933

select avg(int_rate)*100 as avg_Int_rate from financial_loan_dataset; -- 12.048831397760178
select round(avg(int_rate),2)*100 as avg_Int_rate from financial_loan_dataset; -- 12 

select avg(dti)*100 as avg_dti from financial_loan_dataset; -- 13.32743311903776 #debt_to_income_ratio 
select round(avg(dti),2)*100 as avg_dti from financial_loan_dataset; -- 13

 # good loan 
 select loan_status from financial_loan_dataset;
 
select(count(case when loan_status = 'Fully Paid'  or loan_status = 'Current' then id end )) as good_loan_percent from financial_loan_dataset;
select(count(case when loan_status = 'Fully Paid'  or loan_status = 'Current' then id end )*100)/count(id) from financial_loan_dataset; -- 86.1753
select (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100)/count(id) as good_loan_percent from financial_loan_dataset;

# good loean_funded_amount
 
 select Sum(loan_amount) as good_loan_amount from financial_loan_dataset where loan_status = 'Fully piad' or loan_Status = 'Current';
 select sum(loan_amount) as good_loan_amount from financial_loan_dataset where loan_status = 'Fully Paid' or loan_status = 'Current';
 select sum(total_payment) as good_loan_received_amount from financial_loan_dataset where loan_status = 'Fully Paid' or loan_status = 'Current';
 
#bad loan
select (count(case when loan_status = 'Charged Off' then id end)*100)/count(id) as bad_loan_percent from financial_loan_dataset;
select (count(case when loan_status = 'Charged Off' then id end) ) as bad_loan_count from financial_loan_dataset;
select sum(loan_amount) as bad_loan_amount from financial_loan_dataset where loan_status = 'Charged Off';
select sum(total_payment) as bad_loan_received_amount from financial_loan_dataset where loan_status = 'Charged Off';


