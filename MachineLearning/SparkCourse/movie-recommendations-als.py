import sys
from pyspark import SparkConf, SparkContext
from pyspark.mllib.recommendation import ALS, Rating
import csv

import mysql.connector
from datetime import date, datetime, timedelta


def loadMovieNames():
    movieNames = {}
    with open("ml-latest-small/movies.csv") as f:
        reader = csv.reader(f)
        for line in reader:
            movieNames[int(line[0])] = line[1]
    return movieNames

#### MYSQL #########################################################################
cnx = mysql.connector.connect(user='root', password='MYSQL',
                              host='localhost',
                              database="info")
c = cnx.cursor()
user = int(sys.argv[1])

#c.execute("SELECT * FROM ratings WHERE user_id = %s",(user,))
c.execute("SELECT user_id, movie_id, rating FROM ratings ")
query = c.fetchall()


#### MYSQL #########################################################################
conf = SparkConf().setMaster("local[*]").setAppName("MovieRecommendationsALS")
sc = SparkContext(conf = conf)
sc.setCheckpointDir('checkpoint')

print("\nLoading movie names...")
nameDict = loadMovieNames()

data = sc.parallelize(query)
# data = sc.textFile("file:/Users/alejandroaparicio/Documents/SparkCourse/ml-latest-small/ratings.csv")

ratings = data.map(lambda l: Rating(int(l[0]), int(l[1]), float(l[2]))).cache()

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
# for rating in userRatings.collect():
#     print nameDict[int(rating[1])] + ": " + str(rating[2])

print("\nTop 10 recommendations:")
recommendations = model.recommendProducts(userID, 10)
# for recommendation in recommendations:
#     print recommendation[0],':', nameDict[float(recommendation[1])] + \
#         " score " + str(recommendation[2])

#### MYSQL #########################################################################
insert_recommendations = ("INSERT INTO suggestions (user_id,movie_id, rating) VALUES(%s,%s,%s)")

c.execute("DELETE FROM suggestions WHERE user_id = (userID) VALUES(%s)")
cnx.commit()
for recommendation in recommendations:
    c.execute(insert_recommendations,(int(recommendation[0]),int(recommendation[1]),float(recommendation[2])))
    cnx.commit()

c.close()
cnx.close()

