# Getting-and-Cleaning-Data
Getting and Cleaning Data - assignment week 4


0. Set folder UCI HAR Dataset to be working directory.

1. Fetch data about subjects (files "subject_test.txt" and "subject_train.txt") and activities (files "y_test.txt" and "y_train.txt") for each data set
Vector subject_test contains subjects data for test data set, and vector subject_train contains subjects data for train data set
Vector y_test contains activities data for test data set, and vector y_train contains activities data for train data set

2. Fetch variable names from file "features.txt" and store them in vector col_names 

3. Fetch test data set from file "X_test.txt" and append subject and activity columns to it. Name columns to able to separate only necessary ones later

4. Fetch train data set from file "X_train.txt" and append subject and activity columns to it. Name columns to able to separate only necessary ones later

5. Build one data set and store it in data frame data_set

6. Fetch only necessary columns (ones which contain words "mean" or "std") from data_set and store this subset in data_set_sub data frame

7. Rename values in activity column based on mapping in file "activity_labels.txt"

8. Build new data set with the average of each variable for each activity and each subject.

