/*
Query 4: Cumulative extended costs for the entire result

Calculate the cumulative sum of extended cost ordered by customer zip code, calendar year, and calendar month for shipments (transaction type 5). The result should include the customer zip code, calendar year, calendar month, sum of the extended cost, and cumulative sum of the extended cost. Note that the cumulative extended cost is the sum of the extended cost in the current row plus the cumulative sum of extended costs in all previous rows.
*/

SELECT ZIP, CALYEAR,CALMONTH, SUM(EXTCOST) AS TOTAL_COST,
	SUM(SUM(EXTCOST)) OVER (ORDER BY ZIP, CALYEAR, CALMONTH ROWS UNBOUNDED PRECEDING ) AS CUM_TOTAL_COST
FROM INVENTORY_FACT F, CUST_VENDOR_DIM C, DATE_DIM D
WHERE F.CUSTVENDORKEY = C.CUSTVENDORKEY AND D.DATEKEY = F.DATEKEY AND TRANSTYPEKEY = 5
GROUP BY ZIP, CALYEAR, CALMONTH;
