# create a database to store all the required tables and to perform queries

create database projectSQL;

# use the database projectSQL for storing all the required tables and performing queries on it

use projectSQL;

# creating the required tables as per the question statement

create table Worker(
WORKER_ID int,
FIRST_NAME varchar(50),
LAST_NAME varchar(50),
SALARY double,
JOINING_DATE datetime,
DEPARTMENT varchar(20)
);

create table Bonus(
WORKER_REF_ID int,
BONUS_DATE datetime,
BONUS_AMOUNT double
);

create table Title(
WORKER_REF_ID int,
WORKER_TITLE varchar(50),
AFFECTED_FROM datetime
);

#inserting the corresponding records into the created tables

# table no.1 Worker
 
insert into Worker(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
values (1,'Monika','Arora',100000,'2014-02-20 09:00:00','HR'),
	   (2,'Niharika','Verma',80000,'2014-06-11 09:00:00','Admin'),
       (3,'Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),
       (4,'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
       (5,'Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
       (6,'Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
       (7,'Satish','Kumar',75000,'2014-01-20 09:00:00','Account'),
       (8,'Geetika','Chauhan',90000,'2014-04-11 09:00:00','Admin');
       
# table no.2 Bonus

insert into Bonus(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT)
values (1,'2016-02-20 00:00:00',5000),
	   (2,'2016-06-11 00:00:00',3000),
       (3,'2016-02-20 00:00:00',4000),
       (1,'2016-02-20 00:00:00',4500),
       (2,'2016-06-11 00:00:00 ',3500);
       
# table no.3 Title

insert into Title(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM)
values (1,'Manager','2016-02-20 00:00:00'),
	   (2,'Executive','2016-06-11 00:00:00'),
       (8,'Executive','2016-06-11 00:00:00'),
       (5,'Manager','2016-06-11 00:00:00'),
       (4,'Asst.Manager','2016-06-11 00:00:00'),
       (7,'Executive','2016-06-11 00:00:00'),
       (6,'Lead','2016-06-11 00:00:00'),
       (3,'Lead','2016-06-11 00:00:00');
       
# view the tables:
select * from Worker;
select * from Bonus;
select * from Title;

-- ------------------------------------------------------------------------------------------------------------------
											  # QUERIES #
-- ------------------------------------------------------------------------------------------------------------------


# Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>

select FIRST_NAME as WORKER_NAME from Worker; 
# as is used for aliasing , here  FIRST_NAME in Worker is named as WORKER_NAME

-- ------------------------------------------------------------------------------------------------------------------

# Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select upper(FIRST_NAME) as FIRST_NAME_in_CAPS from Worker;
# upper() function is used for storing the string in uppercase letters

-- ------------------------------------------------------------------------------------------------------------------

# Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select distinct DEPARTMENT as unique_departments from Worker;
# distinct keyword is used for finding only the unique items in that particular column 

-- ------------------------------------------------------------------------------------------------------------------

# Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.

select substring(FIRST_NAME,1,3) as FIRSTNAME_first3chars from Worker; 
# SUBSTR() is a synonym for SUBSTRING(). So, we can also use substr()

-- ------------------------------------------------------------------------------------------------------------------

# Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.

select position(BINARY'a' in (select FIRST_NAME from Worker where FIRST_NAME='Amitabh')) as query_result;
# to search based on case-sensitive fashion, We can use the BINARY operator. This helps in distinguishing lower and upper case letters

-- ------------------------------------------------------------------------------------------------------------------

# Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

select rtrim(FIRST_NAME) as right_clean_FIRSTNAME from Worker; 
# trim is used for removing white spaces 
# whereas rtrim is used for removing right spaces after the word

-- ------------------------------------------------------------------------------------------------------------------

# Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

select ltrim(DEPARTMENT) as left_clean_DEPARTMENT from Worker;
# trim is used for removing white spaces 
# whereas ltrim is used for removing left spaces before the word

-- ------------------------------------------------------------------------------------------------------------------

# Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

select 
	distinct DEPARTMENT,                # unique values of DEPARTMENT
	length(DEPARTMENT) as length        # for printing its length
from 
	Worker;
 
-- ------------------------------------------------------------------------------------------------------------------
 
# Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

select replace(FIRST_NAME,'a','A') from Worker;
# replacing the column first_name using replace() function;

-- ------------------------------------------------------------------------------------------------------------------

# Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. 
#       A space char should separate them.

select concat(FIRST_NAME,' ',LAST_NAME) as COMPLETE_NAME from Worker;
#combining two strings seperated by ' ' in two columns using concat() function.

-- ------------------------------------------------------------------------------------------------------------------

# Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select * from Worker order by FIRST_NAME asc;
# order by is the keyword which is used for sorting and ordering operations to be done on the specified columns

-- ------------------------------------------------------------------------------------------------------------------

# Q-12. Write an SQL query to print all Worker details from the Worker table 
#       order by FIRST_NAME Ascending and DEPARTMENT Descending.

select * from Worker order by FIRST_NAME asc, DEPARTMENT desc;
# order by is the keyword which is used for sorting and ordering operations to be done on the specified columns

-- ------------------------------------------------------------------------------------------------------------------

# Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

select * from Worker where FIRST_NAME in ('Vipul','Satish');
# where keyword is used for fetching particular details that are required. It acts as conditioning filter.
# in keyword is used as inclusive consideration.

-- ------------------------------------------------------------------------------------------------------------------

# Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

select * from Worker where FIRST_NAME not in ('Vipul','Satish');
# where keyword is used for fetching particular details that are required. It acts as conditioning filter.
# in keyword is used as inclusive consideration. and applying not before that gives the complimentary result.

-- ------------------------------------------------------------------------------------------------------------------

# Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

select * from Worker where DEPARTMENT = 'Admin';
# we can also use =, instead of in if there is only one condition to compare

-- ------------------------------------------------------------------------------------------------------------------

# Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select * from Worker where position(binary'a' in FIRST_NAME); 
# to search based on case-sensitive fashion, We can use the BINARY operator. This helps in distinguishing lower and upper case letters
# the above condition of having 'a' is used on first_name to print all details.

# or 

select * from Worker where FIRST_NAME like '%a%';
# like is the keyword used for finding desired patterns or strings required in a given column
# '%a%' refers to the (anycharacters+a+anycharacters)

-- ------------------------------------------------------------------------------------------------------------------

# Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from Worker where FIRST_NAME like '%a';
# like is the keyword used for finding desired patterns or strings required in a given column
# '%a' refers to the (anycharacters+a) at the end

-- ------------------------------------------------------------------------------------------------------------------

# Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

select * from Worker where FIRST_NAME like '%h' and length(FIRST_NAME) = 6;
# like is the keyword used for finding desired patterns or strings required in a given column
# '%h' refers to the (anycharacters+h) at the end
# length() gives the length of the string
 
 # or 
 
select * from Worker where FIRST_NAME like '_____h';
# The _ takes one character length so (five_ + h) is used for finding FIRST_NAME ends with 'h' with length 6

-- ------------------------------------------------------------------------------------------------------------------

# Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select * from Worker where SALARY between 100000 and 500000;
# (between and operator) is used for range based condition.

-- ------------------------------------------------------------------------------------------------------------------

# Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select * from Worker where JOINING_DATE like '2014-02%'; 
# using like keyword we can print all the joining_dates in feb'2014 with keyword where 

# or
 
select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 02;
# using keywords, year and month of the datetime library, we can print the details of the Workers.

  -- ------------------------------------------------------------------------------------------------------------------

# Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

 select count(*) as Total_Admins from Worker where DEPARTMENT = 'Admin'; 
 # count(*) or count(1) is used for counting the no. of rows in a column with obeying the condition in the where clause.
 
-- ------------------------------------------------------------------------------------------------------------------

# Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

select FIRST_NAME,LAST_NAME from Worker where SALARY >=50000 and SALARY<=100000;
# we can also do this with (between and operator) as it is used for range based condition.

-- ------------------------------------------------------------------------------------------------------------------

# Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

select 
	DEPARTMENT,
	count(1) as total_workers   # used for counting the workers
from 
	Worker                   
group by
	DEPARTMENT                  # grouping the count of workers based on the departments
order by
	total_workers desc;         # for descending order of no. of workers 
    
-- ------------------------------------------------------------------------------------------------------------------

# Q-24. Write an SQL query to print details of the Workers who are also Managers.

select 
	wrk.WORKER_ID, tl.WORKER_TITLE, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT
from
	Worker as wrk
join                                                          # we can also inner join which is same to the join 
	title as tl
on 
	tl.WORKER_REF_ID = wrk.WORKER_ID                          # joining the two tables with worker id's for extracting required info
where
	tl.WORKER_TITLE = 'Manager';                              # using the where conditon for filter only 'Manager'

-- ------------------------------------------------------------------------------------------------------------------

# Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

# As the question is asked about matching data in only some fields we should analyze the tables

# title table duplicates in columns except WORKER_REF_ID
 
select
	WORKER_TITLE,
    AFFECTED_FROM,
    count(*) as no_of_workers
from
	Title
group by
	WORKER_TITLE, AFFECTED_FROM
having 
	no_of_workers > 1;
    
# bonus table duplicates in columns except BONUS_AMOUNT

select 
	WORKER_REF_ID,
    BONUS_DATE,
    count(*) as no_of_bonus_got
from
	Bonus
group by
	WORKER_REF_ID, BONUS_DATE
having
	no_of_bonus_got > 1;
    
# Worker table duplicates in columns JOINING_DATE, DEPARTMENT

select
	JOINING_DATE,
    DEPARTMENT,
    count(*) as no_of_workers_joined
from 
	Worker
group by 
	JOINING_DATE, DEPARTMENT
having
	no_of_workers_joined>1;

-- ------------------------------------------------------------------------------------------------------------------

# Q-26. Write an SQL query to show only odd rows from a table.

# NOTE: this query can be performed only on the table which has continous and monotonous integer ids' along the rows.

select * from Worker where WORKER_ID % 2 != 0;
# using % operator (returns remainder)

-- ------------------------------------------------------------------------------------------------------------------

# Q-27. Write an SQL query to show only even rows from a table.

# NOTE: this query can be performed only on the table which has continous and monotonous integer ids' along the rows.

select * from Worker where WORKER_ID % 2 = 0;
# using % operator (returns remainder)

-- ------------------------------------------------------------------------------------------------------------------

# Q-28. Write an SQL query to clone a new table from another table.

# there are 2 ways, 1st Way :

create table Worker_Clone1 select * from Worker;   # simple cloning

# 2nd Way:

create table Worker_Clone2 like Worker;           # step 1: shallow cloning i.e., only structure no data 
insert into Worker_Clone2 select * from Worker;    # step 2: deep cloning i.e., including the data 

-- ------------------------------------------------------------------------------------------------------------------

# Q-29. Write an SQL query to fetch intersecting records of two tables.

# NOTE : MySQL does not support the INTERSECT operator. So, we need to use join (inner join)

# The Common ids between the Worker and Bonus Table are 1,2 and 3. so we print the working and bonus details of those ids.

select 
	wrk.WORKER_ID, FIRST_NAME,  LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT, BONUS_DATE, BONUS_AMOUNT
from 
	Worker as wrk 
inner join                             # we use (inner join ... on) operator on Worker and Bonus Table for intersection.
	bonus as bon 
on 
	bon.WORKER_REF_ID = wrk.WORKER_ID;  # the common column in both the tables is WORKER_ID and WORKER_REF_ID   
    
-- ------------------------------------------------------------------------------------------------------------------

# Q-30. Write an SQL query to show records from one table that another table does not have.
     
# NOTE : MySQL does not support the MINUS operator.So, we need to use not in operator

# The bonus table does not have records of ids 4, 5, 6, 7, 8. so those records from another table are to printed

select 
	*
from
	Worker
where
	WORKER_ID not in (select WORKER_REF_ID from Bonus);            # not in used for excluding 1,2 and 3

-- ------------------------------------------------------------------------------------------------------------------

# Q-31. Write an SQL query to show the current date and time.

select current_date() as currentdate,current_time() as currenttime; 
# date and time in two seperate columns (TIME in 24 hour format)

select now();
# date and time in a single column (TIME in 24 hour format) 

# we can also use current_timestamp() function 
# unless the data is collected at one time zone and analysis were done at other time zone

-- ------------------------------------------------------------------------------------------------------------------

# Q-32. Write an SQL query to show the top n (say 10) records of a table.

# we use (order by... asc/desc limit keyword for the top n or last n kind of queries.

# On Worker Table Salary

select * from Worker order by SALARY desc limit 10;
# top 10 records based on SALARY from the Worker table

# On Worker Table Seniority

select * from Worker order by JOINING_DATE asc limit 10;
# top 10 records based on JOINING_DATE(i.e., SENIORITY) from the Worker table

-- ------------------------------------------------------------------------------------------------------------------

# Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

select distinct SALARY, FIRST_NAME from WORKER order by SALARY desc limit 1 offset 4;

# in general for nth highest salary we use:  select distinct salary ...... limit 1 offset (n-1);   
# we use (n-1) because one is already count when writing (limit 1) meaning take 1 at a time

-- ------------------------------------------------------------------------------------------------------------------

# Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method

select                                               
	FIRST_NAME,                              		 
	SALARY
from												
	Worker wa
where 												
	5-1 = ( select									  
				count( distinct ( wb.SALARY ) )		
		  from									     
				Worker wb						    
		  where
				wb.SALARY >= wa.SALARY);
                
# EXPLANATION:
# traverse through the worker table salaries one by one 
# verify the number of highest salaries through wb table with every salary from the wa table iteration
# if the no. of highest salaries greater than the current wa salary iteration = 4 (i.e., 4 members are above the present)
# Thus, finally gives the 5 th highest salary without using top or limit keywords

-- ------------------------------------------------------------------------------------------------------------------

# Q-35. Write an SQL query to fetch the list of employees with the same salary.

select 
	wa.WORKER_ID, wa.FIRST_NAME, wa.SALARY 
from
	Worker as wa,                     # Using two tables is the key point in accessing the employees with same salaries
	Worker as wb
where 
	wa.WORKER_ID != wb.WORKER_ID      # since, the salaries and firstnames may be same but for sure ids' will be unique
and
	wa.SALARY = wb.SALARY
order by
	wa.WORKER_ID asc;
    
-- ------------------------------------------------------------------------------------------------------------------


# Q-36. Write an SQL query to show the second highest salary from a table.

select 
	SALARY,FIRST_NAME
from
	Worker
where SALARY = (select distinct SALARY from Worker order by SALARY desc limit 1 offset 1);

# printing the 2nd highest SALARY and his FIRST_NAME with the help of limit and offset(n-1) for nth highest salary

-- ------------------------------------------------------------------------------------------------------------------

# Q-37. Write an SQL query to show one row twice in results from a table.

# first observe the title table, it has only one Asst.Manager
# after creating a query for its duplicate it will show 2 Asst.Manager

select WORKER_REF_ID, WORKER_TITLE from Title where WORKER_TITLE = 'Asst.Manager'  
union all
select WORKER_REF_ID, WORKER_TITLE from Title;    # the row [4, Asst.Manager] is repeated twice 
 
# NOTE : if we use union then it removes the duplicates so we use (union all) keyword for creating duplicates.

-- ------------------------------------------------------------------------------------------------------------------

# Q-38. Write an SQL query to fetch intersecting records of two tables

select
	wr.WORKER_ID, wr.DEPARTMENT, tl.WORKER_TITLE, wr.FIRST_NAME, wr.SALARY, wr.JOINING_DATE, tl.AFFECTED_FROM
from
	Worker as wr
join 
	Title as tl
on 
	wr.WORKER_ID = tl.WORKER_REF_ID;         # intersection of tables Worker and Title using keyword (join...on)

-- ------------------------------------------------------------------------------------------------------------------

# Q-39. Write an SQL query to fetch the first 50% records from a table

# NOTE: this query can be performed only on the table which has continous and monotonous integer ids' along the rows.
 use projectsql;
 select * from Worker where WORKER_ID <= (select ceil(count(WORKER_ID)/2) from Worker);
# ceil is used for odd number of records for ensuring the fetching of atleast 50% records
# count(WORKER_ID) is used for finding the total number of rows(ids) in the table

-- ------------------------------------------------------------------------------------------------------------------

# Q-40. Write an SQL query to fetch the departments that have less than five people in it

select 
	DEPARTMENT,
	count(*) as no_of_workers 
from
	Worker
group by 
	DEPARTMENT
having
	no_of_workers < 5;            # conditon : fetch the departments that have less than five people in it

-- ------------------------------------------------------------------------------------------------------------------

# Q-41. Write an SQL query to show all departments along with the number of people in there.

select 
	DEPARTMENT,
	count(*) as no_of_workers 
from
	Worker
group by 
	DEPARTMENT;                  # No condition here, we only grouped the no. of workers based on DEPARTMENT 
    
-- ------------------------------------------------------------------------------------------------------------------

# Q-42. Write an SQL query to show the last record from a table. 

# NOTE: this query can be performed only on the table which has continous and monotonous integer ids' along the rows.

select * from Worker where WORKER_ID in (select max(WORKER_ID) from Worker);

# sticking to the fact that the last record having the highest ID so the highest ID details are to be fetched.

-- ------------------------------------------------------------------------------------------------------------------

# Q-43. Write an SQL query to fetch the first row of a table.

# NOTE: this query can be performed only on the table which has continous and monotonous integer ids' along the rows.

select * from Worker where WORKER_ID in (select min(WORKER_ID) from Worker);

# sticking to the fact that the first record having the lowest ID so the lowest ID details are to be fetched.

-- ------------------------------------------------------------------------------------------------------------------

# Q-44. Write an SQL query to fetch the last five records from a table.

# NOTE: this query can be performed only on the table which has continous and monotonous integer ids' along the rows.

# method 1 :
(select * from Worker order by WORKER_ID desc limit 5) order by WORKER_ID;

# method 2 :
select * from Worker where WORKER_ID > (select COUNT(WORKER_ID) from Worker) - 5;

# sticking to the fact that the ID's are continous and assuming the last record is the record with largest ID.

-- ------------------------------------------------------------------------------------------------------------------

# Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

select 
	tab1.DEPARTMENT, tab2.FIRST_NAME, tab1.SALARY 
from 
	(select DEPARTMENT, max(SALARY) as SALARY from Worker group by DEPARTMENT) as tab1   
join
		Worker as tab2
on
	tab1.DEPARTMENT = tab2.DEPARTMENT
and 
 	tab1.SALARY = tab2.SALARY;
    
# EXPLANATION: 
# tab1 is the new named table containing the departments and its highest salaries.
# tab2 is the Worker table
# join is used to combine (departments and its salaries present in tab1) + (FIRST_NAME present in tab2)   

-- ------------------------------------------------------------------------------------------------------------------

# Q-46. Write an SQL query to fetch three max salaries from a table.

select distinct SALARY from Worker order by SALARY desc limit 3;

# the kewword limit n is used to fetch 'n' no. of records. 
# The salaries are ordered in descending order as we want the highest salaries

-- ------------------------------------------------------------------------------------------------------------------

# Q-47. Write an SQL query to fetch three min salaries from a table.

select distinct SALARY from Worker order by SALARY asc limit 3;
# the kewword limit n is used to fetch 'n' no. of records. 
# The salaries are ordered in ascending order as we want the lowest salaries

-- ------------------------------------------------------------------------------------------------------------------

# Q-48. Write an SQL query to fetch nth max salaries from a table.

# 1st way :-

select distinct SALARY, FIRST_NAME from Worker order by SALARY desc limit 1 offset 4;
# in general we use offset (n-1) for n th position we used descending order for 

# 2nd way :- 

select                                               
	FIRST_NAME,                              		 
	SALARY
from												
	Worker wa
where 												
	5-1 = ( select									                     # in general we use (n-1) for the nth highest Salary. 
				count( distinct ( wb.SALARY ) )		
		  from									     
				Worker wb						    
		  where
				wb.SALARY >= wa.SALARY)
order by 
	SALARY desc;
    
-- ------------------------------------------------------------------------------------------------------------------

# Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

select DEPARTMENT, sum(salary) as TOTAL_SALARIES from Worker group by DEPARTMENT;

# using groupby we can group the sum of salaries based on DEPARTMENT.  

-- ------------------------------------------------------------------------------------------------------------------

 # Q-50. Write an SQL query to fetch the names of workers who earn the highest salary   
 
select WORKER_ID,FIRST_NAME,LAST_NAME,SALARY from Worker where SALARY = (select max(SALARY) from Worker);

# we have to use the subquery to find the highest SALARY and then we use the main query to fetch id,name,and salary as shown above.

-- ------------------------------------------------------------------------------------------------------------------
										#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
-- ------------------------------------------------------------------------------------------------------------------
use projectsql;
-- ------------------------------------------------------------------------------------------------------------------
									      # VINAY AMRUTH PAILA - BATCH 104 #
-- ------------------------------------------------------------------------------------------------------------------
