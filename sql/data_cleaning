/* REMOVING DUPLICATES.
1) create a duplicate table
2) add a row number column to indicate distinct rows.
3) populate the duplicate table
4) remove rows with duplicates */ 

CREATE TABLE orders
LIKE orders_original; /* 1 (NOTE: original orders table was renamed to orders_original) */

ALTER TABLE orders
ADD COLUMN rn INT; /* 2 */

INSERT INTO orders
SELECT *, ROW_NUMBER() OVER(PARTITION BY user_id, order_id, purchase_ts, ship_ts, product_name, product_id, price, purchase_platform, 
				marketing_channel, account_creation_method, country_code) as rn
FROM orders_original; /* 3 */

DELETE FROM orders
WHERE rn > 1; /* 4 (35 rows deleted) */

/* standardising and updating date records */
UPDATE orders
SET ship_ts = str_to_date(ship_ts, '%d-%m-%y');

ALTER TABLE orders
ADD COLUMN ship_date DATE	

UPDATE orders
SET ship_date = ship_ts;

ALTER TABLE orders
DROP COLUMN ship_ts;

ALTER TABLE orders 
ADD COLUMN purchase_date DATE;

UPDATE orders
SET purchase_date = 
CASE
	  WHEN purchase_ts LIKE '%:%' then str_to_date(substring_index(purchase_ts, ' ', 1), '%m-%d-%Y')
    ELSE str_to_date(purchase_ts, '%d-%m-%y')
END; /* some records in the purchase_ts table were improperly entered */
