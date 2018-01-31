# course3

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. There are total 30 subjects performing 6 different kinds of activities. 

Assignment 1: 
Merges the training and the test sets to create one data set. This step is to use cbind and rbind functions to combine the datasets together based on the dimensions of different files.

Assignment 2:
Extracts only the measurements on the mean and standard deviation for each measurement. This step used the regular expression functions to search for the feature labels satisfying the conditions.

Assignment 3:
Uses descriptive activity names to name the activities in the data set. This step used the merge function from the drply package to left join the labels file to the activity number files using the activity number as id. 

Assignment 4:
Appropriately labels the data set with descriptive variable names. This step used the regular expression to clean the feature labels for a tidy dataset.

Assignment 5:
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This step used the reshape techniques to reconstruct the datasets and get a file for average measurement of each feature for each subject and each activity. 

