-- To copy data to superstore table from CSV FILE;

COPY superstore
FROM 'E:\02-SQL\SQL_PROJECTS\SuperStore_Sales_Analysis_SQL\datasets\superstore_data.csv'
DELIMITER ','
CSV HEADER
ENCODING 'utf-8';


SELECT *
FROM superstore
LIMIt 1000;