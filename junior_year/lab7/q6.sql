/*
Query 6: Rewrite Query 1 without CUBE, ROLLUP, or GROUPING SETS

Rewrite query 1 without the usage of the CUBE ROLLUP, or GROUPING SETS operators. In rewriting the query, you should use NULL as the default value for each column.
*/

SELECT CalMonth, AddrCatCode1, SUM(inf.ExtCost) AS "TOTAL COST", SUM(inf.quantity) AS "TOTAL QUANTITY"
FROM date_dim dd, inventory_fact inf, addr_cat_code1 ad1, cust_vendor_dim cd
WHERE dd.DateKey = inf.DateKey
	AND cd.AddrCatCode1 = ad1.AddrCatCodeKey
	AND inf.CustVendorKey = cd.CustVendorKey
	AND dd.CalYear = '2011'
	AND inf.TransTypeKey= 5
GROUP BY CalMonth, AddrCatCode1

UNION

SELECT CalMonth, NULL, SUM(inf.ExtCost) AS "TOTAL COST", SUM(inf.quantity) AS "TOTAL QUANTITY"
FROM date_dim dd, inventory_fact inf, addr_cat_code1 ad1, cust_vendor_dim cd
WHERE dd.DateKey = inf.DateKey
	AND cd.AddrCatCode1 = ad1.AddrCatCodeKey
	AND inf.CustVendorKey = cd.CustVendorKey
	AND dd.CalYear = '2011'
	AND inf.TransTypeKey= 5
GROUP BY CalMonth

UNION 

SELECT NULL, AddrCatCode1,
SUM(inf.ExtCost) AS "TOTAL COST", SUM(inf.quantity) AS "TOTAL QUANTITY"
FROM date_dim dd, inventory_fact inf, addr_cat_code1 ad1, cust_vendor_dim cd
WHERE dd.DateKey = inf.DateKey
	AND cd.AddrCatCode1 = ad1.AddrCatCodeKey
	AND inf.CustVendorKey = cd.CustVendorKey
	AND dd.CalYear = '20111'
	AND inf.TransTypeKey= 3
GROUP BY AddrCatCode1

UNION 

SELECT NULL, NULL, SUM(inf.ExtCost) AS "TOTAL COST", SUM(inf.quantity) AS "TOTAL QUANTITY"
FROM date_dim dd, inventory_fact inf, addr_cat_code1 ad1, cust_vendor_dim cd
WHERE dd.DateKey = inf.DateKey
	AND inf.CustVendorKey = cd.CustVendorKey
	AND dd.CalYear = '2011'
	AND inf.TransTypeKey= 5
ORDER BY 1,2;
