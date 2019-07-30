/* 1. 
  - Create a table Edges(Source, Destination) where both Source and Destination are integers.
  - Insert the tuples `(10,5)`, `(6,25)`, `(1,3)`, and `(4,4)`
  - Write a SQL statement that returns all tuples.
  - Write a SQL statement that returns only column Source for all tuples.
  - Write a SQL statement that returns all tuples where Source > Destination.
  - Now insert the tuple `('-1','2000')`. */

create table Edges(Source int, Destination int);

/*Insert the tuples `(10,5)`, `(6,25)`, `(1,3)`, and `(4,4)` */
insert into Edges values (10, 5);
insert into Edges  values (6, 25);
insert into Edges values (1,3);
insert into Edges values(4,4);


/* Write a SQL statement that returns all tuples.*/
select * from Edges;

/* Write a SQL statement that returns only column Source for all tuples.*/
select Source from Edges;

/* Write a SQL statement that returns all tuples where Source > Destination. */
select * from Edges where Source > Destination;

/* Write a SQL statement that returns only column Source for all tuples. */
insert into Edges values('-1','2000');

/* 2. Create a table with attributes of types integer, varchar, date, and Boolean.
However, SQLite does not have date and Boolean: you will use `varchar` and `int` instead. 
Some notes:
  - 0 (false) and 1 (true) are the values used to interpret Booleans.
  - Date strings in SQLite are in the form: 'YYYY-MM-DD'.
  - Examples of date operations on date strings (feel free to try them):
`select date('2011-03-28')`;
`select date('now')`;
`select date('now', '-5 year')`;
`select date('now', '-5 year', '+24 hour')`;
   
  - Create a table called `MyRestaurants`: 
  - Name of the restaurant: a `varchar` field
  - Type of food they make: a `varchar` field
  - Distance (in minutes) from your house: an `int`
  - Date of your last visit: a `varchar` field, interpreted as date
  - Whether you like it or not: an `int`, interpreted as a Boolean */

create table MyRestaurants
  (name varchar(20), 
   food varchar(20),
   distance int,
   last_visit varchar(10),
   like_or_not int
 );

/* 3. Insert at least five tuples using the SQL INSERT command five (or more) times.
Insert at least one restaurant you liked, at least one restaurant you did not like,
and at least one restaurant where you leave the “I like” field `NULL`.
*/

insert into MyRestaurants values ('Ugly Mug', 'Korean fusion', 10, '2019-03-20', 1);
insert into MyRestaurants values ('Nanas Green Tea', 'Japanese', 45, '2019-01-01', NULL);
insert into MyRestaurants values ('Henrys Kitchen', 'Taiwanese', 5, '2018-11-21', 0);
insert into MyRestaurants values('Tofu House', 'Korean', 15, '2019-02-01', 1);
insert into MyRestaurants values('Cheesecake Factory', 'American', 50, '2018-03-01', 1);


/* 4. Write a SQL query that returns all restaurants in your table. Experiment with a few of SQLite's
output formats and show the command you use to format the output along with your query:
  - print the results in comma-separated form
  - print the results in list form, delimited by "` | `"
  - print the results in column form, and make each column have width 15
  - for each of the formats above, try printing/not printing the column headers with the results
  print the results in comma-separated form */

.header off
select * from MyRestaurants;
.mode csv
select * from MyRestaurants;

/*  print the results in list form, delimited by "` | `" */
.mode list
.separator |
select * from MyRestaurants;

/* print the results in column form, and make each column have width 15 */
.mode column
.width 15 15 15 15
select * from MyRestaurants;

select * from MyRestaurants;
.mode csv
select * from MyRestaurants;


/*5. Write a SQL query that returns only the name and distance of all restaurants within and
including 20 minutes of your house. The query should list the restaurants in alphabetical order of names. */
select name, distance
from MyRestaurants
where distance <= 20
order by name asc;

/* 6. Write a SQL query that returns all restaurants that you like, but have not visited
since more than 3 months ago. */
select * from MyRestaurants
where last_visit < DATE('now', '-3 month') and like_or_not = 1;

/* 7. Write a SQL query that returns all restaurants that are within and including 10 mins from your house. */
select * from MyRestaurants
where distance <= 10;
