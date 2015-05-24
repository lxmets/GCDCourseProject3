---
title: "Codebook"
author: "RN Uma"
date: "Thursday, May 21, 2015"
output: html_document
---

#Human Activity Recognition Using Smartphones Dataset: Generating the Tidy Data Set HARSmartphoneLongTidyData.txt

This codebook consists of the following 3 sections:

1. Data Collection and Description.
2. Description of Generation of Tidy Data Set: 'HARSmartphoneLongTidyData.txt'.
3. Description of the Tidy Data Set: 'HARSmartphoneLongTidyData.txt'.

These sections were identified based on the [characteristics of best codebooks](http://dss.princeton.edu/online_help/analysis/codebook.htm).

### Data Collection and Description

This data set is from the following source:

*Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws*

with the following citation:

1. *Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012. (This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited. Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.)*

The following description in italics is copied verbatim, for the sake of completeness of a codebook, from the authors' document describing the original data set:

*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.*

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.*

*For each record it is provided:*

* *Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.*
* *Triaxial Angular velocity from the gyroscope.*
* *A 561-feature vector with time and frequency domain variables.* 
* *Its activity label.* 
* *An identifier of the subject who carried out the experiment.*

*The dataset includes the following files:*

1. *'README.txt'*

2. *'features_info.txt': Shows information about the variables used on the feature vector.*

3. *'features.txt': List of all features.* (561 features)

4. *'activity_labels.txt': Links the class labels with their activity name.* (6 activities)

5. *'train/X_train.txt': Training set.* (7352 rows x 561 columns)

6. *'train/y_train.txt': Training labels.* (7352 rows x 1 column)

7. *'test/X_test.txt': Test set.* (2947 rows x 561 columns)

8. *'test/y_test.txt': Test labels.*  (2947 rows x 1 column)

*The following files are available for the train and test data. Their descriptions are equivalent.* 

1. *'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.* (7352 rows x 1 column; test/subject_test.txt has 2947 rows x 1 column)

2. *'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.* 

3. *'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.* 

4. *'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.* 

*Notes:* 

* *Features are normalized and bounded within [-1,1].*
* *Each feature vector is a row on the text file.*

## Description of the Generation of the Tidy Data Set: 'HARSmartphoneLongTidyData.txt'

To generate the tidy data set, we used the data in the following files 

1. 'features.txt': List of all features.

2. 'activity_labels.txt': Links the class labels with their activity name.

3. 'X_train.txt': Training set.

4. 'y_train.txt': Training labels.

5. 'X_test.txt': Test set.

6. 'y_test.txt': Test labels.

7. 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

8. 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

**ReadMe.md** gives a detailed step-by-step description of how the tidy data set 'HARSmartphoneLongTidyData.txt' was created from the above data files.

## Description of the Tidy Data Set:'HARSmartphoneLongTidyData.txt'

This data set does not have any NA values. It consists of 4 variables:

1. *subjectID*: This is an *integer* value in the range 1 to 30 indicating the id of the subject performing the activity.

2. *activity*: This is a *character* value (or factor) naming the activity performed by the subject. It is one of the following 6 activities: *laying*, *sitting*, *standing*, *walking*, *walking_downstairs*, and *walking_upstairs*.

3. *measure*: This is a *character* value (or factor) naming the metric measured. It is one of the following 79 values. A description of these metrics/measures can be obtained from *README.txt* and *features_info.txt* from the original data set.

   + tBodyAcc_mean_X
   + tBodyAcc_mean_Y
   + tBodyAcc_mean_Z
   + tBodyAcc_std_X
   + tBodyAcc_std_Y
   + tBodyAcc_std_Z
   + tGravityAcc_mean_X
   + tGravityAcc_mean_Y
   + tGravityAcc_mean_Z
   + tGravityAcc_std_X
   + tGravityAcc_std_Y
   + tGravityAcc_std_Z
   + tBodyAccJerk_mean_X
   + tBodyAccJerk_mean_Y
   + tBodyAccJerk_mean_Z
   + tBodyAccJerk_std_X
   + tBodyAccJerk_std_Y
   + tBodyAccJerk_std_Z
   + tBodyGyro_mean_X
   + tBodyGyro_mean_Y
   + tBodyGyro_mean_Z
   + tBodyGyro_std_X
   + tBodyGyro_std_Y
   + tBodyGyro_std_Z
   + tBodyGyroJerk_mean_X
   + tBodyGyroJerk_mean_Y
   + tBodyGyroJerk_mean_Z
   + tBodyGyroJerk_std_X
   + tBodyGyroJerk_std_Y
   + tBodyGyroJerk_std_Z
   + tBodyAccMag_mean
   + tBodyAccMag_std
   + tGravityAccMag_mean
   + tGravityAccMag_std
   + tBodyAccJerkMag_mean
   + tBodyAccJerkMag_std
   + tBodyGyroMag_mean
   + tBodyGyroMag_std
   + tBodyGyroJerkMag_mean
   + tBodyGyroJerkMag_std
   + fBodyAcc_mean_X
   + fBodyAcc_mean_Y
   + fBodyAcc_mean_Z
   + fBodyAcc_std_X
   + fBodyAcc_std_Y
   + fBodyAcc_std_Z
   + fBodyAcc_meanFreq_X
   + fBodyAcc_meanFreq_Y
   + fBodyAcc_meanFreq_Z
   + fBodyAccJerk_mean_X
   + fBodyAccJerk_mean_Y
   + fBodyAccJerk_mean_Z
   + fBodyAccJerk_std_X
   + fBodyAccJerk_std_Y
   + fBodyAccJerk_std_Z
   + fBodyAccJerk_meanFreq_X
   + fBodyAccJerk_meanFreq_Y
   + fBodyAccJerk_meanFreq_Z
   + fBodyGyro_mean_X
   + fBodyGyro_mean_Y
   + fBodyGyro_mean_Z
   + fBodyGyro_std_X
   + fBodyGyro_std_Y
   + fBodyGyro_std_Z
   + fBodyGyro_meanFreq_X
   + fBodyGyro_meanFreq_Y
   + fBodyGyro_meanFreq_Z
   + fBodyAccMag_mean
   + fBodyAccMag_std
   + fBodyAccMag_meanFreq
   + fBodyBodyAccJerkMag_mean
   + fBodyBodyAccJerkMag_std
   + fBodyBodyAccJerkMag_meanFreq
   + fBodyBodyGyroMag_mean
   + fBodyBodyGyroMag_std
   + fBodyBodyGyroMag_meanFreq
   + fBodyBodyGyroJerkMag_mean
   + fBodyBodyGyroJerkMag_std
   + fBodyBodyGyroJerkMag_meanFreq 
   
4. *meanValue*: This is a *numeric* value, recorded to 10 decimal places, in the range [-1,1]. It is the average of that measure/metric for each *subjectID*, *activity*.

The tidy data set 'HARSmartphoneLongTidyData.txt' has 30x6x79 = 14220 rows and 4 columns. Its size is 789KB.
