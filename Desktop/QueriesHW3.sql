--1. Get the cities of agents booking an order for customer c002. Use a subquery. (Yes, this is the same question as on homework #2).

select city 
from agents
where aid in
	(select aid
	from orders
	where cid = 'c002');

--2. Get the cities of agents booking an order for customer c002. This time use joins; no subqueries.

select a.city
from agents a, orders o, customers c
where a.aid = o.aid
  and o.cid = c.cid
  and c.cid = 'c002';

--3. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use subqueries. (Yes, this is also the same question as on homework #2.)

select pid
from orders
where aid in
	(select aid
	from orders
	where cid =
		(select cid
		from customers
		where city = 'Kyoto'));

--4. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use joins thus time; no subqueries.

select distinct o.pid
from orders o, orders o2, customers c
where o.aid = o2.aid
  and o2.cid = c.cid
  and c.city = 'Kyoto'
order by o.pid;

--5. Get the names of customers who have never placed an order. Use a subquery.

select name
from customers
where cid not in
	(select cid
	from orders);

--6. Get the names of customers who have never placed an order. Use an outer join.

select c.name
from customers c full outer join orders o
on c.cid = o.cid
where o.cid is null;

--7. Get the names of customers who placed at least one order through an agent in their city, along with those agent(s) names.

select c.name, a.name
from customers c, orders o, agents a
where c.cid = o.cid
  and o.aid = a.aid
  and c.city = a.city;

--8. Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not the customer has ever placed an order with that agent.

select c.name, a.name, a.city
from customers c, agents a
where a.city = c.city;

--9. Get the name and city of customers who live in the city where the least number of products are made.
--
select c.name, c.city
from customers c, products p, orders o
where c.cid = o.cid
  and o.pid = p.pid
  and 

--10. Get the name and city of customers who live in a city where the most number of products are made.
--
select c.name, c.city
from customers c, products p, orders o
where c.cid = o.cid
  and o.pid = p.pid
  and 

--11. Get the name and city of customers who live in any city where the most number of products are made.
--
select c.name, c.city
from customers c, products p, orders o
where c.cid = o.cid
  and o.pid = p.pid
  and 

--12. List the products whose priceUSD is above the average priceUSD.

select p.name
from products p
where p.priceusd > 
	(select AVG(p.priceusd)
	from products p);

--13. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low.

select c.name, o.pid, o.dollars
from customers c, orders o, products p
where c.cid = o.cid
  and o.pid = p.pid
order by dollars DESC;

--14. Show all customer names (in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.

select c.name, COUNT(name)
from customers c, orders o
where c.cid = o.cid
group by name;

--15. Show the names of all customers who bought products from agents based in New York along with the names of the products they ordered, and the names of the agents who sold it to them.

select c.name, p.name, a.name
from customers c, products p, agents a, orders o
where c.cid = o.cid
  and o.aid = a.aid
  and o.pid = p.pid
  and a.city = 'New York';

--16. Write a query to check the accuracy of the dollars column in the Orders table. 
--	This means calculating Orders.dollars from other data in other tables and then comparing those values to the values in Orders.dollars.

select o.qty * p.priceUSD * (1 - c.discount/100), o.dollars
from orders o, products p, customers c
where o.pid = p.pid
  and c.cid = o.cid;

--17. Create an error in the dollars column of the Orders table so that you can verify your accuracy checking query.

select o.qty * p.priceUSD * (c.discount/100), o.dollars
from orders o, products p, customers c
where o.pid = p.pid
  and c.cid = o.cid;