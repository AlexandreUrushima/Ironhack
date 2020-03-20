--Challenge 1 - Who Have Published What At Where?

--au_id, au_lname, au_fname
SELECT * FROM authors;

--au_id, title_id / 25 rows
SELECT * FROM titleauthor;

--qty
SELECT * FROM sales;

--Select with inner join
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", c.title AS "TITLE", d.pub_name AS "PUBLISHER"
	FROM authors AS a 
	INNER JOIN 
	titleauthor AS b
	ON a.au_id = b.au_id
	INNER JOIN
	titles AS c
	ON c.title_id = b.title_id
	INNER JOIN
	publishers AS d
	ON c.pub_id = d.pub_id
	ORDER BY "AUTHOR ID";
	
--Challenge 2 - Who Have Published How Many At Where?

--au_id, au_lname, au_fname
SELECT * FROM authors;

--au_id, title_id / 25 rows
SELECT * FROM titleauthor;

--title, title_id, pub_id
SELECT * FROM titles;

--pub_name, pub_id
SELECT * FROM publishers;

--Select with inner join
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME",COUNT(c.title) AS "TITLE COUNT"
	FROM authors AS a 
	INNER JOIN 
	titleauthor AS b
	ON a.au_id = b.au_id
	INNER JOIN
	titles AS c
	ON c.title_id = b.title_id
	INNER JOIN
	publishers AS d
	ON c.pub_id = d.pub_id
	GROUP BY a.au_id, a.au_lname, a.au_fname, d.pub_name
	ORDER BY "TITLE COUNT" DESC;
	
--Challenge 3 - Best Selling Authors

--au_id, au_lname, au_fname
SELECT * FROM authors;

--au_id, title_id / 25 rows
SELECT * FROM titleauthor;

--qty
SELECT * FROM sales;

--Select with inner join
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", SUM(d.qty) AS "TOTAL"
	FROM authors AS a 
		INNER JOIN 
		titleauthor AS b
		ON a.au_id = b.au_id
		INNER JOIN
		sales AS d
		ON b.title_id = d.title_id
		GROUP BY a.au_id, a.au_lname, a.au_fname
		ORDER BY "TOTAL" DESC LIMIT 3;
		
--Challenge 4 - Best Selling Authors Ranking

--au_id, au_lname, au_fname
SELECT * FROM authors;

--au_id, title_id / 25 rows
SELECT * FROM titleauthor;

--qty
SELECT * FROM sales;

SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", COALESCE(SUM(d.qty),0) AS "TOTAL"
	FROM authors AS a 
		LEFT JOIN 
		titleauthor AS b
		ON a.au_id = b.au_id
		LEFT JOIN
		sales AS d
		ON b.title_id = d.title_id
		GROUP BY a.au_id, a.au_lname, a.au_fname
		ORDER BY "TOTAL" DESC;