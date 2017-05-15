#load the libraries
library(plyr)
library(data.table)

#Set the working directory
setwd("C:/Users/ABashir/Documents/CourseEra/Courses/3-CleaningData/Week4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset");

#Read the Training data.
dtSubjectTrain <- read.table("./train/subject_train.txt", header = FALSE)
dtXTrain <- read.table("./train/X_train.txt", header=FALSE)
dtYTrain <- read.table("./train/y_train.txt", header=FALSE)

# Read the test data.
dtSubjectTest = read.table('./test/subject_test.txt',header=FALSE)
dtXTest = read.table('./test/x_test.txt',header=FALSE)
dtYTest = read.table('./test/y_test.txt',header=FALSE)

# Step 1:  Merge the training and the test sets to create one data set.
dtSubject <- rbind(dtSubjectTrain, dtSubjectTest)
dtX <- rbind(dtXTrain, dtXTest)
dtY <- rbind(dtYTrain, dtYTest)


#Step 2:  Extract only the measurements on the mean and standard deviation for each measurement.
dtFeatures <- read.table("features.txt")
filterMeanSTD <- grep("-(mean|std)\\(\\)", dtFeatures[, 2])
dtX_mean_std <- dtX[, filterMeanSTD]

names(dtX_mean_std) <- dtFeatures[filterMeanSTD,2]

View(dtX_mean_std)
dim(dtX_mean_std)


#Step 3: Uses descriptive activity names to name the activities in the data set
dtY[, 1] <- read.table("activity_labels.txt")[dtY[, 1], 2]
names(dtY) <- "Activity"
View(dtY)

#Step 4: Appropriately labels the data set with descriptive variable names.
names(dtSubject) <- "Subject"
summary(dtSubject)

#combine into one data set.
OneDataSet <- cbind(dtX_mean_std, dtY, dtSubject)

names(OneDataSet) <- make.names(names(OneDataSet))
names(OneDataSet) <- gsub('Acc',"Acceleration",names(OneDataSet))
names(OneDataSet) <- gsub('GyroJerk',"AngularAcceleration",names(OneDataSet))
names(OneDataSet) <- gsub('Gyro',"AngularSpeed",names(OneDataSet))
names(OneDataSet) <- gsub('Mag',"Magnitude",names(OneDataSet))
names(OneDataSet) <- gsub('^t',"TimeDomain.",names(OneDataSet))
names(OneDataSet) <- gsub('^f',"FrequencyDomain.",names(OneDataSet))
names(OneDataSet) <- gsub('\\.mean',".Mean",names(OneDataSet))
names(OneDataSet) <- gsub('\\.std',".StandardDeviation",names(OneDataSet))
names(OneDataSet) <- gsub('Freq\\.',"Frequency.",names(OneDataSet))
names(OneDataSet) <- gsub('Freq$',"Frequency",names(OneDataSet))


#Step 5: From the data set in step 4, creates a second, independent tidy data set with 
#        the average of each variable for each activity and each subject.
tidyData<-aggregate(. ~Subject + Activity, OneDataSet, mean)
tidyData<-tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "tidydata.txt",row.name=FALSE)

