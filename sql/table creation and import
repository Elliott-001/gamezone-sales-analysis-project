CREATE DATABASE gamezone;

CREATE TABLE regions (
country_code VARCHAR (20),
region VARCHAR (20)
); -- creates the regions table

LOAD DATA LOCAL INFILE 'C:/Users/Osabuohien/Documents/kaggle datasets/gamezone dataset/gamezone-regions-data.csv' into TABLE region
FIELDS TERMINATED BY ','
IGNORE 1 LINES; -- imports the data from csv into the regions table 

CREATE TABLE orders (
user_id VARCHAR (40),
order_id VARCHAR (50),
purchase_ts TEXT,
ship_ts TEXT,
product_name VARCHAR (90),
product_id VARCHAR (20),
price DECIMAL(10,2),
purchase_platform VARCHAR (40),
marketing_channel VARCHAR (40),
account_creation_method VARCHAR (40),
country_code VARCHAR (10)
); -- creates the orders table

LOAD DATA LOCAL INFILE 'C:/Users/Osabuohien/Documents/kaggle datasets/gamezone dataset/gamezone-orders-data.csv' into TABLE orders
FIELDS TERMINATED BY ','
IGNORE 1 LINES ; -- imports the data from csv into the orders table 
