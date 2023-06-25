/*
Query 1: Ranking within the entire result

Use the RANK function to rank customers in descending order by the sum of extended cost for shipments (transaction type 5). You should use the entire result as a single partition. The result should include the customer name, sum of the extended cost, and rank.
*/

SELECT c.name, SUM(f.extcost) AS total_cost, RANK() OVER (ORDER BY SUM(f.extcost) DESC) AS cust_rank
FROM inventory_fact f, cust_vendor_dim c
WHERE f.transtypekey = 5 AND f.custvendorkey = c.custvendorkey
GROUP BY c.name;

