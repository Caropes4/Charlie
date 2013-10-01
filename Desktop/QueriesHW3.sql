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



--7. Get the names of customers who placed at least one order through an agent in their city, along with those agent(s) names.



--8. Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not the customer has ever placed an order with that agent.



--9. Get the name and city of customers who live in the city where the least number of products are made.



--10. Get the name and city of customers who live in a city where the most number of products are made.



--11. Get the name and city of customers who live in any city where the most number of products are made.



--12. List the products whose priceUSD is above the average priceUSD.



--13. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low.



--14. Show all customer names (in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.



--15. Show the names of all customers who bought products from agents based in New York along with the names of the products they ordered, and the names of the agents who sold it to them.



--16. Write a query to check the accuracy of the dollars column in the Orders table. 
--	This means calculating Orders.dollars from other data in other tables and then comparing those values to the values in Orders.dollars.



--17. Create an error in the dollars column of the Orders table so that you can verify your accuracy checking query.