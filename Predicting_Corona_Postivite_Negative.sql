use corona_test;

select * from corona_sql_data limit 1000;

-- 1) Find the number of corona patients who faced shortness of breath.

select count(Corona) from corona_sql_data where (Corona='positive') and (Shortness_of_breath='TRUE');

-- ans) there are total 1164 corona patients who faced shortness of breath.alter

-- ------------------------------------------------------------------------------------------------------
-- 2) Find the number of negative corona patients who have fever and sore_throat. 

select count(Corona) from corona_sql_data where (Corona='negative') and (sore_throat='TRUE') and (fever='TRUE');

-- ans) there are only 121 negative corona patients who have fever and sore_throat.

-- --------------------------------------------------------------------------------------------------------

-- 3) Group the data by month and rank the number of positive cases.

-- converting Test_date into date object

alter table corona_sql_data
add column Date_of_test date;

update corona_sql_data
set Date_of_test=str_to_date(Test_date,'%d-%m-%Y')

-- droping the existing 'Test_date' column as it in string formate

alter table corona_sql_data
drop column Test_date;

select month(Date_of_test), count(Corona) as total_cases from corona_sql_data 
where Corona='positive' group by month(Date_of_test) order by total_cases desc;

-- ans) there are more no.of corona positive cases in the month of April, the count is 8881 and in the month of march there are 5842 corona postive cases.

-- ------------------------------------------------------------------------------------------------------

-- 4) Find the female negative corona patients who faced cough and headache.

select count(*) from corona_sql_data 
where (sex='female') and (corona='negative') and (Cough_symptoms='TRUE') and (Headache='TRUE')

-- ans) there are only 60 females negative corona patients who faced cough and headache

-- -------------------------------------------------------------------------------------------------------

-- 5) How many corona patients who have faced breathing problems?

select count(*) from corona_sql_data
where (Corona='positive') and (Shortness_of_breath='TRUE')

-- ans) there are 1164 corona patients who have faced breathing problems.

-- ------------------------------------------------------------------------------------------------------

-- 6) Which three symptoms were more common among COVID positive patients?
 
 select Corona,count(Cough_symptoms) as cases from corona_sql_data
 where Cough_symptoms='TRUE' group by Corona order by cases desc
 
-- there are 41571 patients suffered from cough symptoms out of which only 6584 people have corona positive, this is not a common symptom

 select Corona,count(Fever) as cases from corona_sql_data
 where Fever='TRUE' group by Corona order by cases desc 
 
 -- there are total 21,375 people suffered from Fever out of which only 5559 have corona positive, this is not a common symptom 


 select Corona,count(Sore_throat) as cases from corona_sql_data
 where Sore_throat='TRUE' group by Corona order by cases desc
 
 -- there are total 1,891 people suffered from Sore_throat out of which 1,526 people have corona positive , this is a common symptom to pridict the corona.
 
 
 select Corona,count(shortness_of_breath) as cases from corona_sql_data
 where shortness_of_breath='TRUE' group by Corona order by cases desc
 
-- there are total 1,548 people suffered from shortness_of_breath out of which 1,164 people have corona positive , this is a common symptom to pridict the corona.


 select Corona,count(headache) as cases from corona_sql_data
 where headache='TRUE' group by Corona order by cases desc
 
-- there are total 2,382 people suffered from headache out of which 2,235 people have corona positive , this is a common symptom to pridict the corona.

-- ans) from the above results we can say that the most common symptoms for corona positive patients are Sore_throat, shortness_of_breath, headache.

-- ------------------------------------------------------------------------------------------------------

-- 7) Which symptom was less common among COVID negative people?

-- ans) from the above results it is clear that Cough and Fever are the symotoms that was less common among COVID negative people

-- ------------------------------------------------------------------------------------------------------

-- 8) What are the most common symptoms among COVID positive males?

 select Corona,count(headache) as cases from corona_sql_data
 where headache='TRUE' and sex='male' group by Corona order by cases desc
 
 -- therea are total 1,073 male patients are suffered from headache out of which 1027 males are affected to corona postive.
 
 select Corona,count(shortness_of_breath) as cases from corona_sql_data
 where shortness_of_breath='TRUE' and sex='male' group by Corona order by cases desc
 
 -- therea are total 574 male patients are suffered from shortness_of_breath out of which 1027 males are affected to corona postive.
 
 select Corona,count(Sore_throat) as cases from corona_sql_data
 where Sore_throat='TRUE' and sex='male' group by Corona order by cases desc
 
 -- therea are total 687 male patients are suffered from Sore_throat out of which 640 males are affected to corona postive.
 
 -- ans) from the above results we can say that the most common symptoms for corona positive male patients are Sore_throat, shortness_of_breath, headache.
 