![image](https://github.com/mlmabuti/sql-stash/assets/72655919/b56dcc5c-930c-449f-9152-bdc9d734aa49)

IMPORTANT NOTE:  DO NOT USE INNER JOIN, FULL JOIN, LEFT JOIN, RIGHT JOIN IN YOUR SOLUTIONS. Stick with the WHERE clause in connecting the primary and foreign keys of the tables.
Query 1: Ranking within the entire result

Use the RANK function to rank customers in descending order by the sum of extended cost for shipments (transaction type 5). You should use the entire result as a single partition. The result should include the customer name, sum of the extended cost, and rank.
Query 2: Ranking within a partition

Use the RANK function to rank customers in descending order by the sum of extended cost for shipments (transaction type 5). You should partition the rank values by customer state. The result should include the customer state, customer name, sum of the extended cost, and rank. You should order the result by customer state.

Query 3: Ranking and dense ranking within the entire result

Use both RANK and DENSE_RANK functions to rank customers in descending order by the count of inventory transactions for shipments (transaction type 5). You should use the entire result as a single partition. The result should include the customer name, count of transactions, rank, and dense rank.

Query 4: Cumulative extended costs for the entire result

Calculate the cumulative sum of extended cost ordered by customer zip code, calendar year, and calendar month for shipments (transaction type 5). The result should include the customer zip code, calendar year, calendar month, sum of the extended cost, and cumulative sum of the extended cost. Note that the cumulative extended cost is the sum of the extended cost in the current row plus the cumulative sum of extended costs in all previous rows.

Query 5: Cumulative extended costs for a partition

Calculate the cumulative sum of extended cost ordered by customer zip code, calendar year, and calendar month for shipments (transaction type 5). Restart the cumulative extended cost after each combination of zip code and calendar year. The result should include the customer zip code, calendar year, calendar month, sum of the extended cost, and cumulative sum of the extended cost. Note that the cumulative extended cost is the sum of the extended cost in the current row plus the cumulative sum of extended costs in all previous rows of the store zip code and years. The value of cumulative extended cost resets in each partition (new value for zip code and year).

Query 6: Ratio to report applied to the entire result

Calculate the ratio to report the sum of extended cost for adjustments (transaction type 1). You should sort on descending order by sum of extended cost. The result should contain the second item id, sum of extended cost, and ratio to report.

Query 7: Ratio to report applied to a partition

Calculate the ratio to report the sum of extended cost for adjustments (transaction type 1) with partitioning on the calendar year. You should sort on ascending order by calendar year and descending order by sum of extended cost. The result should contain the calendar year, second item id, sum of extended cost, and ratio to report.

Query 8: Cumulative distribution functions for carrying cost of all branch plants

Calculate the rank, percent_rank, and cume_dist functions of the carrying cost in the branch_plant_dim table. The result should contain the BPName, CompanyKey, CarryingCost, rank, percent_rank, and cume_dist.

Query 9: Determine worst performing plants

Determine the branch plants with the highest carrying costs (top 15%). The result should contain BPName, CompanyKey, CarryingCost, and cume_dist.

Query 10: Cumulative distribution of extended cost for Colorado inventory

Calculate the cumulative distribution of extended cost for Colorado inventory (condition on customer state). The result should contain the extended cost and cume_dist, ordered by extended cost. You should eliminate duplicate rows in the result.

