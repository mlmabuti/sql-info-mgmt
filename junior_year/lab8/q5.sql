/*
Query 5: Cumulative extended costs for a partition

Calculate the cumulative sum of extended cost ordered by customer zip code, calendar year, and calendar month for shipments (transaction type 5). Restart the cumulative extended cost after each combination of zip code and calendar year. The result should include the customer zip code, calendar year, calendar month, sum of the extended cost, and cumulative sum of the extended cost. Note that the cumulative extended cost is the sum of the extended cost in the current row plus the cumulative sum of extended costs in all previous rows of the store zip code and years. The value of cumulative extended cost resets in each partition (new value for zip code and year).
*/

SELECT ZIP, CALYEAR,CALMONTH, SUM(EXTCOST) AS TOTAL_COST, SUM(SUM(EXTCOST)) OVER
   (PARTITION BY ZIP, CALYEAR ORDER BY ZIP, CALYEAR, CALMONTH ROWS UNBOUNDED PRECEDING ) AS CUM_TOTAL_COST
FROM INVENTORY_FACT F, CUST_VENDOR_DIM C, DATE_DIM D
WHERE TRANSTYPEKEY = 5 AND F.CUSTVENDORKEY = C.CUSTVENDORKEY
                      AND D.DATEKEY = F.DATEKEY
GROUP BY ZIP, CALYEAR, CALMONTH
ORDER BY ZIP, CALYEAR, CALMONTH;
