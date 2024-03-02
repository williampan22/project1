-- TASK 5-6 (PART E) - CREATE TABLE AND INSERT INTO SQL STATEMENTS (DATA DEFINITION AND POPULATING DATA)

-- SQL file (text file) with the table definitions and creation SQL statements that can be executed with SQLite3

CREATE TABLE College (
  college_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  address TEXT NOT NULL
);

CREATE TABLE DiningHall (
  diningHall_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  address TEXT NOT NULL
);

CREATE TABLE Has (
  college_id INTEGER,
  diningHall_id INTEGER,
  PRIMARY KEY (college_id, diningHall_id),
  FOREIGN KEY (college_id) REFERENCES College(college_id),
  FOREIGN KEY (diningHall_id) REFERENCES DiningHall(diningHall_id)
);

CREATE TABLE Student (
  student_id INTEGER PRIMARY KEY AUTOINCREMENT,
  college_id INTEGER,
  name TEXT NOT NULL,
  username TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  FOREIGN KEY (college_id) REFERENCES College(college_id)
);

CREATE TABLE FoodDish (
  foodDish_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  description TEXT,
  type TEXT CHECK (type IN ('VEGAN', 'VEGETARIAN', 'GLUTEN-FREE', 'NONE')),
  meal_time TEXT CHECK (meal_time IN ('BREAKFAST', 'LUNCH', 'DINNER'))
);

CREATE TABLE Serving(
  serving_id INTEGER PRIMARY KEY AUTOINCREMENT,
  diningHall_id INTEGER NOT NULL,
  foodDish_id INTEGER NOT NULL,
  time_served DATETIME NOT NULL,
  FOREIGN KEY (diningHall_id) REFERENCES DiningHall(diningHall_id),
  FOREIGN KEY (foodDish_id) REFERENCES FoodDish(foodDish_id)
);

CREATE TABLE Ratings (
  rating_id INTEGER PRIMARY KEY AUTOINCREMENT,
  serving_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  rating INTEGER CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  FOREIGN KEY (serving_id) REFERENCES Serving(serving_id),
  FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

-- INSERT DATA INTO THE DATABASE
-- (10 pts) Populate the tables with test data. 

INSERT INTO College (name, address) VALUES
('Northeastern University', '360 Huntington Ave, Boston, MA 02115'),
('Harvard University', 'Massachusetts Hall, Cambridge, MA 02138'),
('Massachusetts Institute of Technology', '77 Massachusetts Ave, Cambridge, MA 02139'),
('Boston University', 'One Silber Way, Boston, MA 02215'),
('Boston College', '140 Commonwealth Avenue, Chestnut Hill, MA 02467');

INSERT INTO DiningHall (name, address) VALUES
('Levine Hall Dining', 'Levine Hall, Northeastern University'),
('Curry Student Center', 'Curry Student Center, Northeastern University'),
('John Harvard Diner', 'Harvard Yard, Harvard University'),
('Annenberg Dining Hall', 'Annenberg Hall, Harvard University'),
('Tech Eats', 'MIT Building W20, MIT'),
('Koch Cafe', 'Koch Building, MIT'),
('BU Food Court', 'George Sherman Union, Boston University'),
('Marciano Commons', '100 Bay State Road, Boston University'),
('Eagles Nest', 'McElroy Commons, Boston College'),
('Hillside Cafe', 'Hillside, Boston College');

INSERT INTO Has (college_id, diningHall_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10);

INSERT INTO Student (college_id, name, username, password, email) VALUES
(1, 'Fiona Green', 'fgreen', 'pass123', 'fgreen@neu.edu'),
(1, 'George King', 'gking', 'pass123', 'gking@neu.edu'),
(2, 'Hannah Lee', 'hlee', 'pass123', 'hlee@harvard.edu'),
(2, 'Ian Moore', 'imoore', 'pass123', 'imoore@harvard.edu'),
(3, 'Jenny Palmer', 'jpalmer', 'pass123', 'jpalmer@mit.edu'),
(3, 'Kevin Quinn', 'kquinn', 'pass123', 'kquinn@mit.edu'),
(4, 'Linda Ray', 'lray', 'pass123', 'lray@bu.edu'),
(4, 'Mike Stone', 'mstone', 'pass123', 'mstone@bu.edu'),
(5, 'Nina Thomas', 'nthomas', 'pass123', 'nthomas@bc.edu'),
(5, 'Oscar Underwood', 'ounderwood', 'pass123', 'ounderwood@bc.edu');

INSERT INTO FoodDish (name, description, type, meal_time) VALUES
('Spaghetti Carbonara', 'Classic Italian pasta with a creamy sauce', 'NONE', 'DINNER'),
('Tofu Stir Fry', 'Savory tofu stir fry with vegetables', 'VEGAN', 'LUNCH'),
('Quinoa Salad', 'Healthy and refreshing quinoa salad', 'VEGETARIAN', 'LUNCH'),
('Beef Tacos', 'Mexican beef tacos with salsa', 'NONE', 'DINNER'),
('Mushroom Risotto', 'Creamy risotto with wild mushrooms', 'VEGETARIAN', 'DINNER'),
('Salmon Fillet', 'Grilled salmon fillet with herbs', 'NONE', 'DINNER'),
('Vegan Pizza', 'A delicious vegan pizza with assorted toppings', 'VEGAN', 'DINNER'),
('Chicken Caesar Salad', 'Classic Caesar salad with grilled chicken', 'NONE', 'LUNCH'),
('Gluten-Free Waffles', 'Tasty waffles made with gluten-free ingredients', 'GLUTEN-FREE', 'BREAKFAST'),
('Vegetarian Burger', 'A mouthwatering burger made from plant-based ingredients', 'VEGETARIAN', 'LUNCH');

INSERT INTO Serving (diningHall_id, foodDish_id, time_served) VALUES
(1, 2, '2024-03-11 12:30'),
(2, 3, '2024-03-12 13:00'),
(3, 4, '2024-03-13 19:00'),
(4, 5, '2024-03-14 18:30'),
(5, 1, '2024-03-15 18:15'),
(6, 3, '2024-03-16 12:45'),
(7, 2, '2024-03-17 13:15'),
(8, 4, '2024-03-18 19:20'),
(9, 5, '2024-03-19 18:40'),
(10, 6, '2024-03-20 12:50'),
(1, 7, '2024-03-21 18:00'),
(2, 8, '2024-03-22 13:00'),
(3, 9, '2024-03-23 09:30'),
(4, 10, '2024-03-24 12:00'),
(5, 6, '2024-03-25 19:00'),
(6, 7, '2024-03-26 18:30'),
(7, 8, '2024-03-27 13:10'),
(8, 9, '2024-03-28 09:45'),
(9, 10, '2024-03-29 12:20'),
(10, 1, '2024-03-30 18:25');

INSERT INTO Ratings (serving_id, student_id, rating, comment) VALUES
(1, 1, 5, 'Really good carbonara, some of the best I have ever had'),
(1, 2, 4, 'Good flavor but a bit too creamy for my taste'),
(1, 1, 3, 'Decent carbonara but I have had better'),
(2, 3, 1, 'This tofu stir fry sucked'),
(2, 4, 3, 'Tofu was okay, but the veggies were not fresh'),
(2, 3, 2, 'It tasted funky and was too oily'),
(3, 5, 1, 'Quinoa salad was bland and uninteresting'),
(3, 6, 2, 'Not bad but could use more dressing'),
(3, 5, 4, 'Healthy and filling, enjoyed the fresh vegetables'),
(4, 7, 5, 'Best beef tacos ever'),
(4, 8, 4, 'Tacos were good but could use more seasoning'),
(4, 7, 2, 'Meat was a bit tough, not the best I have had'),
(5, 9, 4, 'Risotto was creamy and delicious'),
(5, 10, 3, 'Mushroom risotto was average, not memorable'),
(5, 9, 2, 'Too rich for my taste and slightly undercooked'),
(6, 7, 3, 'Salmon was okay, but a bit dry'),
(6, 8, 5, 'Perfectly grilled salmon, very tasty'),
(6, 7, 4, 'Enjoyed the herbs but the salmon lacked flavor'),
(7, 9, 5, 'Loved the vegan pizza, full of flavor'),
(7, 10, 4, 'Vegan pizza was surprisingly good'),
(7, 9, 3, 'Decent but could use more variety in toppings'),
(8, 1, 2, 'Chicken Caesar Salad was too bland for my taste'),
(8, 2, 1, 'The lettuce was wilted and the chicken was dry'),
(8, 1, 4, 'Solid Caesar salad, but nothing out of the ordinary'),
(9, 3, 5, 'Gluten-free waffles were a delightful surprise'),
(9, 4, 3, 'Good texture but lacked flavor'),
(9, 3, 4, 'Enjoyable with the right amount of sweetness'),
(10, 5, 4, 'Vegetarian burger was great, but could use more spices'),
(10, 6, 2, 'Burger was too dry and the patty lacked flavor'),
(10, 5, 5, 'One of the best vegetarian burgers I have had');
