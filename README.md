# Getting-Cleaning-Data-Project

Data for this analysis was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip**  
30 participants performed each of 6 activities: walking, walking_upstairs, walking_downstairs, sitting, standing, and laying while wearing a Samsung Galaxy S II smartphone on their waist to record triaxial acceleration and angular velocity measurements.  These measurements range from -1:1. 

Two datasets (x_train and x_test) were obtained by assigning 70% of the volunteers to a training session and 30% to the testing session. The header of these files is located in the features.txt file and their descriptions can be read in the features_info.txt file.  The subject_test and subject_train files list the participant number (1-30) that performed the activities. The y_test and y_train files list the activity numbers that each participant performed, which correspond to the activities listed in the activity_labels.txt file.

The run.analysis.R script takes the raw data from files located in the unzipped folder "UCI HAR DATASET" and creates two data sets:
1.  a tidy data set called 'train_test_sorted' which shows all the feature measurements recorded from each subject for each of the 6 activities.
2.  a tidier data set called 'mean_by_subj_activity' which displays the average of each feature measurement per subject performing each activity.

Please refer to CodeBook.md for information regarding the variables, the data, and all transformations that were performed to clean up the data.




**Reference: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

