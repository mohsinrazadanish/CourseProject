# Course Project

Data can be downloaded from the given link in the assignment page, but it is also available in the Github repo CourseProject.

The R script (run_analysis.R) is provided to complete the requirements of the assignment.

* Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive. 
* My working directory is: "/Users/username/Desktop/Coursera/Getting and Cleaning Data/Week 3/CourseProject" (username: hidden here)

* Put run_analysis.R into the folder CourseProject

* In RStudio: Change the working directory to CourseProject

* The file requires plyr package, plz install if it's not already done. [install.packages("plyr")]

* Run the code

* (Optional: At the end, I also provided a command to write an xlsx file, if you would like to see, this requires xlsx package)

## Description

* Merges the training and the test sets to create one data set
        
        train/X_train.xt and test/X_test.txt
        
        train/subject_train.txt and test/subject_test.txt

* Extracts only the measurements on the mean and standard deviation for each measurement.
        I chose only the mean and std functions from the features_info.txt


* Uses descriptive activity names to name the activities in the data set
        I got the acitivity names from the activity_labels.txt and used them to incorporate in to data
        
        
* Appropriately labels the data set with descriptive variable names.
        I used gsub function repetitively to adjust the descriptive variable names, they are long but they looked good to me,
I used camelCase for naming the variables. I would try to get all lower case with words separated by dots, but I didn't get there. However, from some guidelines for naming variables in R, I found out the camelCase to be okay too.

To see, how the column names look like, check the code book, or the output file.

* From the data set in step 4, the scripts creates a second, independent tidy data set with the average of each variable for each activity and each subject. There were several options, I used plyr package's function ddply to call numcolwise to calculate means for each activity and each subject. I found this as one of the most efficient ways to compute it.
