
Source Data Description (as per the question):

One of the most exciting areas in all of data science right now is wearable computing - see for example this article.
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip




The code in this file does the below mentioned functionalities:

1)	Reading the "train" data

2)	Reading the "test" data

3)	Reading data description (for names of the variables)

4)	Reading activity labels

5)	Merges the training and the test sets to create one data set.
     
	-> Using rbind()

6)	Extracts only the measurements on the mean and standard deviation for each measurement.

7)	Uses descriptive activity names to name the activities in the data set.

8)	Appropriately labels the data set with descriptive variable names.

9)	From the data set in step 4, creates a second, independent tidy data set with the average of 
    
	each variable for each activity and each subject.

10)	Storing it into a separate file.



The data is averaged based on subject and activity group:
 
Subject column is numbered from 1 to 30.
 
Activity column has 6 types (taken from “activity_labels.txt”):
  
1.	WALKING
  
2.	WALKING_UPSTAIRS
  
3.	WALKING_DOWNSTAIRS
  
4.	SITTING
  
5.	STANDING
  
6.	LAYING

Column names are taken from the “features.txt” dataset.



Variables:

X_train, Y_train, X_test, Y_test, subject_train and subject_test, var_names, activity_labels contain the data from the downloaded files.

X_total, Y_total and subject_total are the merged datasets for further analysis.


