# Set working directory path
setwd("D:/Workspace/RStudio/DataScienceCourse3/UCI HAR Dataset/")

# Load dataset
X_train<-read.table("train/X_train.txt",header = FALSE)
subject_train<-read.table("train/subject_train.txt",header = FALSE)
Y_train<-read.table("train/Y_train.txt",header = FALSE)

X_test<-read.table("test/X_test.txt",header = FALSE)
subject_test<-read.table("test/subject_test.txt",header = FALSE)
Y_test<-read.table("test/Y_test.txt",header = FALSE)

activities<-read.table("activity_labels.txt",header = FALSE)
features<-read.table("features.txt",header = FALSE)

# TASK 1: Combine datasets
train_set <- cbind(X_train,c(subject_train,Y_train))
test_set <- cbind(X_test,c(subject_test,Y_test))
combined_set <- rbind(train_set,test_set)

# TASK 4: Use descriptive variable names for features
names(combined_set) <- c(as.character(features[[2]]),'subject','activity')

# TASK 3: Use descriptive activity names
combined_set['activity'] <- activities[combined_set[['activity']],'V2']

# TASK 2: Extract only mean() and std() features
combined_set <- combined_set[grep("std()|mean()|subject|activity",names(combined_set))]

# TASK 5: Variable average for each activity/subject
# As explained in the lecture, we do it using reshape2 melt function.
library(reshape2)
melted <- melt(combined_set,id=c("subject","activity"))
tidy_set<-dcast(melted, subject+activity ~ variable, mean)











