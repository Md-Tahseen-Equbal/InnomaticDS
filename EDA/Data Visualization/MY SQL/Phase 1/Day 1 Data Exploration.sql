# Data Analysis With Sql 
# To specify the data base that you want to use wrt other 
# We can use "use" keyword
use learndb;

-- Data Exploration

select * from myemp;  # To retrive data from a table  and sql in not case sensitive 

-- df.head()
select * from myemp limit5;  #To retrive first 5 record 

-- df.info()

Describe myemp;

-- unique
select distinct dep_id from myemp;

-- specified columns
select first_name,last_name from myemp;

-- shape 
select count(*) from myemp;

-- nunique 
select count(distinct dep_id) from myemp;

-- describe
select * from myemp;
# To change the column name and various mathematical function use "as" keyword .
select min(salary),
       max(salary),
       avg(salary),
       std(salary),
       variance(salary) as variance,
       count(salary) as count from myemp;

-- Categorical (Value_counts())
/* Find out how many employees are working in each department */
select dep_id, count(*) from myemp
     group by dep_id
     order by freq desc ;

-- tail 
select * from myemp
	order by EMP_ID desc limit 5 ;
    
-- New Columns

select * from myemp;

-- Function 
-- Math 
-- Case Statement ( Condition Based) 

select * ,concat(first_name," ",last_name) as full_name 
     from myemp;  # Derived / Temporary Column 
     
-- Math 
-- Find out Bonus which is 20% of employees salary 

Select*, Salary *0.2 as Bonus from myemp;

-- Case Statement ( if -else )

select * from myemp;
select * , (CASE
             when salary > 20000 then " Highly paid"
             when salary <= 20000 and salary > 10000 then " Average Paid "
             else "Low Paid" end ) as salary_cat  from myemp;
 
 --  Write any query in sql format use [ CTRL+B ]
 
    


show tables;   # To show the table in the db 
