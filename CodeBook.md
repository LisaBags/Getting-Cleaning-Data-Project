# CodeBook for: Getting-Cleaning-Data-Project
Data for this analysis was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## Feature variables
561 variable measurements (listed in the features.txt file) were recorded from 30 participants while performing 6 different activities including **walking, walking_upstairs, walking_downstairs, sitting, standing, and laying** using a Samsung Galaxy S II smartphone to record triaxial acceleration and angular velocity.  The data were passed through filters and the measurements were based on time (t) or frequency (f) and range from -1:1.  Although many measurements were recorded, our main focus was on the **mean and standard deviation measurements**.

## run.analysis.R

The run.analysis.R script contains the code necessary to: 

1. set the working directory to the folder containing the "UCI HAR DATASET" 
2. read in the raw data files. Common files include features.txt (as described above), activity_labels.txt which shows the 6 activities    assigned to a number (1-6), as well as a readme and features_info file.  Data were separated into a train (70%) and test (30%) folder, each of which includes a subject file that lists the participant number (1-30), an x file which shows the data from those participants and a y file which lists the activity numbers that were performed.
3. add the appropriately labeled headers to all the files and extract only the variables that represent a mean or standard deviation.
4. add a column to the data which assigns an activity label to its corresponding number as described in activity_labels
5. bind all the train files together so that each row includes the subject number and activity label along with the mean and std measurements. Do the same for the test files.
6. merge the train and test data sets together and sort the data by subject number, then activity number.
7. calculate the average measurement of the mean and standard deviation variables for each participant for each activity and order by subject, then activity number.
8. write the results to a table called tidy_data.txt


## Acknowledgement
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
