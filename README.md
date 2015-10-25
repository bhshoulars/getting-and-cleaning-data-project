#Course Project - Getting and Cleaning Data

This project was completed for the Getting and Cleaning Data course from the Data Science signature track on Coursera.  It uses data created through recordings of human activities made using smart phones.  A full description of the data collected can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The source data set can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

##Instructions
1.  The zip file listed in the URL above should be downloaded, and the UCI HAR Dataset folder should be extracted from it into a folder.
2.  The run_analysis.R script should be downloaded from this repository and placed into the same folder as the UCI HAR Dataset folder.
3.  The folder containing the script and the data set should be set as the working directory in R using the setwd() command if it is not already the working directory.'
4.  The script uses the reshape2 and sqldf packages for R.  Both will be installed automatically be the script when it is run if they are not already installed.
5.  The script should be run using the source command in R.  Type source('run_analysis.R') and press Enter.
6.  The output file, tidyset.txt, will be created in the working directory.  The file is created using the default separator, a single space.  Further information about the data in this file can be found in CodeBook.md found in this repository.
7.  If desired, the output file can be reloaded into R at a later time using read.table with the SEP parameter left at the default setting.