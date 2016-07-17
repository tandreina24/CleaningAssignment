####0-Asssign working folder
setwd("C:/Users/AndreinaDeJ/Desktop/Andreina i3/escritorio/cursos y cursera/data scientits specialization/cleaning/Week 4/final assigment/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset")

#read general info
Activity_labels <- read.table("./activity_labels.txt")
features <-read.table("./features.txt")
#Keep only label names
features_names <- as.character(features[,2])

        

###1-Merges the training and the test sets to create one data set.
#Read the train data
train_x <- read.table("./train/X_train.txt")
train_y <- read.table("./train/y_train.txt")
train_suject <- read.table("./train/subject_train.txt")
merged_train <- cbind(train_x,train_y,train_suject)

#Read the train data
test_x <- read.table("./test/X_test.txt") 
test_y <- read.table("./test/y_test.txt")
test_suject <- read.table("./test/subject_test.txt")
merged_test <- cbind(test_x,test_y,test_suject)

#Add rows to append files and create one dataset
Final_data <- rbind(merged_train,merged_test) #File dimension {102992,563}

#check the files created
head(train_x) #File dimension {7352,561}
head(train_y) #File dimension {7352,1}
head(train_suject)# File dimension {7352,1}
head(merged_train)#File dimension {17352,563}

head(test_x) #File dimension {2947,561}
head(test_y) #File dimension {2947,1}
head(test_suject) #File dimension {2947,1}
head(merged_test)#File dimension {2947,563}




### 4-Appropriately labels the data set with descriptive variable names.
colnames(Final_data) <- c(features_names,"y_Activities","subject")
head(Final_data)



### 3-Uses descriptive activity names to name the activities in the data set
Final_data$y_Activities <- factor(Final_data$y_Activities,labels=Activity_labels[,2])
summary(Final_data)



### 2-Extracts only the measurements on the mean and standard deviation for each measurement.
to_keep<-grep(".*mean.*|.*std.*",features[,2])
final_data2 <-Final_data[,to_keep]
final_data3 <-cbind(final_data2,Final_data$y_Activities,Final_data$subject)
colnames(final_data3)[80]<-"y_Activities"
colnames(final_data3)[81]<-"subject"
head(final_data3)


### 5-From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
library("data.table", lib.loc="~/R/win-library/3.2")
final_data4<-data.table(final_data3)
tidy_data <-final_data4[,lapply(.SD,mean),by=c("subject","y_Activities")]

#Export the final tidy table
write.table(tidy_data,"TidyData.txt",quote=FALSE)

