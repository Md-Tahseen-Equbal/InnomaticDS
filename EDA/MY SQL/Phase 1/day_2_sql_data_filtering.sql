use learndb;
Create table mobiles(Brand    varchar(255),
Color    varchar(255),
Storage    int,
Rating    float(2,1),
Screen_size    float(3,2),
Battery    int,
Price int);

select *from mobiles
where storage = 64;
-- Retrive mobiles price >50000
select * from mobiles
	where price >50000;

-- find out no.of mobiles price >50000
select count(*) as count from mobiles
	where price >50000;

-- Retrive mobiles where the storage is 64gb and price >20k
select * from mobiles
where storage=64 and price >20000;

-- retrive apple mobiles where storage is 64 or 128?
select * from mobiles
	where (brand = "apple") and (storage = 64 or storage = 128);

-- Retrive black color mobiles where storage 64,128 and rating >4.0 and price from 25k to 80k
SELECT 
    *
FROM
    mobiles
WHERE
    color = 'black'
        AND storage IN (64 , 128)
        AND (price BETWEEN 20000 AND 80000)
        AND rating > 4.0;
-- filter null values
select * from peopledata
	where rating is null;

select * from peopledata
	where rating is not null;

-- like
/* wildcards 
% = N sequence
_ = single sequnce
*/
-- retrive employee whose name starts with s
 select * from myemp
	where first_name like "s%";
    
-- retrive emp whose 2nd letter is a in there first names
select * from myemp
	where first_name like "____";
    
-- 
select * from myemp
	where last_name like "%n";
select * from myemp
	where first_name like "%a" and last_name like "s%";

select * from myemp
	where first_name regexp "^[abc]";
    
    
-- Data Filtering -2 

-- group by
select * from mobiles;

select brand, avg(price) from mobiles
	group by brand
    having brand = "apple";
    
--
select brand,avg(price) as Average from mobiles
where rating > 4.0
group by brand
having count(*) >30
order by Average desc
limit 1;

-- 
select * from mobiles;
select brand, avg(price) from mobiles
group by brand;

select brand,avg(price) as Average, count(*) as freq from mobiles
where rating > 4.0
group by brand
having count(brand) > 100;

-- where, group by, having, order by
select brand,avg(price) as Average, count(*) as freq from mobiles
where rating > 4.0
group by brand
having count(brand) > 100
order by freq asc, average desc;

-- multi group by
select brand,storage ,avg(price) as Average, count(*) as freq from mobiles
where rating > 4.0
group by brand,storage
having count(*) > 30
order by brand,freq asc, average desc;