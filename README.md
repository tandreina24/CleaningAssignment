# CleaningAssignment
This is the final Assignment for the course Data Cleaning Coursera.

This repertory has the following files:

* Tidy_data.txt: Which is the tidy data set.
* Code_Book: Which is a file that describes the variables on the Tidy_data.
* Run_analysis.R: Which is the R Code to perform the analysis and clean the data.


The steps to perform the analysis are the following:
1-Donwload the files using this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip,
  and save it on you working directory.


2-Open the run_analysis.r code into R-studio or R, this code perform the following steps

  2.1-Set the working directory and read the tables that has the labels.
  
  2.2-Read all train and test data.
  
  2.2-Join the x, y and subject files.
  
  2.3-Merged by rows the test and train files.
  
  2.4-Check the dimesion and head of the resulting files.
  
  2.5-labels the data set with descriptive variable names using the feature.txt file.
  
  2.6-Name the activities in the data set using the activity_labels.txt file.
  
  2.7-Create the Final_data3 files which has only the measurements on the mean and standard deviation for each measurement.
  
  2.8-Finally, the program export the Tidy_Data file on your working directory as txt format.


The code book could be use to check the variables included on the Tidy_data file.
