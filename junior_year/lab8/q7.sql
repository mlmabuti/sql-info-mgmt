/*
Query 7: Ratio to report applied to a partition

Calculate the ratio to report the sum of extended cost for adjustments (transaction type 1) with partitioning on the calendar year. You should sort on ascending order by calendar year and descending order by sum of extended cost. The result should contain the calendar year, second item id, sum of extended cost, and ratio to report.
*/

SELECT CALYEAR,SECONDITEMID, SUM(EXTCOST) AS TOTAL_COST,
	RATIO_TO_REPORT (SUM(EXTCOST)) OVER (PARTITION BY CALYEAR) AS RATIO_TO_REPORT
FROM INVENTORY_FACT F, ITEM_MASTER_DIM I, DATE_DIM D
WHERE TRANSTYPEKEY = 1
	AND F.ITEMMASTERKEY = I.ITEMMASTERKEY
	AND F.DATEKEY = D.DATEKEY
GROUP BY CALYEAR, SECONDITEMID
ORDER BY 1,3 DESC;
