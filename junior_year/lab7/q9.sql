/*
Query 9: Sales Order Shipments by Month and Category Code1 with Group Number

Write an SQL statement to display the sum of the extended cost and the sum of the quantity. The results should include data for shipments (transaction type 5) in calendar year 2011. Summarize the result by calendar month and Address Category Code 1. The result should include the grouped columns and the full set of subtotals for every combination of grouped columns along with the hierarchical group number for both grouping columns. Do not use the GROUPING SETS and UNION operators. (Hint: see the group functions slide in lesson 5).
*/

SELECT CalMonth, AddrCatCode1, SUM(inf.ExtCost) AS "TOTAL COST",
	SUM(inf.quantity) AS "TOTAL QUANTITY",
	GROUPING (CalMonth) AS GMONTH,
	GROUPING (AddrCatCode1) AS GADDR
FROM date_dim dd, inventory_fact inf, addr_cat_code1 ad1, cust_vendor_dim cd
WHERE dd.DateKey = inf.DateKey
	AND cd.AddrCatCode1 = ad1.AddrCatCodeKey
	AND inf.CustVendorKey = cd.CustVendorKey
	AND dd.CalYear = '2011'
	AND inf.TransTypeKey = 5
GROUP BY CUBE (CalMonth, AddrCatCode1)
ORDER BY 1, 2;
