-- number of sales made via each marketing medium
select count(marketing_channel), marketing_channel
from orders
group by marketing_channel
order by 1 desc; 

-- number of sales made in each country
select count(country_code), country_code
from orders
group by country_code
order by 1 desc; 

-- total annual sales revenue each year
select purchase_year, sum(price)
from orders
group by purchase_year; 

-- total monthly sales revenue 
select month(purchase_date), year(purchase_date), sum(price)
from orders
group by month(purchase_date), year(purchase_date)
order by 2,1; 

/* ranking product revenue performance in each month of each year */
with cte as (
select product_name, month(purchase_date) as months, year(purchase_date) as years, sum(price) as total
from orders
group by product_name, months, years -- product performance each month each year
), ranking as 
(
select *, dense_rank() over(partition by months, years order by total desc) as ranking
from cte  -- adds a rank of products by monthly sales revenue, each year             
)
select * from ranking
where ranking = 1
order by 3,2; -- selecting the product with the highest sales revenue each month

/* ranking product performance by number of products sold each month each year */
with cte as (
select product_name, month(purchase_date) as months, year(purchase_date) as years, count(order_id) as total
from orders
group by  product_name, months,  years
), ranking as
(
select *, dense_rank() over(partition by months, years order by total desc) as position
from cte -- adds a rank of products by number of sales each month
)
select * from ranking
where ranking = 1
order by 3,2; -- selecting the product with the highest number of sales each month;
