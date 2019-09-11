SELECT TOP 100   
  c.CustomerID
, c.PersonID  
, CntOrdHdr = (SELECT COUNT(*) FROM AdventureWorks2016.Sales.SalesOrderHeader soh WHERE soh.CustomerID = c.CustomerID)
, CntOrdDet = (SELECT COUNT(*) FROM AdventureWorks2016.Sales.SalesOrderDetail sod WHERE sod.SalesOrderID IN (SELECT soh.SalesOrderID FROM AdventureWorks2016.Sales.SalesOrderHeader soh WHERE soh.CustomerID = c.CustomerID))
FROM AdventureWorks2016.Sales.Customer c
WHERE 1 = 1 
  AND (SELECT COUNT(*) FROM AdventureWorks2016.Sales.SalesOrderHeader soh WHERE soh.CustomerID = c.CustomerID) BETWEEN 2 AND 3
  --AND c.PersonID IS NOT NULL
;