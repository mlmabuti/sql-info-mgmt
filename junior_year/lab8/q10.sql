/*
Query 10: Cumulative distribution of extended cost for Colorado inventory

Calculate the cumulative distribution of extended cost for Colorado inventory (condition on customer state). The result should contain the extended cost and cume_dist, ordered by extended cost. You should eliminate duplicate rows in the result.
*/

SELECT DISTINCT EXTCOST, CUME_DIST() OVER (ORDER BY EXTCOST) AS CUME_DIST
FROM INVENTORY_FACT F, CUST_VENDOR_DIM C
WHERE STATE = 'CO'
	AND C.CUSTVENDORKEY = F.CUSTVENDORKEY
ORDER BY 1;
