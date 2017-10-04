# Readme File
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

1) a tidy data set as described below, 

2) a link to a Github repository with your script for performing the analysis, and 

3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

The R script file '''run_analysis.R''' does the following tasks.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Processing steps

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
