# Getting and Cleaning Data Course Project
# 
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a 
# series of yes/no questions related to the project. You will be required to submit: 
# 1) a tidy data set as described below, 
# 2) a link to a Github repository with your script for performing the analysis, and 
# 3) a code book that describes the variables, the data, and any transformations or work that you 
# performed to clean up the data called CodeBook.md. You should also include a README.md in the repo 
# with your scripts. This repo explains how all of the scripts work and how they are connected.
# 
# One of the most exciting areas in all of data science right now is wearable computing - 
# see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most 
# advanced algorithms to attract new users. The data linked to from the course website represent data collected 
# from the accelerometers from the Samsung Galaxy S smartphone. 
# 
# A full description is available at the site 
# where the data was obtained:
# 
# Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# You should create one R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
#-------------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(data.table)

### DOWNLOAD AND UNZIP FILES ####
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "dataset.zip"
mypath <- "UCI HAR Dataset"

if (!file.exists(zipfile)) {
      download.file(url, zipfile, method = "curl")
}
if (!file.exists(mypath)) {
unzip(zipfile)
}
#########################

### LOAD FILES AND READ DATA ####
mytrainfiles <- c("UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/train/X_train.txt", "UCI HAR Dataset/train/y_train.txt")
mytestfiles <- c("UCI HAR Dataset/test/subject_test.txt", "UCI HAR Dataset/test/X_test.txt", "UCI HAR Dataset/test/y_test.txt")

trainSubjects <- read.table(mytrainfiles[1])
trainValues <- read.table(mytrainfiles[2])
trainActivities <- read.table(mytrainfiles[3])

testSubjects <- read.table(mytestfiles[1])
testValues <- read.table(mytestfiles[2])
testActivity <- read.table(mytestfiles[3])

#load features
features <- read.table(file.path(mypath, "features.txt"), as.is = TRUE)
# read activity labels
activities <- read.table(file.path(mypath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")
#########################


### Merge training and test sets into one set and assign column names ###
humanActivity <- rbind(
      cbind(trainSubjects, trainValues, trainActivities),
      cbind(testSubjects, testValues, testActivity)
)

# remove individual data tables to save memory
rm(trainSubjects, trainValues, trainActivities, 
   testSubjects, testValues, testActivity)

# assign column names
colnames(humanActivity) <- c("subject", features[, 2], "activity")

### Extract only the measurements on the mean and standard deviation for each measurement ###
# filter based on column names
columnsToKeep <- grepl("subject|activity|mean|std", colnames(humanActivity))
#apply filter
humanActivity <- humanActivity[, columnsToKeep]

# replace activity values with named factor levels
humanActivity$activity <- factor(humanActivity$activity, 
                                 levels = activities[, 1], labels = activities[, 2])

# remove special characters from column names
humanActivityCols <- colnames(humanActivity)
humanActivityCols <- gsub("[\\(\\)-]", "", humanActivityCols)

# expand abbreviations and clean up names
humanActivityCols <- gsub("^f", "frequencyDomain", humanActivityCols)
humanActivityCols <- gsub("^t", "timeDomain", humanActivityCols)
humanActivityCols <- gsub("Acc", "Accelerometer", humanActivityCols)
humanActivityCols <- gsub("Gyro", "Gyroscope", humanActivityCols)
humanActivityCols <- gsub("Mag", "Magnitude", humanActivityCols)
humanActivityCols <- gsub("Freq", "Frequency", humanActivityCols)
humanActivityCols <- gsub("mean", "Mean", humanActivityCols)
humanActivityCols <- gsub("std", "StandardDeviation", humanActivityCols)
humanActivityCols <- gsub("BodyBody", "Body", humanActivityCols)

# use new labels as column names
colnames(humanActivity) <- humanActivityCols

# group by subject and activity and summarise using mean
humanActivityMeans <- humanActivity %>% 
      group_by(subject, activity) %>%
      summarise_all(funs(mean))

# output to file "tidy_data.txt"
write.table(humanActivityMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)



