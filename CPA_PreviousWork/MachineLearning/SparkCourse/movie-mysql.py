import sys
from pyspark import SparkConf, SparkContext
from pyspark.mllib.recommendation import ALS, Rating
# from __future__ import print_function

import mysql.connector
from mysql.connector import errorcode

cnx = mysql.connector.connect(user='root', password='MYSQL',
                              host='localhost',
                              database='info')
cur = cnx.cursor()

# Use all the SQL you like
cur.execute("SELECT * FROM movies")

# print all the first cell of all the rows
for row in cur.fetchall():
    print row[0]

DB_NAME = 'info'

TABLES = {}
TABLES['employees'] = (
    "CREATE TABLE `employees` ("
    "  `emp_no` int(11) NOT NULL AUTO_INCREMENT,"
    "  `birth_date` date NOT NULL,"
    "  `first_name` varchar(14) NOT NULL,"
    "  `last_name` varchar(16) NOT NULL,"
    "  `gender` enum('M','F') NOT NULL,"
    "  `hire_date` date NOT NULL,"
    "  PRIMARY KEY (`emp_no`)"
    ") ENGINE=InnoDB")

TABLES['departments'] = (
    "CREATE TABLE `departments` ("
    "  `dept_no` char(4) NOT NULL,"
    "  `dept_name` varchar(40) NOT NULL,"
    "  PRIMARY KEY (`dept_no`), UNIQUE KEY `dept_name` (`dept_name`)"
    ") ENGINE=InnoDB")

TABLES['salaries'] = (
    "CREATE TABLE `salaries` ("
    "  `emp_no` int(11) NOT NULL,"
    "  `salary` int(11) NOT NULL,"
    "  `from_date` date NOT NULL,"
    "  `to_date` date NOT NULL,"
    "  PRIMARY KEY (`emp_no`,`from_date`), KEY `emp_no` (`emp_no`),"
    "  CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`emp_no`) "
    "     REFERENCES `employees` (`emp_no`) ON DELETE CASCADE"
    ") ENGINE=InnoDB")

TABLES['dept_emp'] = (
    "CREATE TABLE `dept_emp` ("
    "  `emp_no` int(11) NOT NULL,"
    "  `dept_no` char(4) NOT NULL,"
    "  `from_date` date NOT NULL,"
    "  `to_date` date NOT NULL,"
    "  PRIMARY KEY (`emp_no`,`dept_no`), KEY `emp_no` (`emp_no`),"
    "  KEY `dept_no` (`dept_no`),"
    "  CONSTRAINT `dept_emp_ibfk_1` FOREIGN KEY (`emp_no`) "
    "     REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,"
    "  CONSTRAINT `dept_emp_ibfk_2` FOREIGN KEY (`dept_no`) "
    "     REFERENCES `departments` (`dept_no`) ON DELETE CASCADE"
    ") ENGINE=InnoDB")

TABLES['dept_manager'] = (
    "  CREATE TABLE `dept_manager` ("
    "  `dept_no` char(4) NOT NULL,"
    "  `emp_no` int(11) NOT NULL,"
    "  `from_date` date NOT NULL,"
    "  `to_date` date NOT NULL,"
    "  PRIMARY KEY (`emp_no`,`dept_no`),"
    "  KEY `emp_no` (`emp_no`),"
    "  KEY `dept_no` (`dept_no`),"
    "  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) "
    "     REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,"
    "  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) "
    "     REFERENCES `departments` (`dept_no`) ON DELETE CASCADE"
    ") ENGINE=InnoDB")

TABLES['titles'] = (
    "CREATE TABLE `titles` ("
    "  `emp_no` int(11) NOT NULL,"
    "  `title` varchar(50) NOT NULL,"
    "  `from_date` date NOT NULL,"
    "  `to_date` date DEFAULT NULL,"
    "  PRIMARY KEY (`emp_no`,`title`,`from_date`), KEY `emp_no` (`emp_no`),"
    "  CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`emp_no`)"
    "     REFERENCES `employees` (`emp_no`) ON DELETE CASCADE"
    ") ENGINE=InnoDB")

cnx.close()

# def loadMovieNames():
#     movieNames = {}
#     with open("ml-100k/u.item") as f:
#         for line in f:
#             fields = line.split('|')
#             movieNames[int(fields[0])] = fields[1].decode('ascii', 'ignore')
#     return movieNames

# conf = SparkConf().setMaster("local[*]").setAppName("MovieRecommendationsALS")
# sc = SparkContext(conf = conf)
# sc.setCheckpointDir('checkpoint')

# print("\nLoading movie names...")
# nameDict = loadMovieNames()	

# data = sc.textFile("file:/Users/alejandroaparicio/Documents/SparkCourse/ml-100k/u.data")

# ratings = data.map(lambda l: l.split()).map(lambda l: Rating(int(l[0]), int(l[1]), float(l[2]))).cache()

# # Build the recommendation model using Alternating Least Squares
# print("\nTraining recommendation model...")
# #rank = 10
# # Lowered numIterations to ensure it works on lower-end systems
# #numIterations = 10
# #model = ALS.train(ratings, rank, numIterations)
# seed = 5
# iterations = 10
# regularization_parameter = 0.1
# rank = 8

# model = ALS.train(ratings, rank, seed=seed, iterations=iterations,
#                   lambda_=regularization_parameter)

# userID = int(sys.argv[1])

# print("\nRatings for user ID " + str(userID) + ":")
# userRatings = ratings.filter(lambda l: l[0] == userID)
# for rating in userRatings.collect():
#     # print (nameDict[int(rating[1])] + ": " + str(rating[2]))

# print("\nTop 10 recommendations:")
# recommendations = model.recommendProducts(userID, 10)
# for recommendation in recommendations:
#     print nameDict[int(recommendation[1])] + \
#         " score " + str(recommendation[2])
