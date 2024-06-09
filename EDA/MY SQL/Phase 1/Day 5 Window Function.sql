/*Window Function
 1. Aggregated Functions
   - MAX(): Returns the maximum value in a set.
   - MIN(): Returns the minimum value in a set.
   - SUM(): Returns the sum of all values in a set.
   - AVG(): Returns the average of all values in a set.
   - COUNT(): Returns the number of items in a set.
   - COUNT(DISTINCT column): Returns the count of distinct items in a set.
   - GROUP_CONCAT(): Concatenates values from a group into a single string (specific to some SQL dialects like MySQL).
   
 2.Ranking Function
 - RANK(): Assigns a rank to each row within the partition of a result set, with gaps in the ranking for ties.
 - DENSE_RANK(): Similar to RANK(), but does not leave gaps in the ranking for ties.
 - ROW_NUMBER(): Assigns a unique sequential integer to rows within a partition.
 - NTILE(n): Distributes the rows in an ordered partition into a specified number of approximately equal groups.
 
3. value Function 
- ISNULL(): Returns a specified value if the expression is NULL.
- COALESCE(): Returns the first non-NULL value in a list of expressions.
- NULLIF(): Returns NULL if the two specified expressions are equal.
- IFNULL(): Returns a specified value if the expression is NULL (specific to some SQL dialects like MySQL).
- NVL(): Replaces NULL with a specified value (specific to Oracle).
- LEAST(): Returns the smallest value in a list of expressions.
- GREATEST(): Returns the largest value in a list of expressions.
Window Function */

-- Question --

-- 1 Find Out the difference in salary of each employee  with respective avg salary of their departments
use learndb;

# Group by function
select dep_id, avg(salary) as average
   from myemp
   group by dep_id;
   
# Using Window Function 
select*,avg(salary) over(Partition by dep_id) as avg_salary_dep from myemp;

-- 2 Filter 
   