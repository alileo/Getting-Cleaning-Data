library(data.table)
library(dplyr)

#load the test dataset
setwd("~/Documents/COURSERA/Getting_and_cleaning_data/UCI HAR Dataset/test/")
X_test <- read.table("X_test.txt", header = FALSE)
y_test <- read.table("y_test.txt", header = FALSE)
subject_test <- read.table("subject_test.txt", header = FALSE)

#load the training dataset
setwd("~/Documents/COURSERA/Getting_and_cleaning_data/UCI HAR Dataset/train/")
X_train <- read.table("X_train.txt", header = FALSE)
y_train <- read.table("y_train.txt", header = FALSE)
subject_train <- read.table("subject_train.txt", header = FALSE)

setwd("~/Documents/COURSERA/Getting_and_cleaning_data/UCI HAR Dataset/")
features_names <- read.table("features.txt", header = FALSE)
activity_labels <- read.table("activity_labels.txt", header = FALSE)

#1# Merges the training and the test sets to create one data set.

subject <- rbind(subject_test,subject_train)
activity <- rbind(y_test,y_train) 
data <- rbind(X_test,X_train)

#Names columns
colnames(data) <- t(features_names[2])

colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

# merge all 
data_all <- cbind(data,activity,subject)

#2# Extracts only the measurements on the mean and standard deviation for each measurement.

data_all2 <- data_all[,grepl("mean|std|Subject|Activity", names(data_all))]

#3# Uses descriptive activity names to name the activities in the data set

data_all2 <- join(data_all2, activity_labels, by = "Activity", match = "first")
data_all2 <- data_all2[,-1]

#4# Appropriately labels the data set with descriptive variable names.

names(data_all2)

names(data_all2)<-gsub("Acc", "Accelerometer", names(data_all2))
names(data_all2)<-gsub("Gyro", "Gyroscope", names(data_all2))
names(data_all2)<-gsub("BodyBody", "Body", names(data_all2))
names(data_all2)<-gsub("Mag", "Magnitude", names(data_all2))
names(data_all2)<-gsub("^t", "Time", names(data_all2))
names(data_all2)<-gsub("^f", "Frequency", names(data_all2))
names(data_all2)<-gsub("tBody", "TimeBody", names(data_all2))
names(data_all2)<-gsub("-mean()", "Mean", names(data_all2), ignore.case = TRUE)
names(data_all2)<-gsub("-std()", "STD", names(data_all2), ignore.case = TRUE)
names(data_all2)<-gsub("-freq()", "Frequency", names(data_all2), ignore.case = TRUE)
names(data_all2)<-gsub("angle", "Angle", names(data_all2))
names(data_all2)<-gsub("gravity", "Gravity", names(data_all2))

#5# From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

new_dataset <- group_by(data_all2, Subject, Activity) 
new_dataset <-summarise_each(new_dataset,funs(mean))

### Save the new dataset
write.table(new_dataset, "~/Documents/COURSERA/Getting_and_cleaning_data/UCI HAR Dataset/new_dataset.txt", row.name=FALSE)

### Test  
test666 <- read.table("~/Documents/COURSERA/Getting_and_cleaning_data/UCI HAR Dataset/new_dataset.txt", header=TRUE)
head(test666)


