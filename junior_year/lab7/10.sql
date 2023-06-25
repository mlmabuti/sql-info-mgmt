/*
Query 10: Sales Order Shipments with Subtotals by Name and Partial Subtotals by Year and Quarter

Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. The results should include data for shipments (transaction type 5) in calendar years 2011 and 2012. Summarize the result by calendar year, calendar quarter, and customer name. The result should include the grouped columns and subtotals for customer name along with partial subtotals for year and quarter. Do not include the normal GROUP BY totals in the result.  Do not use the UNION operator. (Hint: see the nested rollup example in lesson 4).
*/

SELECT CalYear, CalQuarter, Name, SUM(inf.ExtCost) AS "TOTAL COST",
	SUM(inf.UnitCost) AS "TOTAL TRANSACTIONS"
FROM date_dim dd, inventory_fact inf, cust_vendor_dim cd
WHERE dd.DateKey = inf.DateKey
	AND inf.CustVendorKey = cd.CustVendorKey
	AND dd.CalYear BETWEEN '2011' AND '2012'
	AND inf.TransTypeKey = 5
GROUP BY GROUPING SETS(Name, ROLLUP(CalYear, CalQuarter))
ORDER BY 1, 2,3;
