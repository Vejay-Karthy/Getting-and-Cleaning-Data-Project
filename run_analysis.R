# Steps to be performed to get the required tidy data:

# 1) Merges the training and the test sets to create one data set.

# 2) Extracts only the measurements on the mean and standard deviation for each measurement.

# 3) Uses descriptive activity names to name the activities in the data set

# 4) Appropriately labels the data set with descriptive variable names.

# 5) From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.



library(dplyr)

# Reading the "train" data:
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Reading the "test" data:
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Reading data description (for names of the variables):
var_names <- read.table("./UCI HAR Dataset/features.txt")

# Reading activity labels:
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Step: 1)

X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
subject_total <- rbind(subject_train, subject_test)

# Step: 2) 

selected_var <- var_names[grep("mean\\(\\)|std\\(\\)",var_names[,2]),]
X_total <- X_total[,selected_var[,1]]

# Step: 3) 

colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

# Step: 4) 

colnames(X_total) <- var_names[selected_var[,1],2]

# Step: 5) 

colnames(subject_total) <- "subject"
total <- cbind(X_total, activitylabel, subject_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_all(funs(mean))

# Finally,storing it into a separate file:

write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)


