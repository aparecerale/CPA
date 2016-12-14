#Movie Recommender System
##Costumer Potential Application (EC601A1)

Try live demo at: http://1621t870s4.imwork.net

Watch operating video at: https://www.youtube.com/watch?v=OlWqsyNqF5k or downloading FinalDemo.mp4

If you have any problem, contact tonycao@bu.edu please.

###Purpose:

The objective of customer potential application is that we try to predict movies according to user’s taste. Generally speaking, we have two methods, one is to find the similar movie. This one is based on movie datasets,  which downloaded from Kaggle. And another is to explore the similar user. This method is based on the watching history of users. We have to collect it from our web application.

For a platform its convenient to choose a web application since it has the ability to turn into a mobile site as well.

###How to deploy it on your computer:
1.Install Intelij IDEA. https://www.jetbrains.com/idea/#chooseYourEdition

2.Download and install MySQL. Then please set user name as "root" and password as "zcpqweqwe123". Build a new schema "info" with two tables "user_info" and "userRating".

3.Configure tables. The "user_info" table has three columns - "id", "user_name" and "password". The "userRating" has four columns - "id", "user_id", "movie_id" and "rating".

4.Download two projects from Movie_Recommender_Final folder, which are movieWebsite and automaticJava.

5.Open movieWebsite and automaticJava in InteliJ IDEA.

6.Run movieWebsite with Tomcat sever and Driver.main() in automaticJava.

###Devoloping Tools:
-------------------
Web developement:
Client-side: HTML and Javascript
Back-end: JavaServer Pages (JSP)

Algorithm:
Hadoop MapReduce 
Apache Spark

Database:
MySQL

Trello Board:
https://trello.com/b/xC7QjXuo/costumer-potential-application

###Group Members:
-------------------
Yuxin Cao(Tony)

Alejandro Aparicio

Shangqiu Cai(Leo)




