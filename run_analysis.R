#Download data
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url=fileURL, destfile="Dataset.zip")
unzip(zipfile="Dataset.zip")

#Step 1
features <- read.table(file='UCI HAR Dataset/features.txt', header=F, sep="", 
                       col.names=c('id','name'), stringsAsFactors=F)
features <- features$name
train_data <- read.table(file='UCI HAR Dataset/train/X_train.txt', header=F, 
                         sep="", col.names=features)
train_labels <- read.table('UCI HAR Dataset/train/y_train.txt', header=F, 
                           sep="", col.names="label")
train_id <- read.table('UCI HAR Dataset/train/subject_train.txt', header=F,
                       sep="", col.names="id")
train <- data.frame(test_train="test",
                    id=train_id$id,
                    labels=train_labels$label,
                    train_data)

test_data <- read.table(file='UCI HAR Dataset/test/X_test.txt', header=F, 
                        sep="", col.names=features)
test_labels <- read.table('UCI HAR Dataset/test/y_test.txt', header=F, 
                          sep="", col.names="label")
test_id <- read.table('UCI HAR Dataset/test/subject_test.txt', header=F,
                      sep="", col.names="id")
test <- data.frame(test_train="train",
                   id=test_id$id,
                   labels=test_labels$label,
                   test_data)

database <- rbind(train,test)

#Step 2
sel <- !unlist(lapply(lapply(strsplit(names(database),split = "\\."), function(d){
  if (d[2] %in% c("mean","std")) d
}),is.null))
sel[1:3] <- T
database <- database[,sel]

#Step 3
activity_labels <- read.table(file='UCI HAR Dataset/activity_labels.txt', header=F, 
                              sep="", col.names=c('act','lab'), stringsAsFactors=F)
database$labels <- factor(database$labels, levels=1:6, activity_labels$lab)

#Step 4
library(tidyr)
database_tidy <- gather(database, variable, value, -test_train, -id, -labels)
database_tidy <- separate(database_tidy, variable, c("variable","axis"), "\\.\\.")
database_tidy$axis <- substr(database_tidy$axis,2,2)
database_tidy <- separate(database_tidy, variable, c("variable","statistic"), "\\.")
database_tidy$domain <- substr(database_tidy$variable,1,1)
database_tidy$variable <- substring(database_tidy$variable,2)

#Step 5
library(dplyr)
data_final <- database_tidy %>% 
  group_by(id, labels, variable, domain, statistic, axis) %>%
  summarise(mean_value=mean(value))

write.csv(x=data_final, file="data_final.txt", quote=F, row.names=F)
