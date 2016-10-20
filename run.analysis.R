## Data for this analysis was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## The "UCI HAR DATASET" was unzipped into the proper analysis folder

setwd(file.path(getwd(), "UCI HAR DATASET"))  ## set the working directory to the folder containing the relevant txt files
features <- read.table("features.txt")  ## names of the feature measurements that were recorded for each subject for each activity
activity_labels <- read.table("activity_labels.txt")  ## list of the 6 activities performed, represented by numbers 1-6

## read in the files located in the test folder under the working directory
subject_test <- read.table(file.path(getwd(), "test/subject_test.txt")) ## subjects that performed testing
x_test <- read.table(file.path(getwd(), "test/X_test.txt"))
test_activity <- read.table(file.path(getwd(), "test/Y_test.txt"))  ## 1 of the 6 activities performed during testing

## read in the files located in the train folder under the working directory
subject_train <- read.table(file.path(getwd(), "train/subject_train.txt"))  ## subjects that performed training 
x_train <- read.table(file.path(getwd(), "train/X_train.txt"))
train_activity <- read.table(file.path(getwd(), "train/Y_train.txt"))  ## 1 of the 6 activities performed during training

## add the feature names to the header rows of the x_test and x_train datasets
colnames(x_test) <- features[,2]
colnames(x_train) <- features[,2]

## extract only the columns that contain "mean" or "std" in header
test_mean_std <- x_test[, grep("mean|std", names(x_test))]
train_mean_std <- x_train[, grep("mean|std", names(x_train))]

## name the columns descriptively
colnames(activity_labels) <- c("Activity_num", "Activity")
colnames(test_activity) <- c("Activity_num")
colnames(train_activity) <- c("Activity_num")
colnames(subject_test) <- "Subject"
colnames(subject_train) <- "Subject"

library(dplyr)

## create a second column which assigns activity labels to activity_num as defined in activity_labels
test_labels <- inner_join(test_activity, activity_labels)
train_labels <- inner_join(train_activity, activity_labels)

## bind the relevant test files together
test_subj_act <- cbind(subject_test, test_labels)
test_all <- cbind(test_subj_act, test_mean_std)
## bind the relevant train files together
train_subj_act <- cbind(subject_train, train_labels)
train_all <- cbind(train_subj_act, train_mean_std)

## combine the train and test datasets
train_test <- rbind(train_all, test_all)
## sort by subject and then activity number
train_test_sorted <- arrange(train_test, Subject, Activity_num)  ## tidy data set

## further analysis to calculate the mean of each variable by subject and activity
mean_by_subj_activity <- aggregate(train_test_sorted[, 4:81], list(Subject= train_test_sorted$Subject, Activity_num= train_test_sorted$Activity_num, Activity= train_test_sorted$Activity), mean)
## arrange by subject number followed by actvity number and write the data to a table called tidy_data
tidy_data <- arrange(mean_by_subj_activity, Subject, Activity_num)
write.table(tidy_data, "tidy_data.txt")
