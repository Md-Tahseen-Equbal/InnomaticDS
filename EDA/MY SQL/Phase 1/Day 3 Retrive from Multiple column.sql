-- Multiple Tables
   # Primary Tables
   # Foreign Tables 
   # Types of Keys 
       # Primary Key      -- Unique Item in single Column 
       # Composite Keys   --  Combination of two or more column to create Unique data
       # Surrogate Key    -- If in the data not a single column are eligible for primary key then we create a new one by self .
       # Foreign Key      -- One Table P.K is F.K is another Table 
   # Types of relationships
	 # One to One    -- Person to Adhar 
     # One to Many   -- Customer to Order 
     # Many to Many  -- Student to Course 
   # ER Diagram 
   # Types of Join
	-- Inner join   -- All the common Record retrive  (IMP)
    -- Outer Join 
		-- Left Outer Join  -- Complete A and Common Record Retrive / Non common value will be Null (IMP)
        -- Right Outer Join -- Coplete B and Common Record Retrive/ Non common value will be Null
        -- Full Outer Join  -- Complete A and B Record Retrive / Extra Place will be Null
	-- Self Join -- 
    -- Cross Join 
   
-- Retrive from Multiple Column 

Use Learndb;
select * from members;
select * from movies ;

-- Retrive the movies which are rented so far
  select * from movies 
   inner join members
      on movies.id = members.movieid;

-- Find out what are the movies rented and not rented so far 
  Select * from movies 
     Left Join Members
       on movies.id = members.movieid;
       
-- Find Out all the members who have rented a movie and not rented 
  Select * from movies 
     Right Join Members
       on movies.id = members.movieid;

-- Cross Join 
Select * from meals;

select * from drinks;

# Cross Join
select * from Meals
   cross join Drinks;
   
select meals.mealname,drinks.drinkname,
   (meals.rate + drinks.rate) as total_bill
       from meals
   cross join Drinks
   order by meals.mealname;
   
-- Self Joins

select e.emp_id,e.first_name,e.mgr_id,m.first_name from myemp as e
   Inner join myemp as m 
     on m.mgr_id = e.emp_id;
     

   
       

-- Data Modeling / Normalization)Task
       