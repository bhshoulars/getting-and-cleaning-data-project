#Function to change a given field name to a descriptive name.  Based on
#guidance from the discussion forums and other sources, I chose to follow
#these standards:
# 1.  No upper case letters.
# 2.  No abbreviations.
# 3.  No underscores, periods, or other punctuation marks.
#Some of the resulting names are a little long, but they do qualify as
#descriptive and conform to the guidelines given.
fixname <- function(fieldname)
{
  if (substr(fieldname,1,1) == "t") {fieldname<-sub("t","time",fieldname)}
  if (substr(fieldname,1,1) == "f") {fieldname<-sub("f","frequency",fieldname)}
  fieldname <-gsub("-X","x",fieldname)
  fieldname <-gsub("-Y","y",fieldname)
  fieldname <-gsub("-Z","z",fieldname)
  fieldname <-gsub("-std\\(\\)","standarddeviation",fieldname)
  fieldname <-gsub("-mean\\(\\)","mean",fieldname)
  fieldname <-gsub("Body","body",fieldname)
  fieldname <-gsub("Gravity","gravity",fieldname)
  fieldname <-gsub("Acc","acceleration",fieldname)
  fieldname <-gsub("Jerk","jerk",fieldname)
  fieldname <- gsub("Gyro","gyroscope",fieldname)
  fieldname <- gsub("Mag","magnitude",fieldname)
  fieldname
}

#Function to determine if a package is installed.
installed <- function(pkg) 
{
    is.element(pkg, installed.packages()[,1])
} 

#Checks to see if the required reshape2 and sqldf packages are installed.  If 
#they are not, then they will be installed.
if (!installed("reshape2")) {install.packages("reshape2")}
if (!installed("sqldf")) {install.packages("sqldf")}

#Load the reshape2 and sqdf libraries.
library(reshape2)
library(sqldf)

#Read the data files and store them in data frames.
features <- read.table(file = "./UCI HAR Dataset/features.txt", 
    stringsAsFactors = FALSE)
x_test <- read.table(file = "./UCI HAR Dataset/test/X_test.txt", 
    stringsAsFactors = FALSE)
y_test <- read.table(file = "./UCI HAR Dataset/test/y_test.txt", 
    stringsAsFactors = FALSE)
subject_test <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt", 
    stringsAsFactors = FALSE)
x_train <- read.table(file = "./UCI HAR Dataset/train/X_train.txt", 
    stringsAsFactors = FALSE)
y_train <- read.table(file = "./UCI HAR Dataset/train/y_train.txt", 
    stringsAsFactors = FALSE)
subject_train <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt", 
    stringsAsFactors = FALSE)
activity_labels <- read.table(file = "./UCI HAR Dataset/activity_labels.txt", 
    stringsAsFactors = FALSE)

#Bind the subject and activity columns to the x_test and x_train data frames.
testset <- cbind(subject_test, y_test, x_test)
trainset <- cbind(subject_train, y_train, x_train)

#Step 1:
#Combine both the test and train data frames together into one data frame.
allset <- rbind(testset, trainset)

#Create a vector containing the column names for the combined set of data.
#Set the column names in allset to the names in the vector.
featurenames <- c("subject", "activity", features[, 2])
names(allset) <- featurenames

#Step 2:
#Select columns from allset whose names include either "subject", 
#"activity", "-mean()", or "-std()".  Create a new dataframe that
#includes only those columns.
selectedcols <- grepl("subject|activity|-mean\\(\\)|std\\(\\)", featurenames)
reducedset <- allset[, selectedcols]

#Step 3:
#Change the activity ID numbers in reducedset to the corresponding
#activity names found in activity_labels.
reducedset[,2] <- sqldf("SELECT activity_labels.V2
              FROM reducedset
              INNER JOIN activity_labels
              ON reducedset.activity = activity_labels.V1")

#Step 4:
#Change the column names into a more descriptive form using the fixname
#function above.
names(reducedset) <- sapply(names(reducedset), fixname)

#Step 5:
#Creates a dataset (tidyset) that includes the average of each of the included
#variables for each activity and each subject.  The dataset is then saved to a
#text file.
meltset <- melt(reducedset,id=c("subject","activity"))
tidyset <- dcast(meltset, subject+activity ~ variable, mean)
write.table(tidyset, "tidyset.txt", row.names = FALSE)
