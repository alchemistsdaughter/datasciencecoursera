## download all necessary libraries
library(data.table)
library(dplyr)

## create directory if needed, download file, unzip file
filename = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists('./UCI HAR Dataset.zip')) {
    download.file(filename, './UCI HAR Dataset.zip', mode = "wb")
    unzip("UCI HAR Dataset.zip", exdir = getwd())
}

## read the activity, subject, and feature data sets
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

featuresTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
featuresTrain <- read.table("./UCI HAR Dataset/train/x_train.txt", header = FALSE)
## merge test and training data rows
comboActivity <- rbind(activityTest, activityTrain)
comboSubject <- rbind(subjectTest, subjectTrain)
comboFeatures <- rbind(featuresTest, featuresTrain)

## Update Names
names(comboActivity) <- c("activity")
names(comboSubject) <- c("subject")
featuresNames <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
names(comboFeatures) <- featuresNames$V2

## merge actvity, subject, and feature rows
data.all <- cbind(comboActivity, comboFeatures, comboSubject)

##Extract the measurements on the mean and SD for each measurement
    # find all featurenames that reference mean or std
subFeaturesNames <- featuresNames$V2[grep("mean|std", featuresNames$V2)]
    #subset data.all by subFeaturesNames
data.all <- subset(data.all, select = c("subject", "activity", as.character(subFeaturesNames)))

## name activities in dataset
    #read activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("label", "activity"))
    # sub out activity label from data.all$activity for activity name from "activityLabels"
data.all$activity <- activityLabels[data.all$activity, 2]

## label the data set with readable variable names
names(data.all) <- gsub("^t","time", names(data.all))
names(data.all) <- gsub("Acc","Accelerometer", names(data.all))
names(data.all) <- gsub("Mag","Magnitude", names(data.all))
names(data.all) <- gsub("^f","frequency", names(data.all))
names(data.all) <- gsub("Gyro","Gyroscope", names(data.all))
names(data.all) <- gsub("BodyBody","Body", names(data.all))


## create new data set with the average of each variable for each activity and
## each subject

tidyData <- data.all %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(tidyData, "TidyData.txt", row.name = FALSE)


