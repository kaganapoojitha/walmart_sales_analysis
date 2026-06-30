--EXPLORATORY DATA ANALYSIS

--1.Total Number of Transactions 
select count(*) as total_transactions from walmart_clean;

--2.Total Revenue
select sum(unit_price * quantity) as total_revenue from walmart_clean;

--3.Total Profit
select round(sum((unit_price*quantity)*profit_margin), 2) as total_profit from walmart_clean;

--4.Top 10 Highest Sales Transaction
select *, round((unit_price * quantity),2) as sales from walmart_clean order by sales desc limit 10;

--5.Revenue by Branch
select branch, round(sum(unit_price * quantity),2) as revenue_branch from walmart_clean
group by branch order by revenue_branch desc;

--6.Revenue by City
select city,round(sum(unit_price * quantity),2) as revenue_city from walmart_clean
group by city order by revenue_city desc;

--7.Revenue by Category
select category, round(sum(unit_price * quantity),2) as revenue_category from walmart_clean
group by category order by revenue_category desc;

--8.Average Rating by Category
select category, round(avg(rating),1) avg_rating from walmart_clean 
group by category order by avg_rating desc;

--9.Monthly Revenue
select extract(month from date) as month,
round(sum(unit_price * quantity), 2) as revenue
from walmart_clean group by month order by month;

--10.Yearly Revenue
select extract(year from date) as year,
round(sum(unit_price * quantity), 2) as revenue
from walmart_clean group by year order by year;

--11.Branch Performance
select
    branch,
    count(*) as transactions,
    round(sum(unit_price * quantity), 2) as revenue,
    round(avg(rating), 2) as avg_rating
from walmart_clean group by branch
order by revenue desc;

--12.Most Popular Category in Each Branch
select * from (
select branch, category,
sum(quantity) as total_quantity,
rank() over (partition by branch order by sum(quantity) desc) as rank
from walmart_clean group by branch, category
) t where rank = 1;

--13.Most Used Payment Method
select payment_method, count(*) as transactions
from walmart_clean
group by payment_method
order by transactions desc;

--14.Customer Purchase Distribution
select payment_method,
round(100.0 * count(*) / sum(count(*)) over (), 2) as percentage
from walmart_clean
group by payment_method
order by percentage desc;





