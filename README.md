
# data-cleaning - "run_analysis.R"
Course Era Data Cleaning - Assignment

This script file performs the following steps on Training and Test data to create a tidy data set. 
#Read the Training data.
# Read the test data.
# Step 1:  Merge the training and the test sets to create one data set for each.
#Step 2:  Extract only the measurements on the mean and standard deviation for each measurement.
#Step 3: Uses descriptive activity names to name the activities in the data set
#Step 4: Appropriately labels the data set with descriptive variable names.
#Step 5: From the data set in step 4, creates a second, independent tidy data set with 
        the average of each variable for each activity and each subject.
        
Variable :  Description
dtSubjectTrain: Data Table Subeject Training Data
dtXTrain: Data Table X Training Data
dtYTrain: Data Table Y Training Data

dtSubjectTest: Data Table Subect Test Data
dtXTest: Data Table X Test Data
dtYTest: Data Table Y Test Data

dtSubject: Data Table Subject Data (Combined Training & Test Data)
dtX: Data Table X Data (Combined Training & Test Data)
dtY: Data Table Y Data (Combined Training & Test Data)

dtFeatures: Data Table Features
filterMeanSTD: Filter Mean and Standard Deviation
dtX_mean_std: Data Table X Mean and Standard Deviation

OneDataSet: One Data Set for combined dtX_mean_std, dtY, and dtSubject

tidyData: The final product containging the tidy & cleaned data
