# PART 1-4 / A-D 

## Download the PDF called PART_1, 2, 3, 4 - REQUIREMENTS_UML_ERD_BCNF RELATIONAL (1).pdf in the github repository. 

https://github.com/williampan22/project1/blob/main/PART_1%2C%202%2C%203%2C%204%20-%20REQUIREMENTS_UML_ERD_BCNF%20RELATIONAL%20(1).pdf

(10 pts) Describe the requirements of the problem with a simple document that lists the rules of the database in the problem domain language. Then from that list of rules and notes highlight the list of possible nouns and actions you identified. I'm expecting this to be a short 1 or 2 pages document.

(15 pts) Analyze the problem and create a conceptual model in UML using a tool of your choice (e.g., LucidChart, Enterprise Architect, ArgoUML, Visual Paradigm, ERwin, TOAD) as discussed during class and provided in the references and resources below. Additional requirements and clarifications will be provided in the #general channel on Slack. The diagram must contain at least three classes, at least one to many relationship and one many to many. All relationships, except generalization, must have full multiplicity constraints and labeled as appropriate. Classes must have proper names, descriptions, and attributes with domain types. Key attributes and derived attributes must be marked. Don't build a model with more than 10 entities.

(10 pts) From the Conceptual Model, construct a logical data model expressed as an ERD using a language of your choice (other than UML) and a tool of your choice. The logical data model may not have any many-to-many relationships, so introduce association entities as needed.

(15 pts) From the logical model, define a relational schema in at least BCNF. Using functional dependencies, show that the schema in in at least BCNF. I'm expecting 6-10 relations for one student or 12-20 relations for two students. If in doubt of how much work a student should do, please ask the professor.

The requirements document as a PDF.

UML Class Diagram as an embedded JPG/PNG.

ERD as an embedded JPG/PNG and URL to its LucidChart diagram.

Definition of relational schema with proof that it is in BCNF.
--------------------------------------------------------------------------
# PART 5-6 / E

(10 pts) Create a set of SQL data definition statements for the above model and realize that schema in SQLite3 by executing the script from the SQLite3, the console or Node. You can use DB Browser to generate these statements. Show that the tables were created and conform to the constraints through screen shots or other means.

(10 pts) Populate the tables with test data. You can use tools such as https://www.mockaroo.com/schemasLinks to an external site. or  https://www.generatedata.com/Links to an external site..

SQL file (text file) with the table definitions and creation SQL statements that can be executed with SQLite3

## Copy everything in the SQL file called PART_5, 6 - CREATE TABLE + INSERT INTO DATA.sql in the github repository. Paste it into the "Execute SQL" terminal in DBrowser. 
--------------------------------------------------------------------------
# Part 7

(10 pts) Define and execute at least five queries that show your database. At least one query must contain a join of at least three tables, one must contain a subquery, one must be a group by with a having clause, and one must contain a complex search criterion (more than one expression with logical connectors). Experiment with advanced query mechanisms such as RCTE, PARTITION BY, or SELECT CASE/WHEN.

SQL files for each one of the queries created on point 7, with clear documentation of what they achieve and examples of their outputs.

## The 5 queries are in the SQL file called PART_7 - SQL SELECT QUERIES.sql in the github repository. Paste each query one at a time into the "Execute SQL" terminal in DBrowser.

