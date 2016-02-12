# Human Activity Recognition Using Smartphones Data Set 

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#Description of the data

leading t or f is based on time or frequency measurements.
Body = related to body movement.
Gravity = acceleration of gravity
Acc = accelerometer measurement
Gyro = gyroscopic measurements
Jerk = sudden movement acceleration
Mag = magnitude of movement
mean and SD are calculated for each subject for each activity for each mean and SD measurements.
The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

## Files in folder ‘UCI HAR Dataset’ used

* test/subject_test.txt
* train/subject_train.txt
* test/X_test.txt
* train/X_train.txt
* test/y_test.txt
* train/y_train.txt
* features.txt : Names of column variables in the dataTable
* activity_labels.txt : Links the class labels with their activity name.

## script run_analysis.R 

1. All the relevant data are merged with the rbind() function. 
2. We extract only the measurements on the mean and standard deviation for each measurement by using the grepl() function.
3. We name the activities in the data set by using the activity_labels.txt
4. The data set are correctly labelled with descriptive variable names with the gsub() function.
5. From the data set in step 4, a second independent tidy data set with the average of each variable for each activity and each subject   is created thanks to groupby() and summarise_each() functions. The output file is called new_dataset.txt.

## Variables creates
* X_train, y_train, X_test, y_test, subject_train and subject_test are the downloaded files
* subject, activity and data are the merged datasets
* data_all merges data,activity and subject data
* data_all2 containes the appropriate variable names
* new_dataset contains the average of each variable for each activity and each subject


### Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws
