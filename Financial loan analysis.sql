use [financial loan data base]
select* from [financial loan]

-- Total Loan Application
select COUNT(id)as TotalApplications from [financial loan]

--Month to Date Loan Applications
select COUNT(id)as M_T_Dloanapplications from [financial loan]
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

Previous month loan applications
select COUNT(id)as PM_T_Dloanapplications from [financial loan]
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

--Total funded amount and month to date total funded amount
select sum(loan_amount)as Totalfundedamount from [financial loan]
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

-- previous Month to date total funded amount
select sum(loan_amount)as TotalPfundedamount from [financial loan]
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

--Total amount receives
select sum(total_payment)as totalamountreceived from [financial loan]

--month to date total amount received
select sum(total_payment)as MTD_totalamountreceived from [financial loan]
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

--previous month to date total amount received
select sum(total_payment)as MTD_Ptotalamountreceived from [financial loan]
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

--total avg int rate
select round(AVG(int_rate), 2)*100 as averageintrestrate from [financial loan]

--month to date avg int rate
select round(AVG(int_rate), 4)*100 as averageintrestrate from [financial loan]
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

--previous month to date avg int rate
select round(AVG(int_rate), 4)*100 as averageintrestrate from [financial loan]
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

--Avg debt to income ratio
select round(AVG(dti) ,4)*100 as avgeagedti from [financial loan]

--month to date avg dti 
select round(AVG(dti) ,4)*100 as presentavgeagedti from [financial loan]
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

--previous month to date avg dti
select round(AVG(dti) ,4)*100 as previousavgeagedti from [financial loan]
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

 --total good loan issued
select loan_status from [financial loan]

select 
	(COUNT(case when loan_status='fully paid' or loan_status='current' then id end)*100)
	/
	COUNT(id)as good_loan_percentage
from [financial loan]

--total god loan applications
select COUNT(id) as good_loan_applications from [financial loan]
where loan_status= 'fully paid' or loan_status= 'current'

--total good loan funded amount
select sum(loan_amount) as good_loan_funded_amount from [financial loan]
where loan_status= 'fully paid' or loan_status= 'current'

--total good loan amount received
select sum(total_payment) as good_loan_amount_received from [financial loan]
where loan_status= 'fully paid' or loan_status= 'current'

--bad loan percentage
select
	(COUNT(case when loan_status='charged off' then id end)*100)
	/
	COUNT(id)as bad_loan_percentage
	from [financial loan]

	--bad loan applications
select COUNT(id)as bad_loan_applicatins from [financial loan]
where loan_status= 'charged off'

--bad loan funded amount
select sum(loan_amount)as bad_loan_funded_amount from [financial loan]
where loan_status= 'charged off'

--bad loan amount received
select sum(total_payment)as bad_loan_funded_amount_received from [financial loan]
where loan_status= 'charged off'

--Loan status
SELECT
        loan_status,
        COUNT(id) AS Loan_applicaions,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        [financial loan]
    GROUP BY
        loan_status

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM [financial loan]
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [financial loan]
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

SELECT 
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [financial loan]
GROUP BY address_state
ORDER BY COUNT(id) desc

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [financial loan]
GROUP BY term
ORDER BY term

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [financial loan]
GROUP BY emp_length
ORDER BY emp_length

SELECT 
     purpose,
    COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [financial loan]
GROUP BY purpose
ORDER BY  COUNT(id)

SELECT 
     home_ownership,
    COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [financial loan]
GROUP BY home_ownership
ORDER BY  COUNT(id)



