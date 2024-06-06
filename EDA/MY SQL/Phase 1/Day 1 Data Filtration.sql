-- Data Filtering 

-- indexing
-- slicing
-- Condition Based
 
-- ------------

-- Group by
-- Order by (sort_Values)

/* Where Clause 
-- It helps to filter the record based on condition */

-- Retrieve employee working in dep_id = 60

select * from myemp
     where dep_id = 70;
     
Select* ,Salary *0.2 as Bonus from myemp
     where bonous > 3000;  -- Error due to OFE (Order of execution)
     
     
-- Indexing ( Try to access only one row and one column )
   -- column
    select first_name from myemp;
    
    -- Row 
    select * from myemp limit 1 ;
    
    select * from myemp limit 1 offset 1;   -- 2nd record 
    
    -- 59th 
    select * from myemp limit 1 offset 58; -- By default offset value is 0
    
    select first_name from myemp limit 1 offset 58;
    
    -- slicing 
    select * from myemp limit 6 offset 4;
    
    select first_name , last_name from myemp limit 6 offset 4 ;
