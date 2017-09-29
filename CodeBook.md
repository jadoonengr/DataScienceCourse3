# Code Book

This code book describes the various datasets/variables used in this project, as well as the processing required to create the resulting tidy data set.

# Overview

30 volunteers performed 6 different activities while wearing a smartphone. Smartphone captured various activity metrics.

# Data files used

- features.txt: Names of the 561 features.

- activity_labels.txt: Names and IDs for each of the 6 activities.

- X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.

- subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.

- y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

- X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.

- subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.

- y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

More information about the files is available in README.txt. More information about the features is available in features_info.txt.

# Data files not used in analysis

Data in "Inertial Signals" folder is ignored.

# Processing steps

1. A correct working directory path is set.

2. All the relevant datasets from the following files are loaded properly:
- X_train = X_train.txt
- subject_train = subject_train.txt
- Y_train = Y_train.txt
- X_test = X_test.txt
- subject_test = subject_test.txt
- Y_test = Y_test.txt
- activities = activity_labels.txt
- features = features.txt

3. Combine all the data sets. First, add the subject, activity columns to the training set data and then
to the test set data. Later join the training and test set rows together. Following variables are defined:
- train_set = X_train + subject_train + Y_train
- test_set = X_test + subject_test + Y_test
- combined_set = train_set + test_set

4. Extract the column names from the features variable and set it to combined_set:
- combined_set = features + 'subject' + 'activitiy'

5. Get activity textual names from the activity variable:
combined_set['activity'] = textual values from activity

6. Clean the rows, only rows with mean() and std() are selected.

7. Use reshape2 R package. Use melt command to reshape the data according to subject and activity
columns. Then take the mean of data based on melted IDs.

