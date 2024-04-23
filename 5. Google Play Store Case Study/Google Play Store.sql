create database googleplaystore;

use googleplaystore;

SELECT * FROM googleplaystore.play_store;

truncate table googleplaystore.play_store;

LOAD DATA INFILE 'D:/5. Google Play Store/play_store.csv'
INTO TABLE googleplaystore.play_store
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM googleplaystore.play_store;


-- 1.	You're working as a market analyst for a mobile app development company. Your task is to identify the 
-- most promising categories (TOP 5) for launching new free apps based on their average ratings.
select Category, round(avg(Rating),2) as Average_Rating from googleplaystore.play_store 
where Type = 'Free' 
group by Category 
order by Average_Rating desc
limit 5;



-- 2.	As a business strategist for a mobile app company, your objective is to pinpoint the three categories that generate 
-- the most revenue from paid apps. This calculation is based on the product of the app price and its number of installations.
select category, round(avg(rev),2) as revenue from
(
select *, (Installs * Price) as rev 
from googleplaystore.play_store 
where Type = 'Paid'
) t
group by Category 
order by revenue desc 
limit 3;



-- 3.	As a data analyst for a gaming company, you're tasked with calculating the percentage of games within each category. 
-- This information will help the company understand the distribution of gaming apps across different categories.
SELECT *, (cnt / (SELECT COUNT(*) FROM googleplaystore.play_store)) * 100 AS percentage FROM 
(
SELECT Category, COUNT(App) AS cnt FROM googleplaystore.play_store GROUP BY Category
) t;



-- 4.	As a data analyst at a mobile app-focused market research firm you’ll recommend whether 
-- the company should develop paid or free apps for each category based on the ratings of that category.
WITH t1 AS (
    SELECT Category, ROUND(AVG(Rating), 2) AS paid FROM googleplaystore.play_store WHERE Type = 'Paid' GROUP BY Category
),
t2 AS (
    SELECT Category, ROUND(AVG(Rating), 2) AS free FROM googleplaystore.play_store WHERE Type = 'Free' GROUP BY Category
)

SELECT t3.Category, t3.paid, t3.free,
    IF(t3.paid > t3.free, 'Develop paid apps', 'Develop unpaid apps') AS Decision
FROM (
    SELECT t1.Category, t1.paid, t2.free
    FROM t1
    INNER JOIN t2 ON t1.Category = t2.Category
) t3;



-- 5.	Suppose you're a database administrator your databases have been hacked and 
-- hackers are changing price of certain apps on the database, it is taking long for IT team to neutralize the hack, 
-- however you as a responsible manager don’t want your data to be changed, do some measure where the 
-- changes in price can be recorded as you can’t stop hackers from making changes.
-- Create the pricechangelog table
CREATE TABLE pricechangelog (
    app VARCHAR(255),
    oldprice DECIMAL(10,2),
    newprice DECIMAL(10,2),
    operation_type VARCHAR(255),
    operation_date TIMESTAMP
);

-- Create a temporary table named 'play' as a copy of 'play_store' from the 'googleplaystore' database
CREATE TABLE play AS SELECT * FROM googleplaystore.play_store;

-- Create a trigger named 'update_pricechangelog' after update on 'play'
DELIMITER //
CREATE TRIGGER update_pricechangelog
AFTER UPDATE 
ON play
FOR EACH ROW
BEGIN
    -- Insert values into the pricechangelog table when an update occurs in 'play'
    INSERT INTO pricechangelog (app, oldprice, newprice, operation_type, operation_date)
    VALUES (NEW.app, OLD.price, NEW.price, 'update', CURRENT_TIMESTAMP());
END//
DELIMITER ;

select * from play;
update play
set Price = 4
where app = 'Infinite Painter';

update play
set Price = 5
where app = 'Sketch - Draw & Paint';

select * from pricechangelog;



-- 6.	Your IT team have neutralized the threat; however, hackers have made some changes in the prices, 
-- but because of your measure you have noted the changes, now you want correct data to be inserted into the database again.
-- Use 'update + join'
drop trigger update_pricechangelog;

select * from play as a inner join pricechangelog as b on a.app = b.app;  -- step1

update play as  a
inner join pricechangelog as b on a.app = b.app
set a.price = b.oldprice;

select * from play where app = 'Infinite Painter';
select * from play where app = 'Sketch - Draw & Paint';



-- 7.	As a data person you are assigned the task of investigating the correlation between two numeric factors: 
-- app ratings and the quantity of reviews.
-- Terms needed according to the formula: sum((x-x')*(y-y')) / sqrt(sum((x-x')^2) * sum((y-y')^2))
SET @x = (SELECT ROUND(AVG(Rating), 2) FROM googleplaystore.play_store);
SET @y = (SELECT ROUND(AVG(Reviews), 2) FROM googleplaystore.play_store);

WITH t AS (
    SELECT 
        Rating, @x AS x_value, ROUND((Rating - @x), 2) AS rat, 
        Reviews, @y AS y_value, ROUND((Reviews - @y), 2) AS rev,
        POW((Rating - @x), 2) AS sqr_x, POW((Reviews - @y), 2) AS sqr_y
    FROM googleplaystore.play_store
)
SELECT 
    @numerator := SUM((rat * rev)), 
    @deno_1 := SUM(sqr_x), 
    @deno_2 := SUM(sqr_y),
    round(@numerator / SQRT(@deno_1 * @deno_2),2) AS corr_coefficients
FROM t;



-- 8.	Your boss noticed  that some rows in genres columns have multiple genres in them, which was creating issue when 
-- developing the  recommender system from the data he/she assigned you the task to clean the genres column and 
-- make two genres out of it, rows that have only one genre will have other column as blank.
DELIMITER //
CREATE FUNCTION f_name(a VARCHAR(200))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE l INT;
    DECLARE s VARCHAR(200);

    SET l = LOCATE(';', a);
    SET s = IF(l > 0, LEFT(a, l-1), a);

    RETURN s;
END;
// DELIMITER ;

DELIMITER //
CREATE FUNCTION l_name(a VARCHAR(200))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE l INT;
    DECLARE s VARCHAR(200);

    SET l = LOCATE(';', a);
    SET s = IF(l = 0, ' ', SUBSTRING(a, l+1, length(a)));

    RETURN s;
END;
// DELIMITER ;

select genres, f_name(genres) as 'first_name', l_name(genres) as 'last_name' from googleplaystore.play_store;



-- 9. Your senior manager wants to know which apps are  not performing as per in their particular category, 
-- however he is not interested in handling too many files or list for every  category and he/she assigned you with a task 
-- of creating a dynamic tool where he/she  can input a category of apps he/she  interested in and your tool then 
-- provides real-time feedback by displaying apps within that category that have ratings lower than 
-- the average rating for that specific category.
DELIMITER //
CREATE PROCEDURE checking(IN cate VARCHAR(30))
BEGIN
    SET @c = (
        SELECT average FROM (
            SELECT category, ROUND(AVG(rating), 2) AS average FROM  googleplaystore.play_store GROUP BY category
        ) AS m WHERE category = cate
    );
    
    SELECT * FROM  googleplaystore.play_store WHERE category = cate AND rating < @c;
END//
DELIMITER ;

call checking('business')



-- 10. What is duration time and fetch time?
-- Answer:- 
-- Duration Time :- Duration time is how long  it takes system to completely understand the instructions given 
                 -- from start to end  in proper order  and way.
-- Fetch Time :- Once the instructions are completed , fetch ttime is like the time it takes for  the system to hand 
			  -- back the results, it depend on how quickly  ths system can find  and bring back what you asked for.
                
-- If query is simple and have  to show large valume of data, fetch time will be large, 
-- If query is complex duration time will be large.


/*EXAMPLE
Duration Time: Imagine you type in your search query, such as "fiction books," and hit enter. The duration time is the period 
it takes for the system to process your request from the moment you hit enter until it comprehensively understands what you're 
asking for and how to execute it. This includes parsing your query, analyzing keywords, and preparing to fetch the relevant data.

Fetch Time: Once the system has fully understood your request, it begins fetching the results. Fetch time refers to the time it 
takes for the system to retrieve and present the search results back to you.

For instance, if your query is straightforward but requires fetching a large volume of data (like all fiction books in the library), 
the fetch time may be prolonged as the system sifts through extensive records to compile the results. Conversely, if your query 
is complex, involving multiple criteria or parameters, the duration time might be longer as the system processes the intricacies 
of your request before initiating the fetch process.*/


