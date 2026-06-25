SELECT soh.SalesOrderID, 
	  sod.SalesOrderDetailID, 
	  CONVERT(INT, CONVERT(VARCHAR, soh.OrderDate, 112)) AS OrderDateKey,
	  CONVERT(INT, CONVERT(VARCHAR, soh.DueDate, 112)) AS DueDateKey,
	  CONVERT(INT, CONVERT(VARCHAR, soh.ShipDate, 112)) AS ShipDateKey,
	  soh.OnlineOrderFlag,dbo.ufnGetSalesOrderStatusText(soh.Status) AS Status, 
	  sod.ProductID, 
	  soh.CustomerID, 
	  soh.SalesPersonID, 
	  soh.ShipMethodID, 
	  soh.TerritoryID, 
	  sod.OrderQty,
	  sod.UnitPrice,
	  sod.LineTotal,  
	  (sod.LineTotal/soh.SubTotal * soh.TaxAmt) AS TaxAmt, 
	  (sod.LineTotal/soh.SubTotal * soh.Freight) Freight,  
	  soh.SubTotal, (sod.LineTotal/soh.SubTotal * soh.TotalDue) TotalDue
FROM Sales.SalesOrderHeader AS soh
LEFT JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID;