use PizzaSales

select *
from pizza_sales

select distinct(quantity)
from pizza_sales

select cast(sum(total_price) as int) as total_sales
from pizza_sales

select order_id, sum(total_price) as order_price
from pizza_sales
group by order_id
order by order_id

select count(distinct(order_id)) as order_num
from pizza_sales

select sum(total_price) / count(distinct order_id) as avg_order_price
from pizza_sales

select convert(decimal(5,3), convert(decimal, sum(quantity)) / convert(decimal, count(distinct order_id))) as avg_pizza_per_order
from pizza_sales

select sum(quantity) as total_pizza_sold
from pizza_sales

select distinct(pizza_name_id), pizza_category, sum(quantity) as pizzas_sold
from pizza_sales
group by pizza_name_id, pizza_category
order by pizzas_sold desc

select pizza_size, sum(quantity) as pizzas_sold
from pizza_sales
group by pizza_size

select	distinct pizza_category,	
		sum(quantity) as pizzas_sold, 
		convert(int, sum(total_price)) as total_sales,
		convert(numeric(5,2), sum(total_price)*100 / (select sum(total_price) from pizza_sales)) as PCT
from pizza_sales
group by pizza_category
order by PCT desc

select	distinct pizza_size,	
		sum(quantity) as pizzas_sold, 
		convert(int, sum(total_price)) as total_sales,
		convert(numeric(5,2), sum(total_price)*100 / (select sum(total_price) from pizza_sales)) as PCT
from pizza_sales
group by pizza_size
order by PCT desc

select DATEPART(HOUR, order_time) as order_hour, sum(quantity) as pizzas_sold
from pizza_sales
group by DATEPART(HOUR, order_time)
order by order_hour

select top 5 pizza_name, sum(total_price) as total_sales
from pizza_sales
group by pizza_name
order by total_sales desc

select top 5 pizza_name, sum(total_price) as total_sales
from pizza_sales
group by pizza_name
order by total_sales asc

select top 5 pizza_name, SUM(quantity) as total_pizzas
from pizza_sales
group by pizza_name
order by total_pizzas desc

select top 5 pizza_name, SUM(quantity) as total_pizzas
from pizza_sales
group by pizza_name
order by total_pizzas asc

select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc

select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders asc

