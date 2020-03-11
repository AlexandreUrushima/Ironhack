--1. What are the different genres?

SELECT * FROM data;
SELECT prime_genre FROM data;
SELECT DISTINCT prime_genre FROM data;
-- 23 genres

--2. Which is the genre with the most apps rated?
SELECT * FROM data;
SELECT rating_count_tot, prime_genre FROM data ORDER BY rating_count_tot DESC;

--3. Which is the genre with most apps?
CREATE TABLE test AS
SELECT prime_genre,COUNT(*) FROM data GROUP BY prime_genre; --Conta os únicos dentro da coluna
SELECT * FROM test ORDER BY count DESC LIMIT 1;

--4. Which is the one with least?**
SELECT * FROM test ORDER BY count LIMIT 1;

--5. Find the top 10 apps most rated.**
SELECT track_name, rating_count_tot FROM data ORDER BY rating_count_tot DESC;

--6. Find the top 10 apps best rated by users.**
SELECT track_name, user_rating_ver FROM data ORDER BY user_rating_ver DESC;

--7. Take a look at the data you retrieved in question 5. Give some insights.
--The top 2 most rated apps are social network apps and the remaining are games.

--8. Take a look at the data you retrieved in question 6. Give some insights.
-- The most user's top 10 rated app are games

--9. Now compare the data from questions 5 and 6. What do you see?**
-- Total of rating counts doesn't reflect with the app is good or not.

--10. How could you take the top 3 regarding both user ratings and number of votes?
SELECT * FROM data ORDER BY(user_rating, rating_count_tot) DESC LIMIT 3;

--11. Do people care about the price of an app?** 
--Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT price as a, user_rating as b, COUNT (*) FROM data GROUP BY price, user_rating ORDER BY count DESC;
--The most downloadable apps are the free ones and also most rated (4.5)

--Bonus 1: Find the total number of games available in more than 1 language.

SELECT prime_genre,COUNT(*) FROM data GROUP BY prime_genre;
SELECT "lang.num", COUNT(*) FROM data GROUP BY "lang.num";
SELECT COUNT ("lang.num") FROM data WHERE "lang.num" > 1; --3389 apps

--Bonus 2: Find the number of free vs paid apps**
SELECT COUNT ("price") FROM data WHERE "price" = 0; -- 4056 free apps
SELECT COUNT ("price") FROM data WHERE "price" > 0; -- 3141 paid apps

--Bonus 3: Find the number of free vs paid apps for each genre**
SELECT prime_genre, COUNT (*) FROM data WHERE "price" > 0 GROUP BY prime_genre;
SELECT prime_genre, COUNT (*) FROM data WHERE "price" = 0 GROUP BY prime_genre;

