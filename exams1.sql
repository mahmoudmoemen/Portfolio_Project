--we will try to know the relation between students scores and their
--gender race education level lunch and test preperation cource
--relation between (education level ^ , lunch , gender, test) with race 
 -- change some high school to high school

--Deleting duplicates
WITH CTE as(select gender , [race/ethnicity],
 [parental level of education],
 lunch , 
 [test preparation course],
 [math score],
 [reading score],
 [writing score],
 Row_Number() over
 (Partition BY
   gender ,[race/ethnicity] ,
   [parental level of education],
   lunch , 
   [test preparation course],
   [math score],
   [reading score],
   [writing score]
order by gender) as row_num
from exams)
Delete from CTE where row_num > 1
--there 's no duplicates found in our data set

-- checking typo errors
select distinct(gender)from exams
select distinct([race/ethnicity])from exams
select distinct([parental level of education])from exams
select distinct(lunch)from exams
select distinct([test preparation course])from exams
 
--Change some values in parental level of education column
update exams
set [parental level of education] = 'some college'
where [parental level of education] like '%bachelor%'

update exams
set [parental level of education] = 'some college'
where [parental level of education] like '%associate%'

update exams
set [parental level of education] = 'high school'
where [parental level of education] = 'some high school'


 --check missing values
 select * from exams where gender is null
 or [race/ethnicity]  is null
 or[parental level of education] is null
 or lunch is null
 or[math score]  is null or  [reading score] is null or  [writing score] is null

--checking data types

SELECT
COLUMN_NAME, 
DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'exams'

--data Exploration
select* from exams 

select avg([math score]) as avg_math_score,
avg([reading score]) as avg_reading_score,
avg([writing score]) as avg_writing_score
from exams

select gender, count(gender) as gender_count  from exams 
group by gender

-- calculating average score for each test according to genre
select gender ,
avg([math score]) as avg_math_score,
avg([reading score]) as avg_reading_score,
avg([writing score]) as avg_writing_score
from exams
group by gender

-- calculating average score for each test according to race
select [race/ethnicity] ,
avg([math score]) as avg_math_score,
avg([reading score]) as avg_reading_score,
avg([writing score]) as avg_writing_score
from exams
group by [race/ethnicity]
order by avg_math_score desc

--calculating average score for each test according to parental level of education
select [parental level of education] ,
avg([math score]) as avg_math_score,
avg([reading score]) as avg_reading_score,
avg([writing score]) as avg_writing_score
from exams
group by [parental level of education]
order by avg_math_score desc 

--calculating average score for each test according to lunch type
select lunch ,
avg([math score]) as avg_math_score,
avg([reading score]) as avg_reading_score,
avg([writing score]) as avg_writing_score
from exams
group by lunch
order by avg_math_score , avg_reading_score , avg_writing_score desc

-- calculating average score for each test according to test preparation course
select [test preparation course] ,
avg([math score]) as avg_math_score,
avg([reading score]) as avg_reading_score,
avg([writing score]) as avg_writing_score
from exams
group by [test preparation course]
order by avg_math_score , avg_reading_score , avg_writing_score desc


