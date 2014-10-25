
Course Project for Coursera Cleaning Data course.
This CodeBook outlines the inputs and outputs to the script run_analysis.R
The script is designed to read in test and training data and summarize by test subject and activity

===============
Data was obtained from the site below and represents both test and training usage of smartphone activity data collection

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data itself was loaded from the link below and is dated 11/29/2012

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The folders labled "Intertial Signals" are not used for this exercise.

Study Design
============
Data was loaded from the zip file referenced above.

activity_labels.txt	## contains the numerical to char mapping of the different activity levels
			## for this exercise, these were read in manually via notepad and a character
			## string created within the R script
Files copied into the working directory to execute the script:
x_test.txt	
x_train.txt
y_test.txt
y_train.txt
subject_test.txt
subject_train.txt
features.txt

Files in the "Intertial Signals" folder were discarded (not used in the exercise)

Code Book
=========
x_test.txt	## raw numerical data from each test execution	
x_train.txt	## raw numerical data from each training execution
y_test.txt	## numerical list (mapped to activity_labels) representing the activity in each test execution
y_train.txt	## numerical list (mapped to activity_labels) representing the activity in each training execution
subject_test.txt## numerical ID of the subject for each test execution
subject_train.txt## numerical ID of the subject for each training execution
features.txt	## character labels for each of the data collected - these labels identify the types of data in the x_
		## data sets - for more details, refer to the Readme contained in the zip file downloaded as part of
		## the exercise

To successfully run the script, setup your R environment as follows:
Load libraries data.table, ddplyr, and plyr

Data Manipulation (see script for details)
==========================================
1) read in test and train x_ data and merge into a single table
2) use the features.txt to determine which columns contain either "mean()" or "std()" character strings and remove unwanted columns
3) read in test and train y_ data and add as a column to the raw data
4) read in test and train subject_ and add as column to the raw data
5) organize raw data by subject and test and average all other columns
6) replace the test ID with character strings from activity_labels and add the appropriate features.txt column names

Output
======
A data table containing one row for each combination of subject and test run (180 entries for 30 test subjects
each performing six different activities).

The columns of the raw test data were given character headers using the information in the features.txt file.

The training and test data sets were merged.

Two columns added for each execution to supply the subject and test IDs for that execution.

Results are included in the file project.txt in this repo

Assumptions
===========
Only data columns with variable names containing either "mean()" or "std()" will be used to summarize the data by subject and test


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.