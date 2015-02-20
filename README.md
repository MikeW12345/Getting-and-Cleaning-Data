# Getting-and-Cleaning-Data
### Items for getting and cleaning data project

### TIDYDATA file created via a two-stage process:
----------------------------------------------

### 1. Merging training and test data sets, along with corresponding subject ID's and activities performed to create a single data set:

	a. Merge x_train and x-test - produces a single file: 10299 rows of 561 columns (features variables)
	b. rename column names with values provided in features file
	c. select only columns relating to mean or std dev. values - produces interim single file: 10299 rows of 66 columns (features variables)
	d. Merge subject_train and subject_test data sets - produces interim single file: 10299 rows of 1 column (subject)
	e. Merge y_train and y_test data sets - produces interim single file: 10299 rows of 1 column (Activity)
	f. Combine all three interim data sets - produces interim single file: 10299 rows of 68 variables containing all required data for manipultation
	
** Note all merges in same order to ensure continued correspondence of subject, activity, and features data **

### 2. Use data set created in stage 1 to produce second, independent tidy data set with the average of each variable for each activity and each subject:
	a. melt data set, retaining subject and activity as id values (resulting in a file of 679734 rows of 4 columns)
	b. Rearrange the melted data set - order by activity group within subject (file remains 679734 rows of 4 columns)
	c. Summarise the rearranged data set creating average of each variable for each activity for each subject: 11880 rows of 4 columns



## TIDYDATA Variable Specifications:
----------------------------------

### Subject
	Identifies the subject who performed the activity:
	Range: 1-30


### Activity
	Activites performed by the subject:
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRs
	4 SITTING
	5 STANDING
	6 LAYING


### Variable
	Data collected for features relating to mean or std. dev.  
	Indicates the type of feature being measured, each being one of the following collection of 66 possible values:

	tBodyAcc-mean()-X
        tBodyAcc-mean()-Y
        tBodyAcc-mean()-Z 
        tBodyAcc-std()-X   
        tBodyAcc-std()-Y
	tBodyAcc-std()-Z

        tGravityAcc-mean()-X
        tGravityAcc-mean()-Y  
      	tGravityAcc-mean()-Z   
    	tGravityAcc-std()-X  
	tGravityAcc-std()-Y
       	tGravityAcc-std()-Z

	tBodyAccJerk-mean()-X
       	tBodyAccJerk-mean()-Y
	tBodyAccJerk-mean()-Z
	tBodyAccJerk-std()-X
        tBodyAccJerk-std()-Y
        tBodyAccJerk-std()-Z

        tBodyGyro-mean()-X 
       	tBodyGyro-mean()-Y
      	tBodyGyro-mean()-Z
	tBodyGyro-std()-X
	tBodyGyro-std()-Y
	tBodyGyro-std()-Z

	tBodyGyroJerk-mean()-X
   	tBodyGyroJerk-mean()-Y
   	tBodyGyroJerk-mean()-Z
      	tBodyGyroJerk-std()-X
     	tBodyGyroJerk-std()-Y
      	tBodyGyroJerk-std()-Z

      	tBodyAccMag-mean()
   	tBodyAccMag-std()
        tGravityAccMag-mean()
      	tGravityAccMag-std()

        tBodyAccJerkMag-mean()
	tBodyAccJerkMag-std()

     	tBodyGyroMag-mean()
        tBodyGyroMag-std()
	tBodyGyroJerkMag-mean()
   	tBodyGyroJerkMag-std()

 	fBodyAcc-mean()-X 
	fBodyAcc-mean()-Y 
        fBodyAcc-mean()-Z
        fBodyAcc-std()-X 
        fBodyAcc-std()-Y
       	fBodyAcc-std()-Z 

	fBodyAccJerk-mean()-X
      	fBodyAccJerk-mean()-Y 
      	fBodyAccJerk-mean()-Z 
      	fBodyAccJerk-std()-X   
    	fBodyAccJerk-std()-Y
        fBodyAccJerk-std()-Z

        fBodyGyro-mean()-X 
        fBodyGyro-mean()-Y 
        fBodyGyro-mean()-Z
     	fBodyGyro-std()-X  
        fBodyGyro-std()-Y 
        fBodyGyro-std()-Z 

        fBodyAccMag-mean() 
        fBodyAccMag-std()    
   
	fBodyBodyAccJerkMag-mean()
  	fBodyBodyAccJerkMag-std() 
  	fBodyBodyGyroMag-mean()  
   	fBodyBodyGyroMag-std()  
    	fBodyBodyGyroJerkMag-mean()
	fBodyBodyGyroJerkMag-std() 

### Mean
	Corresponding mean value of the variable being measured (of the group of 66)
	Range -1 to +1

------------------------------------------------------------------------------
