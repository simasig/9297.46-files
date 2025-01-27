---Simple CTE
/*
WITH cte_name (column1, column2, …)
AS
(
   cte_query_definition 
  
)
-- Statement using the CTE
SELECT *
FROM   cte_name

*/

---COMPLEX CTE
/*
WITH cte_name1 (column1, column2, …)
AS
(
   cte1_query_definition 
  
),
cte_name2 (column1, column2, …)
AS
(
   cte2_query_definition 
  
)
-- Statement using the CTE
SELECT *
FROM   cte_name1 JOIN cte_name2
UNION 
SELECT *
FROM   cte_name2

*/




------Recursive CTE ---------------
-----------------------------------



/*
WITH cte_name (column1, column2, …)
AS
(
   cte_query_definition -- Anchor member
   UNION ALL
   cte_query_definition -- Recursive member; references cte_name.
)
-- Statement using the CTE
SELECT *
FROM   cte_name

*/

WITH Numbers (id) 
AS (  
	SELECT 1
	)
SELECT * FROM NUMBERS;



WITH Numbers (id) 
AS (  
	SELECT 1  -- Anchor 
	UNION ALL   
	SELECT id + 1 
	FROM Numbers  -- Anchor = Anchor + Value 
	WHERE id < 10)  
SELECT *   
FROM Numbers;

GO

WITH Numbers (id) 
AS (  
	SELECT 1  -- Anchor 
	UNION ALL   
	SELECT id + 1 
	FROM Numbers  -- Anchor = Anchor + Value 
	WHERE id < 101)  
SELECT *   
FROM Numbers;



SELECT 1 ID
UNION ALL
SELECT 1+1
UNION ALL
SELECT 2+1
GO


WITH NUMS (ID)
AS
(SELECT 1
 UNION ALL
 SELECT ID+1
 FROM NUMS
 WHERE ID<=LEN('Data Analyst')
 )
 SELECT *
 FROM NUMS;

 SELECT REPLICATE('*',1)
 UNION
 SELECT REPLICATE('*',2)
 UNION
 SELECT REPLICATE('*',3)
 UNION
 SELECT REPLICATE('*',4)
 UNION
 SELECT REPLICATE('*',5)
 GO
--Types don't match between the anchor and the recursive part in column "letter" of recursive query "NUMS".
 
 WITH NUMS (ID,letter)
AS
(SELECT 1,replicate('*',1) 
 UNION ALL
 SELECT ID+1,replicate('*',id+1) 
 FROM NUMS
 WHERE ID<5
 )
 SELECT *
 FROM NUMS;
 

 SELECT 1 AS ID ,replicate('*',1) AS LETTER
 INTO TEMPT


 GO

 WITH NUMS (ID,letter)
AS
(SELECT len('*'),cast(replicate('*',1) as varchar(5))
 UNION ALL
 SELECT ID+1,cast(replicate('*',id+1) as varchar(5))
 FROM NUMS
 WHERE ID<5
 )
 SELECT *
 FROM NUMS;
 
GO

WITH  num (ID ,Letter)
AS
(SELECT LEN(REPLICATE('*',5)),CAST(REPLICATE('*',5) AS VARCHAR(5))
 UNION ALL
 SELECT ID-1,CAST(REPLICATE('*',id-1) AS VARCHAR(5))
 FROM num
 WHERE id >1
)
SELECT *
FROM num
;

  SELECT REPLICATE('*',1) COL
  INTO STAM_TBL


 

 SELECT  DATENAME(DW, getdate());
 SELECT  DATENAME(DW, 0);
 SELECT  DATENAME(DW, -1);
 SELECT  DATENAME(DW, 6);
 SELECT  DATENAME(DW, 1);

WITH cte_numbers(n, weekday) 
AS (
    SELECT -1, DATENAME(DW, -1)
    UNION ALL
    SELECT n + 1, DATENAME(DW, n + 1)
    FROM   cte_numbers
    WHERE n < 5
)
SELECT  n,weekday
FROM cte_numbers;

select 'Data Analyst' ,'d','da','dat','data'

--Types don't match between the anchor and the recursive part in column "letter" of recursive query "DA".

WITH DA (ID,letter)
AS
(SELECT 1,left('Data Analyst',1)
 UNION ALL
 SELECT ID+1,left('Data Analyst',id+1)
 FROM DA
 WHERE ID<LEN('Data Analyst')
 )
 SELECT *
 FROM DA;


 
WITH DA (ID,letter)
AS
(SELECT 1,CAST(left('Data Analyst',1) AS VARCHAR(20))
 UNION ALL
 SELECT ID+1,CAST(left('Data Analyst',id+1)AS VARCHAR(20))
 FROM DA
 WHERE ID<LEN('Data Analyst')
 )
 SELECT *
 FROM DA;


 --!= , !>
 --Nachman Meuman'
 WITH DA (ID,letter)
AS
(SELECT 1,CAST(left('Data Analyst',1) AS VARCHAR(20))
 UNION ALL
 SELECT ID+1,CAST(left('Data Analyst',id+1)AS VARCHAR(20))
 FROM DA
 WHERE ID<LEN('Data Analyst')
 )
 SELECT *
 FROM DA
 WHERE right(letter,1)<>' '


 WITH DA (ID,letter)
AS
(SELECT 1,CAST(left('Data Analyst',1) AS VARCHAR(20))
 UNION ALL
 SELECT ID+1,CAST(SUBSTRING('Data Analyst',id+1,1)AS VARCHAR(20))
 FROM DA
 WHERE ID<LEN('Data Analyst')
  )
 SELECT *
 FROM DA
 WHERE letter <>' ';

  --Nachman Meuman'

  GO

  WITH t (ID ,Letter)
  AS
  (SELECT 1,CAST(LEFT ('Nachman Meuman',1) AS VARCHAR(20))
   UNION ALL
   SELECT id+1,CAST(LEFT ('Nachman Meuman',id+1) AS VARCHAR(20))
   FROM t
   where id <=LEN('Nachman Meuman')
  )
  SELECT *
  FROM t
  WHERE RIGHT(letter,1) <> ' '


  go

WITH  NC (ID , letter)
AS
(SELECT 1,CAST (LEFT(N'נחמן מאומן',1) AS NVARCHAR(20))
 UNION ALL
 SELECT ID+1,CAST (LEFT(N'נחמן מאומן',ID+1) AS NVARCHAR(20))
 FROM NC
 WHERE ID <LEN ('נחמן מאומן')
 )
 SELECT *
 FROM NC
 WHERE RIGHT(LETTER,1)<>' ';


 SELECT SUBSTRING('Data Analyst',1,1)
 
 SELECT SUBSTRING('Data Analyst',2,1)

  WITH DA (ID,letter)
AS
(SELECT 1,CAST(left('Data Analyst',1) AS VARCHAR(20))
 UNION ALL
 SELECT ID+1,CAST(SUBSTRING('Data Analyst',id+1,1)  AS VARCHAR(20))
 FROM DA
 WHERE ID<LEN('Data Analyst')
  )
 SELECT *
 FROM DA
 WHERE letter <> ' '



 -- How many letters are in a word  

 WITH DA (ID,letter)
AS
(SELECT 1,CAST(left('Data Analyst',1) AS VARCHAR(20))
 UNION ALL
 SELECT ID+1,CAST(SUBSTRING('Data Analyst',id+1,1)AS VARCHAR(20))
 FROM DA
 WHERE ID<LEN('Data Analyst')
  )
 SELECT letter, count(*)
 FROM DA
 -- WHERE letter <>' '
 GROUP BY letter;
/*
'Data Analyst'
 'ata Analyst'
 'ta Analyst'
*/
 GO
   WITH DA (ID,letter)
AS
(SELECT 1,CAST('Data Analyst' AS VARCHAR(20))
 UNION ALL
 SELECT ID+1,CAST(SUBSTRING('Data Analyst',id+1,LEN('Data Analyst'))  AS VARCHAR(20))
 FROM DA
 WHERE ID<LEN('Data Analyst')
  )
 SELECT *, LEN(LETTER)
 FROM DA
 WHERE letter <> ' '
 ---Nachman Meuman
 
WITH DA (ID,letter)
AS
(SELECT 1,CAST(left('Nachman Meuman',1) AS VARCHAR(20))
 UNION ALL
 SELECT ID+1,CAST(left('Nachman Meuman',id+1)AS VARCHAR(20))
 FROM DA
 WHERE ID<LEN('Nachman Meuman')
 )
 SELECT *
 FROM DA;

 GO


---------------
USE Northwind

SELECT ReportsTo, EmployeeID, lastname
FROM Employees
WHERE ReportsTo IS NULL


SELECT ReportsTo, EmployeeID, lastname
FROM Employees
WHERE ReportsTo =2


SELECT ReportsTo, EmployeeID, lastname
FROM Employees
WHERE ReportsTo =5

GO

WITH Descendant (ReportsTo, EmployeeID, lastname)
AS (

SELECT ReportsTo, EmployeeID, lastname
FROM Employees
WHERE ReportsTo IS NULL -- Anchor

UNION ALL

SELECT C.ReportsTo, C.EmployeeID, C.lastname
FROM Employees AS C JOIN Descendant AS A
ON C.ReportsTo = A.EmployeeID
)
SELECT EmployeeId, Lastname, ReportsTo
FROM Descendant;

GO

SELECT ReportsTo, EmployeeID, lastname
INTO EMP_MNG
FROM Employees


SELECT *
FROM EMP_MNG

UPDATE EMP_MNG
SET REPORTSTO = 1
WHERE EmployeeID=9

UPDATE EMP_MNG
SET REPORTSTO = 5
WHERE EmployeeID=1


GO
WITH Descendant (ReportsTo, EmployeeID, lastname)
AS (

SELECT ReportsTo, EmployeeID, lastname
FROM EMP_MNG
WHERE ReportsTo IS NULL -- Anchor

UNION ALL

SELECT C.ReportsTo, C.EmployeeID, C.lastname
FROM EMP_MNG AS C JOIN Descendant AS A
ON C.ReportsTo = A.EmployeeID
)
SELECT EmployeeId, Lastname, ReportsTo
FROM Descendant;

GO
GO
WITH Descendant (ReportsTo, EmployeeID, lastname,Tlevel)
AS (

SELECT ReportsTo, EmployeeID, lastname,0
FROM EMP_MNG
WHERE ReportsTo IS NULL -- Anchor

UNION ALL

SELECT C.ReportsTo, C.EmployeeID, C.lastname,tlevel+1
FROM EMP_MNG AS C JOIN Descendant AS A
ON C.ReportsTo = A.EmployeeID
)
SELECT EmployeeId, Lastname, ReportsTo, tlevel
FROM Descendant;

GO

-- See graphical heirarchy:
WITH Descendant (ReportsTo, EmployeeID, lastname, TreeLevel)
AS (
SELECT ReportsTo, EmployeeID, lastname, 0
FROM Employees
WHERE EmployeeID = 2
UNION ALL
SELECT C.ReportsTo, C.EmployeeID, C.lastname, TreeLevel + 1
FROM Employees AS C
INNER JOIN Descendant AS A
ON C.ReportsTo = A.EmployeeID
)
SELECT REPLICATE (' ' , TreeLevel*3) + CAST(EmployeeID AS CHAR(2))+ ' - ' + Lastname, ReportsTo,TreeLevel
FROM Descendant;


select replicate ('#',10)


USE Northwind;
