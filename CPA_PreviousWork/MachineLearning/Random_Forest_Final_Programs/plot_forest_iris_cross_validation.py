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

The purpose of this code is to run a cross validation on a Random Forest using the Iris dataset
"""


print(__doc__)

import numpy as np
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier

# Set the random seed so that the results are always the same
np.random.seed(12345)

# Load the Iris dataset, which is already included in sklearn
iris = load_iris()
X = iris.data
y = iris.target

model = RandomForestClassifier()

# Shuffle the indices in order to get a random order for
# the cross validation
idx = np.arange(X.shape[0])
np.random.shuffle(idx)

# 10 K-fold cross validation
k_fold = 10
slice_size = X.shape[0] / float(k_fold)

# loop through different cross validations
score_sum = 0.0
for i in range(0,k_fold):
    start = int(i * slice_size)
    end   = int((i+1) * slice_size)
    
    # slice a section from the training set
    X_train = X[ np.append(idx[0:start],idx[end:]) ]
    y_train = y[ np.append(idx[0:start],idx[end:]) ]
    
    # use that section for the test set
    X_test = X[ idx[start:end] ]
    y_test = y[ idx[start:end] ]
    
    # Train the model
    clf = model.fit(X_train, y_train)
    # score the model on the test set
    score = clf.score(X_test, y_test)
    score_sum += score

print
print
print
print "Average Cross Validation Score ",score_sum / k_fold


