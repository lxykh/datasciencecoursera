#Original data 
Taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Pleasing read the corresponding CodeBook

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. "

#Analysis performed and results
Train and test data from the original dataset were merged and only mean and std of each features were extracted.
 
(see "features_info.txt" in the original dataset for more information about features)

Column and descriptive activity labels were changed accordingly.

(see "README.txt" and "activity_labels.txt" in the original dataset for more information about activity labels)

Finally, average of each feature were calculated for each activity and each subject.

The resulting dataset is "tidy_data.txt".

#Variables in tidy_data.txt

subject: subject number

activity: activity type

remaining columns: feature names

Every number in the dataset is the mean of a feature for one activity on one subject