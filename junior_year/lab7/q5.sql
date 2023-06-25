/*
Query 5: Adjustments by Part Number

Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. The results should include data for shipments (transaction type 5) in calendar years 2011 and 2012. Summarize the result by calendar year, calendar quarter, and customer name. The result should show the grouped columns and the normal set of group by results plus partial subtotals for year and quarter concatenated with customer name.  Do not use the GROUPING SETS and UNION operators. (Hint: see the partial ROLLUP example in lesson 4).
*/

SELECT dd.CalYear, dd.CalQuarter, cd.Name,
	SUM(inf.ExtCost) AS "TOTAL COST", SUM(inf.UnitCost) AS "TOTAL TRANSACTIONS"
FROM date_dim dd, inventory_fact inf, cust_vendor_dim cd
WHERE dd.DateKey = inf.DateKey
	AND inf.CustVendorKey = cd.CustVendorKey
	AND dd.CalYear BETWEEN '2011' AND '2012'
	AND inf.TransTypeKey = 5
GROUP BY ROLLUP(cd.Name, dd.CalYear, dd.CalQuarter)
ORDER BY dd.CalYear, dd.CalQuarter, cd.Name;
