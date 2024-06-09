-- Subqueries 
  -- Nested Query 
         -- Select
         -- From
         -- Where 
         -- Join 
-- Types of Subqueries 
   -- Scaler 
   -- Multiple 
   -- Corelated 
   
   use learndb;
   
   select * from myemp;
   
   select * from peopledata;
   
   select Avg(Purchase_AMOUNT) FROM PEOPLEDATA;
   
   -- Subquery in select 
   
   select avg(salary) as Average_salary,
          (select Avg(purchase_amount) from peopledata) as average_amount
          from myemp;
          
	# select Avg(salary), avg(Purchase_amount) from myemp,peopledata;
    