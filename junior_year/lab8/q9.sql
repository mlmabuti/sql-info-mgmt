/*
Query 9: Determine worst performing plants

Determine the branch plants with the highest carrying costs (top 15%). The result should contain BPName, CompanyKey, CarryingCost, and cume_dist.
*/

SELECT * FROM (
	SELECT BPNAME,COMPANYKEY, CARRYINGCOST,CUME_DIST () 
	OVER ( ORDER BY CARRYINGCOST) AS CUME_DIST FROM BRANCH_PLANT_DIM)
WHERE CUME_DIST >= 0.85;
