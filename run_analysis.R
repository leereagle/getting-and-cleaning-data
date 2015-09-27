library(plyr)


filename <- "getdata.dataset.zip"

# download the file if not exist

if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL,filename)
}

# unzip folder if not exist

if(!file.exists("UCI HAR Dataset")){
    unzip(filename)
}

# merge test and train dataset

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train,subject_test)

# prepare to extract mean and standard deviation

features <- read.table("UCI HAR Dataset/features.txt")

# get only mean or std columns

mean_and_std_features <- grep("-(mean|std)\\(\\)",features[,2])

x_data <- x_data[,mean_and_std_features,2]

names(x_data) <- features[mean_and_std_features,2]

# descriptive name for activity

activities <- read.table("UCI HAR Dataset/activity_labels.txt")

y_data[,1] <- activities[y_data[,1],2]

names(y_data) <- "activity"

# label the dataset

names(subject_data) <- "subject"

all_data <- cbind(x_data,y_data,subject_data)

# create second independent tidy dataset

averages_data <- ddply(all_data, .(subject,activity), function(x) colMeans(x[,1:66]))

write.table(averages_data, "averages_data.txt",row.name = FALSE)



