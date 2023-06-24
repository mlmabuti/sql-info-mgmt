/*
Query 6: Ratio to report applied to the entire result

Calculate the ratio to report the sum of extended cost for adjustments (transaction type 1). You should sort on descending order by sum of extended cost. The result should contain the second item id, sum of extended cost, and ratio to report.
*/

SELECT SECONDITEMID, SUM(EXTCOST) AS TOTAL_COST,
	RATIO_TO_REPORT(SUM(EXTCOST)) OVER () AS RATIO_TO_REPORT
FROM INVENTORY_FACT F, ITEM_MASTER_DIM I
WHERE F.TRANSTYPEKEY = 1 AND I.ITEMMASTERKEY = F.ITEMMASTERKEY
GROUP BY I.SECONDITEMID
ORDER BY TOTAL_COST DESC;
