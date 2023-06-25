/*
Query 8: Sales Order Shipments by Name and Combination of Year and Quarter

Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. The results should include data for shipments (transaction type 5) in calendar years 2011 and 2012. Summarize the result by calendar year, calendar quarter, and customer name. The result should include the grouped columns and the full set of subtotals for customer name and the combination of year and quarter. Do not use the GROUPING SETS and UNION operators. (Hint: see the composite column example in lesson 4).
*/

SELECT CalYear, CalQuarter, Name, SUM(inf.ExtCost) AS "TOTAL COST",
	SUM(inf.UnitCost) AS "TOTAL QUANTITY"
FROM date_dim dd, inventory_fact inf, cust_vendor_dim cd
WHERE dd.DateKey = inf.DateKey
	AND inf.CustVendorKey = cd.CustVendorKey
	AND dd.CalYear BETWEEN '2011' AND '2012'
	AND inf.TransTypeKey = 5
GROUP BY Name, ROLLUP(CalYear,CalQuarter)
ORDER BY CalYear, CalQuarter, Name;
