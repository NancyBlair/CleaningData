Repo for the course project in the Coursera Getting and Cleaning Data class

This repo contains four files
============================

1. CodeBook.md - details about the input and output data for the exercise

2. run_analysis.R - a script to read in the data and output a tidy data set

3. project.txt - the output of the script, written to a text file using write.table

4. Readme.md - this file

Notes for executing the sciprt run_analysis()
============================================

Download and unzip data from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Files copied into the working directory to execute the script:

x_test.txt
	
x_train.txt

y_test.txt

y_train.txt

subject_test.txt

subject_train.txt

features.txt

Files in the "Intertial Signals" folder were discarded (not used in the exercise)

Load libraries data.table, ddplyr, and plyr

Output is a data table containing the tidy data