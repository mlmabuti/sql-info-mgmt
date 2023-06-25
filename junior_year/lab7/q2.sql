/*
Query 2: Sales Order Shipments by Name, Zip, and Quarter

Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. The results should include data for shipments (transaction type 5) in calendar years 2011 and 2012. Summarize the result by calendar quarter, customer zip code, and customer name. The result should include the grouped columns and full set of subtotals for every combination of grouped columns. Do not use the CUBE and UNION operators.
*/

SELECT CalQuarter, Zip, Name, SUM (inf.ExtCost) AS "TOTAL COST",
	SUM (inf.UnitCost) AS "TOTAL TRANSACTIONS"
FROM date_dim dd, inventory_fact inf, cust_vendor_dim cd
WHERE dd.DateKey = inf.DateKey
	AND inf.CustVendorKey = cd.CustVendorKey
	AND dd.CalYear BETWEEN '2011' AND '2012'
	AND inf.TransTypeKey= 5
GROUP BY GROUPING SETS ((CalQuarter, Zip, Name), (CalQuarter, Zip), (CalQuarter, Name), (Zip, Name), CalQuarter, Zip, Name, ())
ORDER BY 1,2,3;
