library(dplyr)

## Load Train DB

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(Subject_train) <- c("Subject_Id")

## Load Test DB

X_test  <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(Subject_test) <- c("Subject_Id")

## Load Activity and features

activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity) <- c("V1", "Activity")
features <- read.table("./UCI HAR Dataset/features.txt")

test1 <- features[grep("mean()", features$V2),]
test2 <- features[grep("std()", features$V2), ]
test <- rbind(test1, test2)
keep <- test[, c(1)]
keep <- sort(keep)
labels <- test[,c(2)]

## Create one data set

data  <- rbind(X_train, X_test)
dataT <- data[, c(keep)]

##Label the data set
colnames(dataT) <- labels       

##Contains Mean or Std

data1 <- select(dataT, contains("mean()"))
data2 <- select(dataT, contains("std()"))
data <- cbind(data1, data2)

##Label activity

Subject <- rbind(Subject_train, Subject_test)        
Y <- rbind(Y_train, Y_test)

data <- cbind(Subject, Y, data)

data <- merge(data, activity, by = "V1")
data <- data[, c(-1)]

##Create a tidydata from step 4

tidydata <- group_by (data, Subject_Id, Activity) %>% summarise_each(funs(mean))

colnames(tidydata) <- paste("mean (",names(tidydata), ")")
colnames(tidydata)[1:2] <- c("Subject_Id","Activity")

write.table(tidydata, file = "tidydata.txt", row.names = FALSE)

