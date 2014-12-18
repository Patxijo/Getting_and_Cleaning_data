##Readme for tidydata

Human Activity Recognition Using Smartphones Dataset
Version 1.1

Patxi Bernales
Panama City, Panama

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.The experiments have been video-recorded to label the data manually.The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

X_train.txt dataset have 7,352 records with 561 variables.
X_test.txt dataset have 2,947 records with 561 variables.
Y_train.txt and Y_test.txt datasets contains each activity performed.
Subject_train.txt and Subject_txt datasets contains the ID for each subject in the experiment.
Features.txt contains the variable names for X_train.txt and X_test.txt.
Activity.txt datasets contains the labels for activity.

We need to load these files into R, to start working, in this case I use the read.table function.

Then I created a vector that contains "mean()" or "std()" from the features.txt file and keep de row index into "keep"", then I sorted keep. Also I created "labels"", which contains the variables names that contains "mean()" or "std()". 

Now that I have all these things, I started with the Course Project

The first step is to merge X_train.txt and X_test into one data set that contains all the records, this data
have 10,299 records with 561 variables. These 561 variables are time and frequency domain variables from the
experiment, the data frame is called "data". Now I procceed to only keep the variables that are contained in keep and called this data frame "dataT", I set the variables names for "dataT" with "labels"(this is actually the fourth step described in the Course Project).

The second step is to select only the variables that contains "mean()" or "std()", in this particularly step I only selected the variables that finished in "mean()" or "std()" and excluding variables like               "angle(Z,gravityMean)" or "fBodyAccMag-meanFreq()".

The third step is to rbind Subject_train.txt and Subject_test.txt into a data frame called "Subject", I did the same with Y_train.txt and Y_test.txt and called it "Y", Now I cbind dataT, Subject and Y, and obtain a data frame called "data" that have 10,299 records and 68 variables. Once I got "data" then I merged "data" with "Activity" by the variable "V1"and the subset "data" and remove the first column.

The fifth step is to create a new tidy data that I called "tidydata", which I group by "Subject_Id" and "Activity" and calculate the mean for each variable, this file have 180 records and 68 variables. The 180 records is because the original data contains 6 activities and 30 subjects, each subject performed each activity (30*6=180)

##In order to see what represents each variable of "tidydata" please check "Codebook.md" in this repository

##December 2014


        
