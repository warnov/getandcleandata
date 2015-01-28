#This function makes all the process to unify and get tidy data
tidyIOT <- function(){
  #Let's read all the subject test columns both for test and then training:
  
    #TEST Users
    tidyTests <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")
    
    #Now let's add the column that identifies the kind of activity in the Measurements
    #to the previous data frame
    tidyTests <- cbind(tidyTests,
                       read.table(file = "UCI HAR Dataset/test/y_test.txt")[1])

    #Reading all the Measurements
    allTestMeasurements <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
    
    #Getting the indexes of the columns that we will need from the recent
    #loaded data as we need only columns with mean and standard deviation (std) Measurements
    
      #First we need to load the column names data
      colNamesData <- read.table(file = "UCI HAR Dataset/features.txt")
      
      #These are the column names that calculate standar deviation
      stdCols <- colNamesData[(grep("std",as.character(colNamesData$V2))),]
    
      #These are the column names that calculate mean
      meanCols <- colNamesData[(grep('mean[(]',as.character(colNamesData$V2))),]
    
      #Now let's unify the indexes to know what to extract (and sort them)
      correctIndexes <- sort(c(stdCols$V1,meanCols$V1))
      
    #Now we can bring the data we want
    testMeasurements=allTestMeasurements[,correctIndexes]
    
    #Adjusting the column names for the data up here
    columnNames <- colNamesData[(correctIndexes),][2]
    colTitle=c(as.character(columnNames$V2))
    
    colnames(tidyTests) <- c('UserId', 'ActivityId')
    colnames(testMeasurements) <- colTitle
    
    #Now let's bind these two data sets
    tests <- cbind(tidyTests,testMeasurements)   
    
    #Time to process Training Data
    #Training Users
    tidyTraining <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")
    
    #Now let's add the column that identifies the kind of activity in the Measurement
    tidyTraining <- cbind(tidyTraining, 
                          read.table(file = "UCI HAR Dataset/train/y_train.txt"))    
    
    #Reading all the training Measurements
    allTrainingMeasurements <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
    #Now we can bring the data we want
    trainingMeasurements=allTrainingMeasurements[,correctIndexes]
    
    #Adjusting the column names for the data up here    
    colnames(tidyTraining) <- c('UserId', 'ActivityId')
    colnames(trainingMeasurements) <- colTitle
    
    #Now let's bind these two data sets
    training <- cbind(tidyTraining, trainingMeasurements)
    
    #Now let's bind the test and the trainings
    tidy <- rbind(tests,training) 
    
    #Now lets get the average of all the Measurements for each user and each activity
    #Observe how we calculate the mean as it is required
    agTidy <- aggregate(tidy, by=list(tidy$UserId,tidy$ActivityId), 
                      FUN=mean, na.rm=TRUE)     

    #Finally, lets rename the columns in a proper way and present just what is necessary
    finalTidy <- agTidy[c(c(1,2),c(5:70))]
    #It is just necesary to change the label of the first two columns
    colnames(finalTidy)[c(1,2)] <- c('UserId','ActivityId')
    
    #Let's replace the codes for activity type to its names
    activityLabels <- read.table(file = "UCI HAR Dataset/activity_labels.txt")
    finalTidy$ActivityId <- 
      sapply(finalTidy$ActivityId, function(x){activityLabels[x,]$V2})

    finalTidy
}