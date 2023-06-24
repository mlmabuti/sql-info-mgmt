/*
Query 8: Cumulative distribution functions for carrying cost of all branch plants

Calculate the rank, percent_rank, and cume_dist functions of the carrying cost in the branch_plant_dim table. The result should contain the BPName, CompanyKey, CarryingCost, rank, percent_rank, and cume_dist.
*/

SELECT BPNAME, COMPANYKEY, CARRYINGCOST,
	RANK() OVER (ORDER BY CARRYINGCOST) AS RANK,
	PERCENT_RANK() OVER (ORDER BY CARRYINGCOST) AS PERCENT_RANK,
	CUME_DIST () OVER (ORDER BY CARRYINGCOST) AS CUME_DIST
FROM BRANCH_PLANT_DIM;
