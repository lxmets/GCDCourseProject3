######################## SET THE WORKING DIRECTORY ##############################################################

#setwd("C:/Users/Sankar/Desktop/Coursera-R/Cleaning-Project")

######################## READ IN ALL THE DATA FILES #############################################################

trainX <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
#summary(trainX)
str(trainX)

trainY <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
#summary(trainY)
str(trainY)

trainS <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
#summary(trainS)
str(trainS)

testX <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
#summary(testX)
str(testX)

testY <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
#summary(testY)
str(testY)

testS <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
#summary(testS)
str(testS)

features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
features

activities <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
activities

#################### INCLUDE THE REQUIRED LIBRARIES ###########################################################

library(dplyr)
library(tidyr)
library(reshape2)

################# PROJECT STEP 4: LABEL THE DATA SETS WITH DESCRIPTIVE VARIABLE NAMES       ###################
################# RENAME THE COLUMN NAMES APPROPRIATELY AND REPLACE DASHES WITH UNDERSCORES ###################
################# AND DELETE "()" FROM THE VARIABLE NAMES                                   ###################

trainS <- rename(trainS,subjectID=V1)
trainY <- rename(trainY,activity=V1)
names(trainX) <- features[,2]
names(trainX) <- gsub("-", "_", names(trainX))
names(trainX) <- gsub("\\()", "", names(trainX))

testS <- rename(testS,subjectID=V1)
testY <- rename(testY,activity=V1)
names(testX) <- features[,2]
names(testX) <- gsub("-", "_", names(testX))
names(testX) <- gsub("\\()", "", names(testX))

#################### PROJECT STEP 2: EXTRACT ONLY THE MEASUREMENTS ON MEAN AND STANDARD DEVIATION ############################
#################### I decided to cut down my table width before merging                          ############################

trainX <- trainX[ , grepl( "mean|std" , names( trainX ) ) ]
testX <- testX[ , grepl( "mean|std" , names( testX ) ) ]

#################### PROJECT STEP 1: MERGE THE TRAINING AND TESTING DATA SETS #################################################

train <- bind_cols(trainS, trainY, trainX)
test <- bind_cols(testS, testY, testX)
data <- bind_rows(train, test)

##################### PROJECT STEP 3: LABEL THE ACTIVITIES IN THE DATA SET USING DESCRIPTIVE ACTIVITY NAMES ##################

for(i in 1:nrow(data)) {
        N <- data$activity[i]
        data$activity[i] <- as.character(activities[N,2])
}
#data$activity <- as.factor(data$activity)

##################### PROJECT STEP 5: Part ONE: COMPUTING THE AVERAGE OF EACH VARIABLE FOR EACH SUBJECT AND EACH ACTIVITY  ##################
##################### THIS STEP RESULTS IN A WIDE DATA                                                                     ##################
##################### PROJECT STEP 5: Part TWO: RESHAPING THE DATA SO THAT WE HAVE ONE OBSERVATION PER ROW                 ##################
##################### THIS STEP RESULTS IN A LONG NARROW DATA WITH ONE OBSERVATION PER ROW                                 ##################

tidyData <- data %>% arrange(subjectID,activity)%>% group_by(subjectID,activity)

wideTidyData <- tidyData %>% summarise_each(funs(mean))
write.table(wideTidyData,file="HARSmartphoneWideTidyData.txt",row.names=FALSE,col.names=TRUE)

longTidyData <- wideTidyData %>% melt(id=c("subjectID","activity"),measure.vars=names(tidyData[,3:81])) %>% arrange(subjectID,activity)
names(longTidyData) <- c("subjectID", "activity", "measure", "meanValue")
write.table(longTidyData,file="HARSmartphoneLongTidyData.txt",row.names=FALSE,col.names=TRUE)
