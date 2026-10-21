create database employeedept;
use employeedept;
select * from department;
select * from employee;


         -- EMPLOYEE DEMOGRAPHICS
         
-- Total Employees
select count(*) as Total_Employees from employee;

-- Gender Distribution
select Gender,count(*)as Gender_count from employee group by Gender;

-- Gender wise Average Age
select Gender,ROUND(avg(Age), 2) as Average_Count from employee group by Gender;

-- Age Range
SELECT MIN(Age) AS Youngest_Employee, MAX(Age) AS Oldest_Employee FROM Employee;


             -- SALARY ANALYSIS
             
-- Average Salary of Employees
select ROUND(avg(Salary), 2) as Average_salary from employee;

-- Average salary by Gender
select Gender,ROUND(Avg(salary), 2) as Average_Salary from employee group by Gender;

-- Top 5 highest paid
select ID,Age,Gender,Salary from employee order by Salary desc limit 5; 



                  -- EXPERIENCE ANALYSIS
                  
-- Gender wise Salary
select Gender,Avg(Salary)as Average_salary from employee group by Gender;
                  
-- Experience vs Salary
select Experience_Years,ROUND(avg(salary), 1) as Avg_salary ,sum(Experience_Years) as Total
 from employee group by Experience_Years order by Experience_Years;
 
 

                  -- DEPARTMENT ANALYSIS
                  
-- Employees per Deprtment
select d.Dept_name,count(e.ID) as Employee_count from employee e join department d on d.ID=e.ID group by Dept_name;

 -- Average Salary of Department
 select d.Dept_name,ROUND(avg(e.Salary)) as Average_Salary from employee e join department d on d.ID= e.ID group by Dept_name;
 
 -- Depatment locations
 SELECT Dept_name, location, travel_required FROM department;
 
 
                         

 -- Experience wise salary
select ID,Experience_Years ,Age,Salary from employee 
where salary > (select avg(Salary) from employee) order by Salary desc;   


 -- Age group Salary Analysis
 Select CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Over 50'
    END AS Age_Group, ROUND(AVG(Salary), 2) AS Avg_Salary,
    COUNT(*) AS Total FROM employee GROUP BY Age_Group;



