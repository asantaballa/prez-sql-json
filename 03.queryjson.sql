
SELECT
  j.CustomerID
, j.PersonID  
, OrderId = JSON_VALUE(j.OrderJson,'$.LastestOrder[0].SalesOrderID')
, OrderDate = JSON_VALUE(j.OrderJson,'$.LastestOrder[0].OrderDate')
, Detail1 = JSON_QUERY(j.OrderJson,'$.LastestOrder[0].SalesOrderDetail[0]')
, DetailID1 = JSON_VALUE(j.OrderJson,'$.LastestOrder[0].SalesOrderDetail[0].SalesOrderDetailID')
, LineTotal1 = JSON_VALUE(j.OrderJson,'$.LastestOrder[0].SalesOrderDetail[0].LineTotal')
, DetailID2 = JSON_VALUE(j.OrderJson,'$.LastestOrder[0].SalesOrderDetail[1].SalesOrderDetailID')
, LineTotal2 = JSON_VALUE(j.OrderJson,'$.LastestOrder[0].SalesOrderDetail[1].LineTotal')
FROM T_JsonOrders j