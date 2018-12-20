#Code Book
##This code book describes the data and processes used to produce the final tidy data set. 


**Original Data:**
Sourced from experiments carried out with a group of 30 volunteers within age bracket of 19-48 years. 

The files that where used in the analysis (exludes all data contained in the Inertial Signals folders)
*Activity*
test/y_test.txt
train/y_train.txt
activity_labels.txt (names of the activities recorded)

*Subjects*
train/subject_train.txt
test/subject_test.txt

*Features*
train/X_train.txt
test/X_test.txt
features.txt (names of the features recorded)

**Variable Definitions**
subject: test subjects involved in original study
activity: activities tracked during experiements (includes Walking, Walking Upsatirs, Walking Downstairs, Sitting, Standing, and Laying (Laying down))
mean(): Mean value
std(): Standard deviation

###run_analysis.R prepares the raw data and manipulates it to produce the final tiday data set as follows: 
1. Download all libraries, the specified file, and unzips the UCI HAR Dataset
2. Read the data sets that will be merged into one data table
	- activitesTest + activitiesTrain <- y_test.txt + y_train.txt contains the test and train data of activities
	- subjectTest + subjectTrain <- subject_test.txt + subject_train.txt contains the test and train data for the 30 volunteer subjects being observed
	- featuresTest + FeaturesTrain <- x_test + x_train contains the features of the test and train data
3. Merge the test and train data by row into 3 data tables
	- comboActivity <- 10299 rows, 1 col
	- comboSubject <- 10299 rows, 1 col
	- comboFeatures <- 10299 rows, 561 col
4. Update the names for the comboFeatures table using the data from the features.txt file 
5. Combine all 3 data tables together using cbind to product data.all
6. Subset data.all to only show features that contain "mean" or "std"
7. Substitute the activity code numbers with the activity names using the "activity_labels.txt" file (this is purely for data clarity)
8. Provide more clarity by changing any unclear variable names using the gsub() function
9. Create a new dataset with the average of each variable for each activity by grouping data.all by subject and activity and applying the mean function to all columns.
10. Write the new table, which saves it to your current wd.