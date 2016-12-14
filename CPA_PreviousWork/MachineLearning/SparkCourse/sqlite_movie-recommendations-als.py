import sys
from pyspark import SparkConf, SparkContext
from pyspark.mllib.recommendation import ALS, Rating
import sqlite3
import csv


def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS usersTable(user_id INT, movie_id INT, rating REAL, timeinput REAL)')
    c.execute('CREATE TABLE IF NOT EXISTS moviesTable(movie_id INT, movie_title TEXT)')

def loadMovieNames():
    movieNames = {}
    with open("ml-latest-small/movies.csv") as f:
        reader = csv.reader(f)
        for line in reader:
            movieNames[int(line[0])] = line[1]
    return movieNames

def insert_user_data():
    """ Read a word text and pass it into a sqlite3 dynamic entry"""
    with open("ml-latest-small/ratings.csv") as f:
        for line in f:
            user_id,movie_id,rating,timeinput = line.split(',')
            c.execute("INSERT INTO usersTable(user_id, movie_id, rating, timeinput) VALUES(?, ?, ?, ?)",
            (user_id,movie_id,rating,timeinput))
            conn.commit()
            
def insert_movie_data():
    with open("ml-latest-small/movies.csv") as f:
        for line in f:
            reader = csv.reader(f)
            for line in reader:
                movie_id,movie_title, = line[0],line[1]
                c.execute("INSERT INTO moviesTable(movie_id, movie_title) VALUES(?, ?)",
                (movie_id,buffer(movie_title)))
                conn.commit()

conn = sqlite3.connect('movies.db')
c = conn.cursor()

create_table()
insert_user_data()
insert_movie_data()

conf = SparkConf().setMaster("local[*]").setAppName("MovieRecommendationsALS")
sc = SparkContext(conf = conf)
sc.setCheckpointDir('checkpoint')

print("\nLoading movie names...")
nameDict = loadMovieNames()

data = sc.textFile("file:/Users/alejandroaparicio/Documents/SparkCourse/ml-latest-small/ratings.csv")

ratings = data.map(lambda l: l.split(',')).map(lambda l: Rating(int(l[0]), int(l[1]), float(l[2]))).cache()

c.execute('SELECT * FROM moviesTable')
ratings2 = c.fetchall()


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
    print nameDict[float(recommendation[1])] + \
        " score " + str(recommendation[2])

c.close()
conn.close()