Create database Bank_Database;

use Bank_Database;

show databases;

-- Create Customer table with consistent data types and lengths
Create Table Customer (Cust_ID int Primary Key, Cust_Name Varchar(50), DOB date, Address Varchar (50), 
Contact_Num Int, Email Varchar(50), Gender varchar(10), marital_status varchar(20), identification_doc varchar(30),
 indetification_num varchar(30), citizenship varchar(20));
 
 -- Create Bank_Info table with consistent data types and lengths
Create Table Bank_Info (IFSC_Code Varchar(35) Primary key, BName Varchar(50), Branch_Name Varchar (50));
 
 -- Create Account_Info table with consistent data types and foreign key constraints
Create Table Account_Info (Acc_Num Int Primary Key, Cust_ID Int, Acc_Type Varchar (30), IFSC_Code Varchar (35), 
Foreign key (Cust_ID) References Customer (Cust_ID), Foreign Key (IFSC_Code) references Bank_Info (IFSC_Code) );
 
 -- Create Transactions table with consistent data types and foreign key constraint
Create Table Transactions ( Transaction_Id Int Primary key, Acc_Num INT, Transaction_type Varchar( 20), Amount Decimal (10, 2), 
Transaction_Date Date, Foreign Key (Acc_Num) References Account_Info (Acc_Num) );
 
 -- Create Loan table with consistent data types and foreign key constraints
Create Table Loan ( Loan_ID INT Primary Key, Cust_ID INT, Acc_Num INT, Loan_Type Varchar(20), Loan_Amount DECIMAL (10, 2),Interest_rate DECIMAL (5,2),
Loan_Term Varchar(20), Foreign Key (Cust_ID) References Customer (Cust_ID), Foreign Key (Acc_Num) References Account_Info (Acc_Num) );

show tables;

-- Input data into Customer table

INSERT INTO Customer (Cust_ID, Cust_Name, DOB, Address, Contact_Num, Email, Gender, marital_status,
 identification_doc, indetification_num, citizenship) Values (1, 'John Doe', '1980-05-15', '123 Main St, Cityville', 
 1234567890, 'john.doe@email.com', 'Male', 'Married', 'Passport', 'AB123456789', 'USA' );
INSERT INTO Customer (Cust_ID, Cust_Name, DOB, Address, Contact_Num, Email, Gender, marital_status,
 identification_doc, indetification_num, citizenship) Values (2, 'Jane Smith', '1985-08-25', '456 Oak St, Townburg', 
 1987654321, 'jane.smith@email.com', 'Female', 'Single', 'Drivers License', 'CD987654321', 'CANADA' );
 INSERT INTO Customer (Cust_ID, Cust_Name, DOB, Address, Contact_Num, Email, Gender, marital_status,
 identification_doc, indetification_num, citizenship) Values (3, 'Robert Johnson', '1972-12-10', '789 Pine St, Villagetown', 
 1122334455, 'robert.johnson@email.com', 'Male', 'Divorced', 'Aadhar Card', 'EF112233445', 'INDIA' );
 INSERT INTO Customer (Cust_ID, Cust_Name, DOB, Address, Contact_Num, Email, Gender, marital_status,
 identification_doc, indetification_num, citizenship) Values (4, 'Sarah Patel', '1982-09-30', '231 Cedar St, Hilltop', 
 99887655, 'sarah.patel@email.com', 'Female', 'Widowed', 'Passport', 'KL112233445', 'INDIA' );
 INSERT INTO Customer (Cust_ID, Cust_Name, DOB, Address, Contact_Num, Email, Gender, marital_status,
 identification_doc, indetification_num, citizenship) Values (5, 'Emily White', '1990-03-18', '987 Elm St, Hamletville',
 445667788, 'emily.white@email.com', 'Female', 'Married', 'Social Security', 'GH445566778', 'USA' );
 INSERT INTO Customer (Cust_ID, Cust_Name, DOB, Address, Contact_Num, Email, Gender, marital_status,
 identification_doc, indetification_num, citizenship) Values (6, 'David Rodriguez', '1988-06-22', '654 Birch St, Lakeside', 
 998877655, 'david.rodriguez@email.com', 'Male', 'Single', 'Passport', 'IJ998877665', 'Mexico' );
 
 select * from customer;
 
 -- Input data into Bank_Info table
 
 INSERT INTO Bank_Info (IFSC_Code, BName, Branch_Name) Values ('ABCD0123456', 'ABC Bank', 'Cityville Main Branch');
 INSERT INTO Bank_Info (IFSC_Code, BName, Branch_Name) Values ('EFGH9876543', 'XYZ Bank', 'Townburg Branch');
 INSERT INTO Bank_Info (IFSC_Code, BName, Branch_Name) Values ('IJKL5432109', 'Global Bank', 'Villagetown Branch');
 INSERT INTO Bank_Info (IFSC_Code, BName, Branch_Name) Values ('MNOP4567890', 'Unity Bank', 'Hilltop Branch');
 INSERT INTO Bank_Info (IFSC_Code, BName, Branch_Name) Values ('QRST1234567', 'National Bank', 'Hamletville Branch');
 INSERT INTO Bank_Info (IFSC_Code, BName, Branch_Name) Values ('UVWX8901234', 'International Bank', 'Lakeside Branch');
 
 SELECT * FROM Bank_Info;
 
 -- Input data into Account_Info table
 
INSERT INTO Account_Info (Acc_Num, Cust_ID, Acc_Type, IFSC_Code) 
VALUES (101, 1, 'Savings', 'ABCD0123456');

INSERT INTO Account_Info (Acc_Num, Cust_ID, Acc_Type, IFSC_Code) 
VALUES (102, 2, 'Checking', 'EFGH9876543');

INSERT INTO Account_Info (Acc_Num, Cust_ID, Acc_Type, IFSC_Code) 
VALUES (103, 3, 'Savings', 'IJKL5432109');

INSERT INTO Account_Info (Acc_Num, Cust_ID, Acc_Type, IFSC_Code) 
VALUES (104, 4, 'Fixed Deposit', 'MNOP4567890');

INSERT INTO Account_Info (Acc_Num, Cust_ID, Acc_Type, IFSC_Code) 
VALUES (105, 5, 'Savings', 'QRST1234567');

INSERT INTO Account_Info (Acc_Num, Cust_ID, Acc_Type, IFSC_Code) 
VALUES (106, 6, 'Checking', 'UVWX8901234'); 

SELECT * FROM Account_Info;

 -- Input data into Transactions table
 
INSERT INTO Transactions (Transaction_Id, Acc_Num, Transaction_type, Amount, Transaction_Date) 
VALUES (1, 101, 'Deposit', 1000.00, '2023-01-01');

INSERT INTO Transactions (Transaction_Id, Acc_Num, Transaction_type, Amount, Transaction_Date) 
VALUES (2, 102, 'Withdrawal', 500.00, '2023-01-02');

INSERT INTO Transactions (Transaction_Id, Acc_Num, Transaction_type, Amount, Transaction_Date) 
VALUES (3, 103, 'Deposit', 1500.00, '2023-01-03');

INSERT INTO Transactions (Transaction_Id, Acc_Num, Transaction_type, Amount, Transaction_Date) 
VALUES (4, 104, 'Withdrawal', 2000.00, '2023-01-04');

INSERT INTO Transactions (Transaction_Id, Acc_Num, Transaction_type, Amount, Transaction_Date) 
VALUES (5, 105, 'Deposit', 800.00, '2023-01-05');

INSERT INTO Transactions (Transaction_Id, Acc_Num, Transaction_type, Amount, Transaction_Date) 
VALUES (6, 106, 'Withdrawal', 1200.00, '2023-01-06');

SELECT * FROM Transactions;

-- Input data into Loan table

INSERT INTO Loan (Loan_ID, Cust_ID, Acc_Num, Loan_Type, Loan_Amount, Interest_rate, Loan_Term) 
VALUES (1, 1, 101, 'Home Loan', 50000.00, 5.5, '15 years');

INSERT INTO Loan (Loan_ID, Cust_ID, Acc_Num, Loan_Type, Loan_Amount, Interest_rate, Loan_Term) 
VALUES (2, 2, 102, 'Car Loan', 25000.00, 4.2, '10 years');

INSERT INTO Loan (Loan_ID, Cust_ID, Acc_Num, Loan_Type, Loan_Amount, Interest_rate, Loan_Term) 
VALUES (3, 3, 103, 'Education Loan', 30000.00, 3.8, '8 years');

INSERT INTO Loan (Loan_ID, Cust_ID, Acc_Num, Loan_Type, Loan_Amount, Interest_rate, Loan_Term) 
VALUES (4, 4, 104, 'Personal Loan', 20000.00, 6.0, '5 years');

INSERT INTO Loan (Loan_ID, Cust_ID, Acc_Num, Loan_Type, Loan_Amount, Interest_rate, Loan_Term) 
VALUES (5, 5, 105, 'Business Loan', 70000.00, 5.0, '12 years');

INSERT INTO Loan (Loan_ID, Cust_ID, Acc_Num, Loan_Type, Loan_Amount, Interest_rate, Loan_Term) 
VALUES (6, 6, 106, 'Home Renovation Loan', 40000.00, 4.5, '10 years');

SELECT * FROM Loan;

-- fetch account statement for a particular Acc_Num

SELECT * From Transactions WHERE Acc_Num= 105; 

-- fetch acccount statement for all the account numbers

Select * from Transactions JOIN Account_Info ON Transactions.Acc_Num= Account_Info.Acc_Num;

Select COUNT(*) from Transactions JOIN Account_Info ON Transactions.Acc_Num= Account_Info.Acc_Num;

-- fetch loan details for a particulaer Acc_Num

SELECT Loan_ID, Loan_amount, Cust_ID,Loan_Type, Loan_Term, Interest_rate, Loan_amount + (Loan_amount * (Interest_rate / 100)) AS Total_Repayment,Loan_Amount / Loan_Term AS Monthly_Repayment FROM Loan WHERE Acc_Num= 103;

-- fetch loan details for all the Loan_Ids

SELECT Loan_ID, Loan_amount,Loan_Type, Loan_Term, Interest_rate, Loan_amount + (Loan_amount * (Interest_rate / 100)) AS Total_Repayment,Loan_Amount / Loan_Term AS Monthly_Repayment FROM Loan Join Account_Info ON Loan.Cust_ID= Account_Info.Cust_ID;

-- fetch transaction details with amounts comparing to the deposit amounts

Select * from Transactions WHERE Amount > ALL( Select Amount from Transactions Where Transaction_type = 'Deposit'); 

Select * from Transactions WHERE Amount >= ALL( Select Amount from Transactions Where Transaction_type = 'Deposit'); 

Select * from Transactions WHERE Amount < ALL( Select Amount from Transactions Where Transaction_type = 'Deposit'); 
  
Select * from Transactions WHERE Amount <= ALL( Select Amount from Transactions Where Transaction_type = 'Deposit'); 

-- fetch Transaction summary  

Select * from Transactions Where Transaction_Date between '2023-01-01' AND '2023-01-04';

-- fetch the count of rows in transaction summary report

Select count(*) from Transactions Where Transaction_Date between '2023-01-01' AND '2023-01-04';
 
-- compare loan amount if less than, greater than or equal to 25000

SELECT Loan_ID, Loan_Term, Loan_amount,
CASE
WHEN Loan_amount> 25000 THEN 'greater than 25000'
WHEN Loan_amount< 25000 THEN 'less than 25000'
ELSE 'equal to 25000'
End AS Comparison_amount
from Loan;   

Select * from customer Where Email Like ('%d%');

-- Create a view for account statements
CREATE VIEW Account_Statement_View AS
SELECT
    T.Transaction_Id,
    T.Acc_Num,
    T.Transaction_type,
    T.Amount,
    T.Transaction_Date,
    A.Acc_Type,
    C.Cust_Name
FROM
    Transactions T
    JOIN Account_Info A ON T.Acc_Num = A.Acc_Num
    JOIN Customer C ON A.Cust_ID = C.Cust_ID;
    
    Select * from Account_Statement_View;
    

-- Fetch account statement for a particular Acc_Num
SELECT * FROM Account_Statement_View WHERE Acc_Num = 105;

-- Fetch account statement for all account numbers
SELECT * FROM Account_Statement_View;

-- fetch total loan amount 
SELECT sum(loan_amount) AS total_amount from Loan; 

-- grouping by Loan_term
Select loan_term, count(loan_amount) AS loan_count from Loan group by Loan_term; 

-- grouping by Loan_term with Having clause 
Select loan_term, count(loan_amount) AS loan_count from Loan group by Loan_term HAVING count(Loan_amount)=2;

-- grouping by transaction type
SELECT count(*), transaction_type from Transactions group by Transaction_type having count(amount)>2;

Select * from Customer Order By Cust_Name DESC;