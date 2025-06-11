create database store_customers;

create table  Acc_Master (
    Acc_No INT PRIMARY KEY   ---No duplicates or nulls allowed
    ,C_Name VARCHAR(100) NOT NULL  
    ,Acc_Type VARCHAR(200) NOT NULL 
	); 
	insert into Acc_Master( 
	Acc_No 
	,C_Name
	,Acc_Type)
	values
	(100, 'A', 'Premium')
	, (101, 'B','Basic')
	, (102, 'C', 'Advanced')
	, (103, 'D', 'Advanced')
	, (104, 'E', 'Premium')
	, (105, 'F', 'Advanced');
	select * from Acc_Master;

	create table Loans_Master (
    Loan_Num int Primary Key 
    ,Account_No INT NOT NULL   
    ,Loan_Amount decimal(10, 2) NOT NULL  
    ,Tenure int  NOT NULL 
    foreign key  (Account_No) references Acc_Master(Acc_No)
);
select * from Loans_Master;

Insert into Loans_Master (
Loan_Num
,Account_No
,Loan_Amount
,Tenure)
values
    (1234, 101, 100000, 120)
	, (1235, 103, 75000, 120)
	, (1236, 104, 25000, 60
	);

Create table  LoansPayment(
    TID int primary  key 
    ,Loan_Num int  NOT NULL
    ,Amount DECIMAL(10, 2) NOT NULL 
    FOREIGN KEY (Loan_Num) REFERENCES Loans_Master(Loan_Num)  
);
insert into LoansPayment (TID, Loan_Num, Amount) 
values(100, 1234, 1083)
	, (101, 1235, 812)
	, (102, 1236, 567)
	, (106, 1234, 1083)
	, (107, 1235, 812)
	, (108, 1236, 567)
	, (112, 1234, 1083)
	, (113, 1235, 812)
	, (114, 1236, 567)
	, (118, 1234, 1083)
	, (119, 1234, 812)
	, (124, 1234, 1083
	);
	select * from LoansPayment;

SELECT Acc_No,C_Name, Acc_Type,Loan_Num, Loan_Amount
FROM Acc_Master 
JOIN
Loans_Master  ON Acc_No = Account_No;

SELECT Acc_No,C_Name, Acc_Type,Loan_Num, Loan_Amount
FROM Acc_Master
JOIN
Loans_Master ON Acc_No = Account_No;
---Print the complete data from AccMaster table, and Loan Number and total loan payment from Loans Payment tables?

select * from Acc_Master;
select Loan_Num,sum(amount) as totallonepayment
from LoansPayment
group by Loan_Num;
--10. print the customers who has taken the loans and their total repayment amount, print Loan Number, 
--and Tenure from Loans master and total loan repayment from loans repayment table?
Select  A.Loan_Num, A.Tenure
,SUM(B.Amount) AS TotalLoanRepayment
FROM Loans_Master AS A
JOIN LoansPayment AS  B  ON A.Loan_Num =B.Loan_Num
GROUP BY A.Loan_Num, A.Tenure;

Select Loans_Master . Loan_Num,Loans_Master.Tenure
,SUM(Amount) AS TotalloanRepayment
FROM Loans_Master 
inner JOIN LoansPayment  ON Loans_Master.Loan_Num = LoansPayment.Loan_Num
where Tenure >=5
GROUP BY Loans_Master.Loan_Num, Loans_Master .Tenure;


Select Loans_Master . Loan_Num,Loans_Master.Tenure
,SUM(Amount) AS TotalloanRepayment
FROM Loans_Master 
inner JOIN LoansPayment  ON Loans_Master.Loan_Num = LoansPayment.Loan_Num
group by Loans_Master.Loan_Num, Loans_Master .Tenure
having sum(amount) > 10000;

Select Loans_Master . Loan_Num,Loans_Master.Tenure
,SUM(Amount) AS TotalloanRepayment
FROM Loans_Master 
inner JOIN LoansPayment  ON Loans_Master.Loan_Num = LoansPayment.Loan_Num
Group by Loans_Master.Loan_Num, Loans_Master .Tenure
order by sum(Amount) desc;

Select Loans_Master.Loan_Num,Loans_Master. Loan_amount,Loans_Master.Tenure
,SUM(Amount) AS TotalloanRepayment
FROM Loans_Master 
inner JOIN LoansPayment  ON Loans_Master.Loan_Num = LoansPayment.Loan_Num
GROUP BY Loans_Master.Loan_Num,Loans_Master. Loan_Amount, Loans_Master .Tenure;






