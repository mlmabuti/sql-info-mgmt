/*
Query 3: Transfers by Company and Branch Plant

Write an SQL statement to display the sum of the extended cost and the sum of the quantity. The results should include data for transfers (transaction type 2). Summarize the result by company name and branch plant name. The result should include the grouped columns and a partial set of subtotals in order of the grouped columns (company name and branch plant name). Transfer quantities by design should sum to zero across all companies so that the grand total should be 0 for the sum of quantity and extended cost. Do not use the GROUPING SETS and UNION operators.
*/

SELECT CompanyName, BranchPlantID, SUM(inf.ExtCost) AS "TOTAL COST",
	SUM (inf.quantity) AS "TOTAL QUANTITY"
FROM company_dim cd, branch_plant_dim bp, inventory_fact inf
WHERE inf.BranchPlantKey = bp.BranchPlantKey
	AND bp.CompanyKey = cd.CompanyKey
	AND inf. TransTypeKey= 2
GROUP BY ROLLUP (CompanyName, BranchPlantID)
ORDER BY 1,2;
