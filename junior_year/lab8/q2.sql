/*
Query 2: Ranking within a partition

Use the RANK function to rank customers in descending order by the sum of extended cost for shipments (transaction type 5). You should partition the rank values by customer state. The result should include the customer state, customer name, sum of the extended cost, and rank. You should order the result by customer state.
*/

SELECT 
    NAME AS CUSTOMER_NAME,
    STATE AS CUSTOMER_STATE,
    SUM(EXTCOST) AS TOTAL_COST,
    RANK() OVER (PARTITION BY STATE ORDER BY SUM(EXTCOST) DESC) AS RANK
FROM INVENTORY_FACT F, CUST_VENDOR_DIM C
WHERE TRANSTYPEKEY = 5 AND F.CUSTVENDORKEY = C.CUSTVENDORKEY
GROUP BY STATE, NAME
ORDER BY STATE;

