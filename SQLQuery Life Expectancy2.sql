create database Life_Expectancy1;
use Life_Expectancy1;

select * from [dbo].[HALElifeExpectancyAtBirth]
select * from [dbo].[HaleWHOregionLifeExpectancyAtBirth]
select * from [dbo].[lifeExpectancyAtBirth]
select * from [dbo].[ofHaleInLifeExpectancy]
select * from [dbo].[WHOregionLifeExpectancyAtBirth]

exec sp_rename 'HALElifeExpectancyAtBirth.continents','countries','column';



select distinct Period, Gender, count(*) over (partition by Gender,Period) as Gender_Count from [dbo].[HALElifeExpectancyAtBirth]
where gender in ('male','female')
order by 1;

select distinct Period, Gender, count(*) over (partition by Gender,Period) as Gender_Count from [dbo].[HaleWHOregionLifeExpectancyAtBirth]
where gender in ('male','female')
order by 1;

select distinct Period, Gender, count(*) over (partition by Gender,Period) as Gender_Count from [dbo].[lifeExpectancyAtBirth]
where gender in ('male','female')
order by 1;

select distinct Period, Gender, count(*) over (partition by Gender,Period) as Gender_Count from [dbo].[ofHaleInLifeExpectancy]
where gender in ('male','female')
order by 1;

select distinct Period, Gender, count(*) over (partition by Gender,Period) as Gender_Count from [dbo].[WHOregionLifeExpectancyAtBirth]
where gender in ('male','female')
order by 1;


select distinct countries, gender, count(*) over (partition by gender,countries) as total_gender from [dbo].[HALElifeExpectancyAtBirth]
where gender IN ('male','female')
order by 1;

select distinct countries, gender, count(*) over (partition by gender,countries) as total_gender from [dbo].[lifeExpectancyAtBirth]
where gender IN ('male','female')
order by 1;



select distinct continents, gender, count(*) over (partition by gender,continents) as total_gender from [dbo].[HaleWHOregionLifeExpectancyAtBirth]
where gender IN ('male','female')
order by 1;

select distinct continents, gender, count(*) over (partition by gender,continents) as total_gender from [dbo].[ofHaleInLifeExpectancy]
where gender IN ('male','female')
order by 1;

select distinct continents, gender, count(*) over (partition by gender,continents) as total_gender from [dbo].[WHOregionLifeExpectancyAtBirth]
where gender IN ('male','female')
order by 1;


select continents, avg(hale_expectancy) as Average_Hale_Expectancy, avg(life_expectancy) as Average_Life_Expectancy from [dbo].[HaleWHOregionLifeExpectancyAtBirth]
group by continents;

select continents, avg(hale_expectancy) as Average_Hale_Expectancy, avg(life_expectancy) as Average_Life_Expectancy from [dbo].[ofHaleInLifeExpectancy]
group by continents;



