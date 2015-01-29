GETTING AND CLEANING DATA PROJECT
CODEBOOK

1. VARIABLES DESCRIPTION
After running the run_analysis.R script with the instructions found in README.md, you can get a tidy dataset with the following variables:

UserId		1, 2
	User Identificator
		1..30 Unique identifier assigned to testers.	

ActivityId	6 Levels
	Activity measured by the tester
		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING

Feature Variables:
The subsequent variables correspond to the measurements made from the features of the devices:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


For each one of these features, two statistics were selected: mean and standard deviation. Where '-XYZ' appears, it denote 3-axial signals in the X, Y and Z directions; so you can expect three measurements (one for each axis). There are 8 variables with measurements in thre axis, giving us 24 columns. And 9 other variables with one just measurement; this give us 33 columns. This is for each one of the statistics calculated (mean and std), giving us 66 columns. These is the list of those 66 variables:

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z	
fBodyAcc-std()-X	
fBodyAcc-std()-Y	
fBodyAcc-std()-Z	
fBodyAccJerk-mean()-X	
fBodyAccJerk-mean()-Y	
fBodyAccJerk-mean()-Z	
fBodyAccJerk-std()-X	
fBodyAccJerk-std()-Y	
fBodyAccJerk-std()-Z	
fBodyGyro-mean()-X	
fBodyGyro-mean()-Y	
fBodyGyro-mean()-Z	
fBodyGyro-std()-X	
fBodyGyro-std()-Y	
fBodyGyro-std()-Z	
fBodyAccMag-mean()	
fBodyAccMag-std()	
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()

DATA TRANSFORMATIONS
Files UCI HAR Dataset/test/subject_test.txt, UCI HAR Dataset/test/y_test.txt and UCI HAR Dataset/test/X_test.txt where bound by columns in order to get all the info relative to TESTS: This is: UserID, Activity and measurements. 

This dataset contained the full set of measurements; but as only those measuring mean and standard deviation were required, a procedure to select just these columns out from the dataset were made.

After these, appropriate column names were given to the resulting dataset. These column names were extracted from "UCI HAR Dataset/features.txt" file.

The same procedure of merging files was made in order to extract the training data from the files: UCI HAR Dataset/train/subject_train.txt, UCI HAR Dataset/train/y_train.txt and UCI HAR Dataset/train/X_train.txt.
After having the dataset with all the columns, the same columns selection was executedalready having the column names from the previous operation.

After this, both: tests and training datasets were merged by rows.

With all the measurements ready, an aggregation by user and activity was made, using the mean as aggregating function for the rest od the variables in order to have an independent tidy data set with the average of each variable for each activity and each subject.

With this being done, another selection of columns was made in order to eliminate redundant info. And a relabeling of columns to have proper names was practiced.

To finish the processing of the data, the ids from activities were replaced by their descriptive names extracted from "UCI HAR Dataset/activity_labels.txt", in order to produce a more readable final dataset.

