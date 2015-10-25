#Codebook for Course Project - Getting and Cleaning Data
##Files in Source Data Set Used in Analysis
* features.txt - Lists the features measured.
* test/X_test.txt - Contains the test set of data.
* test/y_test.txt - Includes the ID numbers for the activities performed for the test set.
* test/subject_test.txt - Lists the ID numbers for the subjects performing the activities in the test set.
* train/X_train.txt - Contains the training set of data.
* train/y_train.txt - Includes the ID numbers for the activities performed for the training set.
* train/subject_train.txt - Lists the ID numbers for the subjects performing the activities in the training set.
* activity_labels.txt - Lists the ID numbers of the activities along with their corresponding names.
##Script Methodology
The requirements for the script as described in the assignment are listed below:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The script completes these requirements by following these steps:
1. The files listed above were loaded into R.  Additional files found in the data set, such as the data found in the Inertial Signals subfolders, were not needed to complete the requirements and were therefore not loaded.
2. The subject and activity data was added to the test and training data using cbind.
3. The resulting test and training data frames were combined into one data frame using rbind, completing step 1 above.
4. The combined data frame was reduced down to columns containing either "-mean()" or "-std()" along with the subject and activity columns using the grepl command, completing step 2.
5. The activity ID numbers in the combined data frame were replaced with the corresponding names from activity_labels.txt using a sqldf command, completing step 3.
6. The column names were changed to a more descriptive form using a custom function called fixname, completing step 4.  Based on guidance from the discussion forums and other sources, I chose to follow these standards:
  *  No upper case letters.
  *  No abbreviations.
  *  No underscores, periods, or other punctuation marks.
7. The combined data frame was melted using the melt command with the subject and activity columns as the IDs and all other columns as the measured variables.
8. The means of each of the measured variables by subject and activity were then calculated using the dcast function on the melted data frame.
9. The resulting data frame was then written to a file named "tidyset.txt", completing step 5.
##Variables in Output
The variables included in the output are the averages of the original values found in the test and training sets by activity and subject.  The units are the same ones found in the original data set.  The variables are listed below along with their original names:
| Variable | Original Name |
| ------------- | ------------- |
| subject | subject |
| activity | activity |
| timebodyaccelerationmeanx | tBodyAcc-mean()-X |
| timebodyaccelerationmeany | tBodyAcc-mean()-Y |
| timebodyaccelerationmeanz | tBodyAcc-mean()-Z |
| timebodyaccelerationstandarddeviationx | tBodyAcc-std()-X |
| timebodyaccelerationstandarddeviationy | tBodyAcc-std()-Y |
| timebodyaccelerationstandarddeviationz | tBodyAcc-std()-Z |
| timegravityaccelerationmeanx | tGravityAcc-mean()-X |
| timegravityaccelerationmeany | tGravityAcc-mean()-Y |
| timegravityaccelerationmeanz | tGravityAcc-mean()-Z |
| timegravityaccelerationstandarddeviationx | tGravityAcc-std()-X |
| timegravityaccelerationstandarddeviationy | tGravityAcc-std()-Y |
| timegravityaccelerationstandarddeviationz | tGravityAcc-std()-Z |
| timebodyaccelerationjerkmeanx | tBodyAccJerk-mean()-X |
| timebodyaccelerationjerkmeany | tBodyAccJerk-mean()-Y |
| timebodyaccelerationjerkmeanz | tBodyAccJerk-mean()-Z |
| timebodyaccelerationjerkstandarddeviationx | tBodyAccJerk-std()-X |
| timebodyaccelerationjerkstandarddeviationy | tBodyAccJerk-std()-Y |
| timebodyaccelerationjerkstandarddeviationz | tBodyAccJerk-std()-Z |
| timebodygyroscopemeanx | tBodyGyro-mean()-X |
| timebodygyroscopemeany | tBodyGyro-mean()-Y |
| timebodygyroscopemeanz | tBodyGyro-mean()-Z |
| timebodygyroscopestandarddeviationx | tBodyGyro-std()-X |
| timebodygyroscopestandarddeviationy | tBodyGyro-std()-Y |
| timebodygyroscopestandarddeviationz | tBodyGyro-std()-Z |
| timebodygyroscopejerkmeanx | tBodyGyroJerk-mean()-X |
| timebodygyroscopejerkmeany | tBodyGyroJerk-mean()-Y |
| timebodygyroscopejerkmeanz | tBodyGyroJerk-mean()-Z |
| timebodygyroscopejerkstandarddeviationx | tBodyGyroJerk-std()-X |
| timebodygyroscopejerkstandarddeviationy | tBodyGyroJerk-std()-Y |
| timebodygyroscopejerkstandarddeviationz | tBodyGyroJerk-std()-Z |
| timebodyaccelerationmagnitudemean | tBodyAccMag-mean() |
| timebodyaccelerationmagnitudestandarddeviation | tBodyAccMag-std() |
| timegravityaccelerationmagnitudemean | tGravityAccMag-mean() |
| timegravityaccelerationmagnitudestandarddeviation | tGravityAccMag-std() |
| timebodyaccelerationjerkmagnitudemean | tBodyAccJerkMag-mean() |
| timebodyaccelerationjerkmagnitudestandarddeviation | tBodyAccJerkMag-std() |
| timebodygyroscopemagnitudemean | tBodyGyroMag-mean() |
| timebodygyroscopemagnitudestandarddeviation | tBodyGyroMag-std() |
| timebodygyroscopejerkmagnitudemean | tBodyGyroJerkMag-mean() |
| timebodygyroscopejerkmagnitudestandarddeviation | tBodyGyroJerkMag-std() |
| frequencybodyaccelerationmeanx | fBodyAcc-mean()-X |
| frequencybodyaccelerationmeany | fBodyAcc-mean()-Y |
| frequencybodyaccelerationmeanz | fBodyAcc-mean()-Z |
| frequencybodyaccelerationstandarddeviationx | fBodyAcc-std()-X |
| frequencybodyaccelerationstandarddeviationy | fBodyAcc-std()-Y |
| frequencybodyaccelerationstandarddeviationz | fBodyAcc-std()-Z |
| frequencybodyaccelerationjerkmeanx | fBodyAccJerk-mean()-X |
| frequencybodyaccelerationjerkmeany | fBodyAccJerk-mean()-Y |
| frequencybodyaccelerationjerkmeanz | fBodyAccJerk-mean()-Z |
| frequencybodyaccelerationjerkstandarddeviationx | fBodyAccJerk-std()-X |
| frequencybodyaccelerationjerkstandarddeviationy | fBodyAccJerk-std()-Y |
| frequencybodyaccelerationjerkstandarddeviationz | fBodyAccJerk-std()-Z |
| frequencybodygyroscopemeanx | fBodyGyro-mean()-X |
| frequencybodygyroscopemeany | fBodyGyro-mean()-Y |
| frequencybodygyroscopemeanz | fBodyGyro-mean()-Z |
| frequencybodygyroscopestandarddeviationx | fBodyGyro-std()-X |
| frequencybodygyroscopestandarddeviationy | fBodyGyro-std()-Y |
| frequencybodygyroscopestandarddeviationz | fBodyGyro-std()-Z |
| frequencybodyaccelerationmagnitudemean | fBodyAccMag-mean() |
| frequencybodyaccelerationmagnitudestandarddeviation | fBodyAccMag-std() |
| frequencybodybodyaccelerationjerkmagnitudemean | fBodyBodyAccJerkMag-mean() |
| frequencybodybodyaccelerationjerkmagnitudestandarddeviation | fBodyBodyAccJerkMag-std() |
| frequencybodybodygyroscopemagnitudemean | fBodyBodyGyroMag-mean() |
| frequencybodybodygyroscopemagnitudestandarddeviation | fBodyBodyGyroMag-std() |
| frequencybodybodygyroscopejerkmagnitudemean | fBodyBodyGyroJerkMag-mean() |
| frequencybodybodygyroscopejerkmagnitudestandarddeviation | fBodyBodyGyroJerkMag-std() |


