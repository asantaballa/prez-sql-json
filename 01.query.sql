SELECT
  Customer.CustomerID
, Customer.PersonID  
, SalesOrderHeader.SalesOrderID
, SalesOrderHeader.OrderDate
, SalesOrderDetail.SalesOrderDetailID
, SalesOrderDetail.OrderQty
, SalesOrderDetail.LineTotal
FROM AdventureWorks2016.Sales.Customer Customer
JOIN AdventureWorks2016.Sales.SalesOrderHeader SalesOrderHeader ON SalesOrderHeader.CustomerID = Customer.CustomerID
JOIN AdventureWorks2016.Sales.SalesOrderDetail SalesOrderDetail ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
WHERE 1 = 1 
  AND Customer.CustomerID in (11000,11002,11003)
FOR JSON AUTO
--FOR JSON PATH
--FOR JSON AUTO, ROOT
--FOR JSON PATH, ROOT
--FOR JSON AUTO, ROOT('CustomerList')
--FOR JSON PATH, ROOT('CustomerList')
;