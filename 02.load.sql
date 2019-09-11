DROP TABLE IF EXISTS T_JsonOrders

SELECT
  Customer.CustomerID
, Customer.PersonID  
, OrderJson = 
    (
        SELECT
          SalesOrderHeader.SalesOrderID
        , SalesOrderHeader.OrderDate
        , SalesOrderDetail.SalesOrderDetailID
        , SalesOrderDetail.OrderQty
        , SalesOrderDetail.LineTotal
        FROM AdventureWorks2016.Sales.SalesOrderHeader SalesOrderHeader
        JOIN AdventureWorks2016.Sales.SalesOrderDetail SalesOrderDetail ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
        WHERE SalesOrderHeader.CustomerID = Customer.CustomerID
        ORDER BY SalesOrderHeader.OrderDate DESC
        FOR JSON AUTO, ROOT('LastestOrder')
    )
INTO T_JsonOrders
FROM AdventureWorks2016.Sales.Customer Customer
WHERE 1 = 1 
  AND Customer.CustomerID in (11000,11002,11003)

 SELECT * FROM T_JsonOrders



