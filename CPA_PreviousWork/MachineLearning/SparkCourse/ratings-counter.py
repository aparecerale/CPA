from pyspark import SparkConf, SparkContext
import collections #from python

# Configuration
#      Set Master node in the local machine
conf = SparkConf().setMaster("local").setAppName("RatingsHistogram")
#      Create our spark context sc
sc = SparkContext(conf = conf)

#Load the data locally, MODIFIED the path
#  lines breaks the file into different lines 
#  the map function helps us pass to the lambda the split on each line to have a list of values
#  user_id[0]  movie_id[1] rating[2] timestamp[3]
lines = sc.textFile("file:/Users/alejandroaparicio/Documents/SparkCourse/ml-100k/u.data")
ratings = lines.map(lambda x: x.split()[2])  # extract the 2 field (movie rating) and creates a new RDD called ratings
result = ratings.countByValue()   # Perform an action in our ratings RDD. countByValue is a function and 
                                  # counts and it gives you a tuple of how many time ocurred certain rating.
                                  # is no longer an RDD

# Pyhton code to sort our results to a ordered dictionary
sortedResults = collections.OrderedDict(sorted(result.items()))
for key, value in sortedResults.items():
    print("%s %i" % (key, value))
