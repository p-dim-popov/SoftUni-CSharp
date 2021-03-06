/* Part I - Queries for SoftUni Database */
use [SoftUni]
go

-- 2. Find All Information About Departments
select * from [Departments]

-- 3. Find All Department Names
select [Name] from [Departments]

-- 4. Find Salary of Each Employee
select [FirstName], [LastName], [Salary] from [Employees]

-- 5. Find Full Name of Each Employee 
select [FirstName], [MiddleName], [LastName] from [Employees]

-- 6. Find Email Address of Each Employee
select [FirstName] + '.' + [LastName] + '@softuni.bg' as [Full Email Address] from [Employees]

-- 7. Find All Different Employee's Salaries
select distinct [Salary] from [Employees]
order by [Salary] asc

-- 8. Find all Information About Employees
select * from [Employees] where [JobTitle] = 'Sales Representative'

-- 9. Find Names of All Employees by Salary in Range
select [FirstName], [LastName] , [JobTitle]
from [Employees] 
where [Salary] /*is*/ between 20000 and 30000

-- 10. Find Names of All Employees
select 
	formatmessage('%s %s %s', [FirstName], [MiddleName], [LastName]) as [Full Name]
from [Employees] 
where 
	[Salary] = 25000 or 
	[Salary] = 14000 or 
	[Salary] = 12500 or
	[Salary] = 23600

-- 11. Find All Employees Without Manager
select [FirstName], [LastName] from [Employees] where [ManagerID] is null

-- 12. Find All Employees with Salary More Than 50000
select 
	[FirstName], 
	[LastName], 
	[Salary] 
from [Employees] 
where [Salary] > 50000 
order by [Salary] desc

-- 13. Find 5 Best Paid Employees.
select top 5 [FirstName], [LastName] from [Employees] order by [Salary] desc

-- 14. Find All Employees Except Marketing
select 
	[FirstName], 
	[LastName] 
from [Employees] 
where [DepartmentID] <> 4

-- 15. Sort Employees Table
select * from [Employees]
order by 
	[Employees].[Salary] desc,
	[Employees].[FirstName] asc,
	[Employees].[LastName] desc,
	[Employees].[MiddleName] asc

-- 16. Create View Employees with Salaries
go

create /*or alter*/ view V_EmployeesSalaries 
as
select 
	[Employees].[FirstName],
	[Employees].[LastName],
	[Employees].[Salary]
from [Employees]

go

-- 17. Create View Employees with Job Titles
go

create /*or alter*/ view V_EmployeeNameJobTitle as
select 
	FORMATMESSAGE(
		'%s %s %s',	
		[Employees].[FirstName], 
		case when [Employees].[MiddleName] is null 
			then '' 
			else [Employees].[MiddleName]
		end, 
		[Employees].[LastName])
	as [Full Name],
	[Employees].[JobTitle] as [Job Title]
from [Employees]

go

-- 18. Distinct Job Titles
select distinct [Employees].[JobTitle] from [Employees]

-- 19. Find First 10 Started Projects
select top 10 * from [Projects] order by [Projects].[StartDate], [Projects].[Name]

-- 20. Last 7 Hired Employees
select top 7
	[Employees].[FirstName], 
	[Employees].[LastName], 
	[Employees].[HireDate] 
from [Employees]
order by [Employees].[HireDate] desc

-- 21. Increase Salaries
update [Employees]
set [Salary] = [Salary] * 1.12
from [Employees]
inner join [Departments]
	on [Employees].[DepartmentID] = [Departments].[DepartmentID]
where 
	[Departments].[Name] = 'Engineering' or
	[Departments].[Name] = 'Tool Design' or
	[Departments].[Name] = 'Marketing' or
	[Departments].[Name] = 'Information Services'

select [Employees].[Salary]
from [Employees]

/* Part II – Queries for Geography Database */
use [Geography]
go

-- 22. All Mountain Peaks
select [Peaks].[PeakName] from [Peaks] order by [PeakName] asc

-- 23. Biggest Countries by Population
select top 30 
	[Countries].[CountryName], 
	[Countries].[Population] 
from [Countries]
inner join [Continents]
	on [Countries].[ContinentCode] = [Continents].[ContinentCode]
where [ContinentName] = 'Europe'
order by 
	[Population] desc,
	[CountryName] asc

-- 24. *Countries and Currency (Euro / Not Euro)
select 
	[Countries].[CountryName], 
	[Countries].[CountryCode],
	case when [Countries].[CurrencyCode] = 'EUR'
		then 'Euro'
		else 'Not Euro'
	end as [Currency]
from [Countries]
order by [Countries].[CountryName] asc

/* Part III – Queries for Diablo Database */
use [Diablo]
go

-- 25. All Diablo Characters
select [Characters].[Name] from [Characters] order by [Name] asc