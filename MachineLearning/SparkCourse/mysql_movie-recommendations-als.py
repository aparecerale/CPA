import sys
from pyspark import SparkConf, SparkContext
from pyspark.mllib.recommendation import ALS, Rating
import urllib

import mysql.connector
from mysql.connector import errorcode

def loadMovieNames():
    movieNames = {}
    with open("ml-100k/u.item") as f:
        for line in f:
            fields = line.split('|')
            movieNames[int(fields[0])] = fields[1].decode('ascii', 'ignore')
    return movieNames
# MySQL Connector ========================================================

cnx = mysql.connector.connect(user='root', database='MYSQL')
# cnx = mysql.connector.connect(user='root', password='MYSQL',
#                               # host='127.0.0.1',
#                               host='localhost',
#                               database='info')
cursor = cnx.cursor()
query = ("SELECT movie_id, rating FROM ratings "
         "WHERE hire_date BETWEEN %s AND %s")

print(cnx)
cnx.close()

# END MySQL Connector ========================================================


conf = SparkConf().setMaster("local[*]").setAppName("MovieRecommendationsALS")
sc = SparkContext(conf = conf)
sc.setCheckpointDir('checkpoint')

print("\nLoading movie names...")
nameDict = loadMovieNames()

data = sc.textFile("file:/Users/alejandroaparicio/Documents/SparkCourse/ml-100k/u.data")

ratings = data.map(lambda l: l.split()).map(lambda l: Rating(int(l[0]), int(l[1]), float(l[2]))).cache()

# Build the recommendation model using Alternating Least Squares
print("\nTraining recommendation model...")
#rank = 10
# Lowered numIterations to ensure it works on lower-end systems
#numIterations = 10
#model = ALS.train(ratings, rank, numIterations)
seed = 5
iterations = 10
regularization_parameter = 0.1
rank = 8

model = ALS.train(ratings, rank, seed=seed, iterations=iterations,
                  lambda_=regularization_parameter)

userID = int(sys.argv[1])

print("\nRatings for user ID " + str(userID) + ":")
userRatings = ratings.filter(lambda l: l[0] == userID)
for rating in userRatings.collect():
    print nameDict[int(rating[1])] + ": " + str(rating[2])

print("\nTop 10 recommendations:")
recommendations = model.recommendProducts(userID, 10)
for recommendation in recommendations:
    print nameDict[int(recommendation[1])] + \
        " score " + str(recommendation[2])
