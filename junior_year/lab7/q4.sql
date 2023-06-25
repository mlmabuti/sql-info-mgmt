/*
Query 4: Inventory Transactions by Transaction Description, Company, and Branch Plant

Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. The results should include data for all transaction types. Summarize the result by transaction description, company name, and branch plant name. The result should include the grouped columns and partial totals in order of the grouped columns (transaction description, company name, and branch plant name). Do not use the ROLLUP and UNION operators.
*/

SELECT TransDescription, CompanyName, BPName, SUM(inf.ExtCost) AS "TOTAL COST",
	SUM(inf.UnitCost) AS "TOTAL TRANSACTIONS"
FROM company_dim cd, branch_plant_dim bp, inventory_fact inf, trans_type_dim td
WHERE inf.BranchPlantKey = bp.BranchPlantKey
	AND bp.CompanyKey = cd.CompanyKey
	AND inf.TransTypeKey = td.TransTypeKey
GROUP BY GROUPING SETS ((TransDescription, CompanyName, BPName),
TransDescription, CompanyName, BPName, ())
ORDER BY 1, 2, 3;
