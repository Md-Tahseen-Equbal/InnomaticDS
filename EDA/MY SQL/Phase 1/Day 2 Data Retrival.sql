use learndb;

Create table mobiles(Brand    varchar(255),
Color    varchar(255),
Storage    int,
Rating    float(2,1),
Screen_size    float(3,2),
Battery    int,
Price int);

-- Retrive all mobiles which has  64 gb 
select * from mobiles
      where storage = 64;
      
-- Retrive the mobiles price > 50000
select * from mobiles
    where price > 50000;
    
--  find out no. mobiles prices > 50000
select count(*) as count from mobiles
  where price > 50000;
  
  -- Retrive mobile where the storage is 64gb and price > 20 k 
  select * from mobiles
    where storage = 64 and price > 20000;
    
-- Retrive apple mobiles where storage is 64 gb and 128 gb ?
select* from mobiles
  where (brand = "apple") and (storage = 64 or storage = 128);

-- Retrive Black Color Mobiles where storage 64,128 and rating > 4.0 and price from 25k to 80k
SELECT * 
FROM mobiles 
WHERE color = 'Black' 
  AND storage IN (64, 128) 
  AND rating > 4.0 
  AND price BETWEEN 25000 AND 80000;
  
-- Filter out Null values 
select * from peopledata;

select * from peopledata
   where rating is NULL;
   
   
-- Like 
-- REGEXP

/* Wildcards

-- % = N Sequences 
-- _ = Single Occurence 

*/

-- Retrive employees whose first_name is Starting with "S"
Select * from myemp
  where First_name Like "S%";
  
-- Retrive employees whose 2nd Letter is 'a' in their first_name 
Select * from myemp
   where First_name Like "_a%" ;

-- Retrive employee whose employee last name is ending with "n"
SELECT *
FROM myemp
WHERE last_name LIKE '%n';

-- Retrive Employee Whose first is ending with "a" and Last name starting with "s"
select * from myemp 
  where last_name Like "S%" And first_name Like "%a";

-- Regexp

Select * from myemp 
  where First_name regexp "^[ABC]";
  
select * from myemp
  where First_name regexp "z";
  
  
-- Data Filtering -2

-- Group By


-- Find Out average price for each mobile 

select Brand, avg(price)
    from mobiles
    group by Brand;
    
    
-- Where , group by 

Select Brand, Avg(Price) asAverage,
count(*) as freq
from mobiles
	where rating > 4.0
    group by Brand ;
    
    
-- Where ,Group by, having 
Select Brand, Avg(Price) as Average,
count(*) as freq
from mobiles
	where rating > 4.0
    group by Brand 
    Having count(Brand) > 100;
    
-- Where ,Group by, having ,order by
Select Brand, Avg(Price) as Average,
count(*) as freq
from mobiles
	where rating > 4.0
    group by Brand 
    Having count(Brand) > 100;
    Order by freq ASC,Average desc;
    
    
