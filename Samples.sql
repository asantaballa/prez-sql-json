SELECT TOP 100   
  c.CustomerID
, c.PersonID  
, soh.SalesOrderID
, soh.OrderDate
, sod.SalesOrderDetailID
, sod.OrderQty
, sod.LineTotal
FROM AdventureWorks2016.Sales.Customer c
JOIN AdventureWorks2016.Sales.SalesOrderHeader soh ON soh.CustomerID = c.CustomerID
JOIN AdventureWorks2016.Sales.SalesOrderDetail sod ON sod.SalesOrderID = soh.SalesOrderID
WHERE 1 = 1 
  AND c.CustomerID in (11000,11002,11003)
FOR JSON AUTO
--FOR JSON PATH
--FOR JSON PATH, ROOT
--FOR JSON PATH, ROOT('Customer')
;