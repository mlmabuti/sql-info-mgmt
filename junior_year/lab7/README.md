
IMPORTANT NOTE: You need to refresh the INVENTORY DATA WAREHOUSE. Remove all the row insertions done during the data integration exercise.  Repeat the whole process of populating the inventory data warehouse.  Refer to this link.

DO NOT USE INNER JOIN, FULL JOIN, LEFT JOIN, RIGHT JOIN IN YOUR SOLUTIONS. Stick with the WHERE clause in connecting the primary and foreign keys of the tables.

The assignment provides experience writing SELECT statements using the subtotal operators (CUBE, ROLLUP, and GROUPING SETS).  Refer to the given ERD as your guide to address the requirements.  Make sure you have populated the INVENTORY_FACT data warehouse before doing the exercise.


Query 1: Sales Order Shipments by Month and Category Code1

Write an SQL statement to display the sum of the extended cost and the sum of the quantity. The results should include data for shipments (transaction type 5) in calendar year 2011. Summarize the result by calendar month and Address Category Code 1. The result should include the grouped columns and the full totals for every combination of grouped columns. Do not use the GROUPING SETS and UNION operators.

Query 2: Sales Order Shipments by Name, Zip, and Quarter

Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. The results should include data for shipments (transaction type 5) in calendar years 2011 and 2012. Summarize the result by calendar quarter, customer zip code, and customer name. The result should include the grouped columns and full set of subtotals for every combination of grouped columns. Do not use the CUBE and UNION operators.
Query 3: Transfers by Company and Branch Plant

Write an SQL statement to display the sum of the extended cost and the sum of the quantity. The results should include data for transfers (transaction type 2). Summarize the result by company name and branch plant name. The result should include the grouped columns and a partial set of subtotals in order of the grouped columns (company name and branch plant name). Transfer quantities by design should sum to zero across all companies so that the grand total should be 0 for the sum of quantity and extended cost. Do not use the GROUPING SETS and UNION operators.
Query 4: Inventory Transactions by Transaction Description, Company, and Branch Plant

Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. The results should include data for all transaction types. Summarize the result by transaction description, company name, and branch plant name. The result should include the grouped columns and partial totals in order of the grouped columns (transaction description, company name, and branch plant name). Do not use the ROLLUP and UNION operators.
Query 5: Adjustments by Part Number

Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. The results should include data for shipments (transaction type 5) in calendar years 2011 and 2012. Summarize the result by calendar year, calendar quarter, and customer name. The result should show the grouped columns and the normal set of group by results plus partial subtotals for year and quarter concatenated with customer name.  Do not use the GROUPING SETS and UNION operators. (Hint: see the partial ROLLUP example in lesson 4).
Query 6: Rewrite Query 1 without CUBE, ROLLUP, or GROUPING SETS

Rewrite query 1 without the usage of the CUBE ROLLUP, or GROUPING SETS operators. In rewriting the query, you should use NULL as the default value for each column.
Query 7: Rewrite Query 3 without CUBE, ROLLUP, or GROUPING SETS

Rewrite query 3 without the usage of the CUBE, ROLLUP, or GROUPING SETS operators. In rewriting the query, you should use NULL as the default value for each column.
Query 8: Sales Order Shipments by Name and Combination of Year and Quarter

Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. The results should include data for shipments (transaction type 5) in calendar years 2011 and 2012. Summarize the result by calendar year, calendar quarter, and customer name. The result should include the grouped columns and the full set of subtotals for customer name and the combination of year and quarter. Do not use the GROUPING SETS and UNION operators. (Hint: see the composite column example in lesson 4).
Query 9: Sales Order Shipments by Month and Category Code1 with Group Number

Write an SQL statement to display the sum of the extended cost and the sum of the quantity. The results should include data for shipments (transaction type 5) in calendar year 2011. Summarize the result by calendar month and Address Category Code 1. The result should include the grouped columns and the full set of subtotals for every combination of grouped columns along with the hierarchical group number for both grouping columns. Do not use the GROUPING SETS and UNION operators. (Hint: see the group functions slide in lesson 5).

Query 10: Sales Order Shipments with Subtotals by Name and Partial Subtotals by Year and Quarter

Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. The results should include data for shipments (transaction type 5) in calendar years 2011 and 2012. Summarize the result by calendar year, calendar quarter, and customer name. The result should include the grouped columns and subtotals for customer name along with partial subtotals for year and quarter. Do not include the normal GROUP BY totals in the result.  Do not use the UNION operator. (Hint: see the nested rollup example in lesson 4).


