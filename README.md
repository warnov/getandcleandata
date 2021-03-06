## Getting and Cleaning Data Course Project ##

This repo contains only one script: [`run_analysis.R`](/run_analysis.R "R Script")

The script assumes your R workspace contains a folder called `UCI HAR Dataset`, with all the data from the devices inside it with no modification to the original structure obtained from [this file.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  "UCI HAR Dataset.zip")

The script Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set. 
Appropriately labels the data set with descriptive variable names. 
And creates an independent tidy data set with the average of each variable for each activity and each subject.

For a detailed description about how the data was manipulated, please check the [CodeBook.md](/CodeBook.md "Codebook") file.
