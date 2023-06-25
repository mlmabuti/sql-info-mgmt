/*
Query 7: Rewrite Query 3 without CUBE, ROLLUP, or GROUPING SETS

Rewrite query 3 without the usage of the CUBE, ROLLUP, or GROUPING SETS operators. In rewriting the query, you should use NULL as the default value for each column.
*/

SELECT CompanyName, BranchPlantID, SUM(inf.ExtCost) AS "TOTAL COST",
	SUM(inf.quantity) AS "TOTAL QUANTITY"
FROM company_dim cd, branch_plant_dim bp, inventory_fact inf
WHERE inf.BranchPlantKey = bp.BranchPlantKey
	AND bp.CompanyKey = cd.CompanyKey
	AND inf.TransTypeKey = 2
GROUP BY CompanyName, BranchPlantID

UNION

SELECT CompanyName, NULL, SUM(inf.ExtCost) AS "TOTAL COST",
	SUM(inf.quantity) AS "TOTAL QUANTITY"
FROM company_dim cd, branch_plant_dim bp, inventory_fact inf
WHERE inf.BranchPlantKey = bp.BranchPlantKey
	AND bp.CompanyKey = cd.CompanyKey
	AND inf.TransTypeKey = 2
GROUP BY CompanyName

UNION

SELECT NULL, BranchPlantID, SUM(inf.ExtCost) AS "TOTAL COST",
	SUM(inf.quantity) AS "TOTAL QUANTITY"
FROM company_dim cd, branch_plant_dim bp, inventory_fact inf
WHERE inf.BranchPlantKey = bp.BranchPlantKey
	AND bp.CompanyKey = cd.CompanyKey
	AND inf.TransTypeKey = 2
GROUP BY BranchPlantID

UNION

SELECT NULL, NULL, SUM(inf.ExtCost) AS "TOTAL COST",
	SUM(inf.quantity) AS "TOTAL QUANTITY"
FROM company_dim cd, branch_plant_dim bp, inventory_fact inf
WHERE inf.BranchPlantKey = bp.BranchPlantKey
	AND bp.CompanyKey = cd.CompanyKey
	AND inf.TransTypeKey=2
ORDER BY 1, 2;

