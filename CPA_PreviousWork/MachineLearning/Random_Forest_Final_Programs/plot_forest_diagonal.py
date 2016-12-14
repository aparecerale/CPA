"""
This code has been adapted from the program plot_forest_iris.py located here
http://scikit-learn.org/stable/auto_examples/ensemble/plot_forest_iris.html

under the BSD 3 clause license  https://en.wikipedia.org/wiki/BSD_licenses


Copyright (c) 2016, Fairly Nerdy
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the <organization> nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Fairly Nerdy BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

********************************************

The purpose of this code is to show how a Decision Tree does its splits


There are 2 Plots that will be generated, using the a simple diagonal data set
    1 - Decision Tree - With a lot of splits
    2 - Random Forest - With a lot of splits, but more blended

"""
print(__doc__)

import numpy as np
import matplotlib.pyplot as plt

from sklearn import clone
from sklearn.ensemble import RandomForestClassifier
from sklearn.externals.six.moves import xrange
from sklearn.tree import DecisionTreeClassifier

# Parameters
n_classes = 4
n_estimators = 16
plot_colors = ('r','orange','yellow','blue')
markers = ('D','s','^','o')

cmap = plt.cm.RdYlBu
#cmap = plt.cm.hsv


plot_step = 0.02  # fine step width for decision surface contours
plot_step_coarser = 0.5  # step widths for coarse classifier guesses
RANDOM_SEED = 13  # fix the seed on each iteration


# Load fruit data
fruit_file = open('Diagonal_Line_Example.csv','rb')
next(fruit_file)
fruit = []

for line in fruit_file:
    fruit.append(line.strip().split(','))

rows = len(fruit)
columns = len(fruit[0])
    
fruit = np.array(fruit)

for column in range(0,columns ):
    # loop through all the rows and columns, replace
    # categories with floats
    cnt1 = 0
    categories = {}
    for row in range(0,rows):
        if (row == 0): 
           try:
               num = float( fruit[row,column] )
               # if this is a number, break from the loop
               break
           except:
               pass
        
        item = fruit[row,column]
        if (item not in categories):
            # see if we already have an item of this category
            #  basically, change apples to 1, bananas to 2, oranges to 3
            #  etc
            categories[item] = cnt1
            cnt1+=1
        fruit[row,column] = categories[item]

    if (column == 0):
        labels = {}
        for key, value in categories.items():
            # labels for the legend in the plots
            labels[int(value)] = key


fruit = fruit.astype(np.float)

plot_idx = 1

models = [DecisionTreeClassifier(max_depth=None),
          RandomForestClassifier(n_estimators=n_estimators)  ]
          
titles = ["Decision Tree: Example Splits",
          "Random Forest: Example Splits"]
cnt1 = 0

pair = [1,2]
for model in models:
    # We only take the two corresponding features
    X = fruit[:,pair].astype(np.float)
    y = fruit[:,0]
    
    np.random.seed(RANDOM_SEED)

    # Train
    clf = clone(model)
    clf = model.fit(X, y)

    scores = clf.score(X, y)
    
    model_title = titles[cnt1]
    plt.title(model_title)

    # Now plot the decision boundary using a fine mesh as input to a
    # filled contour plot
    x_min, x_max = 0, X[:, 0].max() + 1
    y_min, y_max = 0, X[:, 1].max() + 1
    xx, yy = np.meshgrid(np.arange(x_min, x_max, plot_step),
                         np.arange(y_min, y_max, plot_step))

    # Plot either a single DecisionTreeClassifier or alpha blend the
    # decision surfaces of the ensemble of classifiers
    if isinstance(model, DecisionTreeClassifier):
        Z = model.predict(np.c_[xx.ravel(), yy.ravel()])
        Z = Z.reshape(xx.shape)
        cs = plt.contourf(xx, yy, Z, cmap=cmap,alpha=.5)
    else:
        # Choose alpha blend level with respect to the number of estimators
        # that are in use 
        estimator_alpha = 1.0 / len(model.estimators_)
        for tree in model.estimators_:
            Z = tree.predict(np.c_[xx.ravel(), yy.ravel()])
            Z = Z.reshape(xx.shape)
            cs = plt.contourf(xx, yy, Z, alpha=estimator_alpha*.7, cmap=cmap)


    # Plot the training points, these are clustered together and have a
    # black outline
    for i, c in zip(xrange(n_classes), plot_colors):
        idx = np.where(y == i)
        plt.scatter(X[idx, 0], X[idx, 1], c=c, cmap=cmap,s=60,marker=markers[i])
        plt.legend(loc=1)
        plt.xlabel('X value')
        plt.ylabel('Y value')


    plt.show()
    cnt1+=1



