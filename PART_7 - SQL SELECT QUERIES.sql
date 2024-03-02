
-- QUERY 1: One query must contain a join of at least three tables
-- Finds the names of all vegeterian lunch dishes and the dining halls/colleges they are served at

SELECT 
  College.name AS CollegeName, 
  DiningHall.name AS DiningHallName, 
  FoodDish.name AS DishName
FROM Serving
JOIN FoodDish ON Serving.foodDish_id = FoodDish.foodDish_id
JOIN DiningHall ON Serving.diningHall_id = DiningHall.diningHall_id
JOIN Has ON DiningHall.diningHall_id = Has.diningHall_id
JOIN College ON Has.college_id = College.college_id
WHERE FoodDish.type = 'VEGETARIAN' AND FoodDish.meal_time = 'LUNCH'
ORDER BY CollegeName, DiningHallName, DishName;

-- QUERY 2: One must contain a subquery
-- Finds names of all students who have rated a vegan dish
-- I did a double subquery (2 SELECT INs) - first find servings with vegan dishes and then find students with ratings in those servings

SELECT DISTINCT Student.name AS StudentName
FROM Student
WHERE student_id IN (
  SELECT Ratings.student_id
  FROM Ratings
  WHERE serving_id IN (
    SELECT Serving.serving_id
    FROM Serving
    JOIN FoodDish ON Serving.foodDish_id = FoodDish.foodDish_id
    WHERE FoodDish.type = 'VEGAN'
  )
);

-- QUERY 3: One must be a group by with a having clause
-- Find all food dishes with an average rating above 3

SELECT FoodDish.name, AVG(Ratings.rating) AS AverageRating
FROM Ratings
JOIN Serving ON Ratings.serving_id = Serving.serving_id
JOIN FoodDish ON Serving.foodDish_id = FoodDish.foodDish_id
GROUP BY FoodDish.name
HAVING AVG(Ratings.rating) > 3;


-- QUERY 4: One must contain a complex search criterion (more than one expression with logical connectors)
-- Find all the emails of students from either MIT or Northeastern University who have rated a serving of a dish either 1 or 5 stars

SELECT Student.name, Student.email, Ratings.rating, FoodDish.name 
FROM Ratings
JOIN Student ON Ratings.student_id = Student.student_id
JOIN Serving ON Ratings.serving_id = Serving.serving_id
JOIN FoodDish ON Serving.foodDish_id = FoodDish.foodDish_id
JOIN College ON Student.college_id = College.college_id
WHERE (Ratings.rating = 5 OR Ratings.rating = 1) AND (College.name = 'Northeastern University' OR College.name = 'Massachusetts Institute of Technology');

-- QUERY 5: Experiment with advanced query mechanisms such as RCTE, PARTITION BY, or SELECT CASE/WHEN.
-- Finds the #1 highest rated dish at each university

SELECT CollegeName, DishName, AvgRating
FROM (
  SELECT 
    College.name AS CollegeName, 
    FoodDish.name AS DishName, 
    AVG(Ratings.rating) AS AvgRating,
    RANK() OVER (PARTITION BY College.name ORDER BY AVG(Ratings.rating) DESC) AS Rank
  FROM Ratings
  JOIN Serving ON Ratings.serving_id = Serving.serving_id
  JOIN FoodDish ON Serving.foodDish_id = FoodDish.foodDish_id
  JOIN DiningHall ON Serving.diningHall_id = DiningHall.diningHall_id
  JOIN Has ON DiningHall.diningHall_id = Has.diningHall_id
  JOIN College ON Has.college_id = College.college_id
  GROUP BY College.name, FoodDish.name
)
WHERE Rank = 1;
