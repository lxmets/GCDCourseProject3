---
title: "ReadMe"
author: "RN Uma"
date: "Thursday, May 21, 2015"
output: html_document
---

### Steps taken for Generating Tidy Data

1. Read in all the required data using `read.table()` because all the data are given as text files. The following handles are assigned to the data files - these handles will be used to refer to the appropriate dataset in the rest of this document:
   + `trainX <- read.table("X_train.txt")` (dimension: 7352 rows by 561 columns)
   + `trainY <- read.table("y_train.txt")` (dimension: 7352 rows by 1 column)
   + `trainS <- read.table("subject_train.txt")` (dimension: 7352 rows by 1 column)
   + `testX <- read.table("X_test.txt")` (dimension: 2947 rows by 561 columns)
   + `testY <- read.table("y_test.txt")` (dimension: 2947 rows by 1 column)
   + `testS <- read.table("subject_test.txt")` (dimension: 2947 rows by 1 column)
   + `features <- read.table("features.txt")` (dimension: 561 rows by 2 columns)
   + `activities <- read.table("activity_labels.txt")` (dimension: 6 rows by 2 columns)
   
2. Include the packages **dplyr**, **tidyr** and **reshape2**.

3. A decision was made to do the listed project steps in the order of **Step 4, Step 2, Step 1, Step 3 and Step 5**. This was deemed to be more meaningful and less time consuming computation wise. By renaming the column variables (Step 4) before merging (Step 1), the need to deal with multiple columns labelled as "V1" was avoided. Also, since only measurements that compute the mean and standard deviation were of interest, the width of the data set was trimmed by selecting only those relevant columns (Step 2) before merging the training and testing data sets (Step 1).  

4. **STEP 4 of the PROJECT:** In the data set
   + **trainS:** the column name *V1* was renamed as *subjectID*
   + **trainY:** the column name *V1* was renamed as *activity*
   + **trainX:** the 561 columns *V1* through *V561* were renamed with the list of 561 features given in **features**. Since these names were already meaningful, no additional renaming was required. But to follow the convention used for long variable names, only camel case and underscores were used in the variable names. To this end, the hyphens in the feature names were replaced with underscores and "()" were removed from the feature names.

5. **STEP 2 of the PROJECT:** For each measurement, only the mean and standard deviation were of interest. So all columns that had a "mean" or "std" in its name were selected - **there were 79 such measures**.

6. **STEP 1 of the PROJECT:** All the training and testing data sets were merged by:
   + binding the columns of **trainS**, **trainY** and **trainX**, in that order, to get a data set, called **train**, of 7352 rows and 1+1+79=81 columns.
   + binding the columns of **testS**, **testY** and **testX**, in that order, to get a data set, called **test**, of 2947 rows and 1+1+79=81 columns.
   + binding the rows of **train** and **test**, in that order, to get a data set, called **data**, of 7352 + 2947 = 10299 rows and 81 columns. The merged data set is **data**.

7. **STEP 3 of the PROJECT:** Using the activity labels given in **activities**, descriptive names were assigned to the activity numbers in the second column in **data**. 

8. **STEP 5 of the PROJECT:** The goal was to create a tidy data set from **data**. To do this, first the data set was sorted and grouped by *subjectID* and then by *activity*. There are 30 unique *subjectIDs* and 6 unique *activities* for a total of 180 unique combinations of *subjectID* and *activity*. For each unique combination of *subjectID* and *activity*, the mean of each of the 79 chosen features was computed. The resulting data set was named **wideTidyData**. The **wideTidyData** data set itself could be considered tidy based on the application. If each of the 79 features was considered as a variable, then the **wideTidyData** data set could be considered as tidy as discussed by David Hood (Community TA) in his [post](https://class.coursera.org/getdata-014/forum/thread?thread_id=31) and Hadley Wickham in his paper on [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf). However, if the 79 features were interpreted as values of a variable called *measure*, then the long and narrow data set needs to be computed so that there is only one observation per row to make the data set tidy. This is achieved by appropriately melting the **wideTidyData** data set to get **longTidyData** which contains only one variable per column and only one observation per row thereby satisfying the rules of tidy data. The melting process retains the column variables labelled *subjectID* and *activity* and introduces two column variables labelled 
   + *measure* whose value is one of the 79 measurement metrics and 
   + *meanValue* which gives the mean of the value of each metric averaged over all obsesrvations for each *subjectID*, *activity* combination. 

9. The **longTidyData** is what has been submitted as the tidy data set. Both data sets, **wideTidyData** and **longTidyData** were written using `write.table()` into files named 'HARSmartphoneWideTidyData.txt' and 'HARSmartphoneLongTidyData.txt', respectively.

10. The tidy data **longTidyData** can be viewed by running the following R script:

```{r}
address <- "https://s3.amazonaws.com/coursera-uploads/user-8c05489f784fe59d44979967/973501/asst-3/bff2c780022611e586b4d36b235f15cc.txt"
address <- sub("^https", "http", address)
tidyData <- read.table(url(address), header = TRUE)
View(tidyData)
```
