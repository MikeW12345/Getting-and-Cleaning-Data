
# Some actions conducted using plyr package - plyr required
# All merges performed in training / test sequence to maintain order of data

#STAGE 1 - extract required data and craate a single data set containing data on: subject, activity, plus 86 varables for mean or std dev.  

# merges training and test data producing single file of 10299 observations of 561 variables
merge1<-rbind(X_train, X_test)

#renaming all merge1 file columns with full names of features
featnames<-features[, c(2)]
colnames(merge1) <- featnames

#Creates subset of merge1 file containing only variables representing mean or std dev values - results in 10299 observations of 66 "features" variables
merge1subset <- merge1[c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)]

# merges subject training and subject test data producing single file of 10299 observations of 1 variable (subject) - order correspondong to merge1 file
# Then renames required merge2 column for manageability
merge2<-rbind(subject_train, subject_test)
colnames(merge2)[1] <- "Subject"

# merges subject training and subject test data producing single file of 10299 observations of 1 variable (activity)
merge3<-rbind(y_train, y_test)

# renaming required merge3 column for manageability
colnames(merge3)[1] <- "Activity"


# merges all three files - resulting in single tidy data set - 10299 rows of 68 variables - one observation per row - one variable per column
# all column names renamed as required
alldata<-cbind(merge2, merge3, merge1subset)


#STAGE 2 - use alldata data set created above to produce second, independent tidy data set with the average of each variable 
# for each activity and each subject.

melted <- melt(alldata, id=c("Subject","Activity"))
tidy1<-arrange(melted, Subject, Activity)
tidy2<-ddply(tidy1, c("Subject", "Activity", "variable"), summarise, mean = mean(value))

# Finally, alter names of activities - replaces numeric values for activities with 
# 1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING, 5= STANDING, 6=LAYING
# Not performed earlier to facilitate sorting
tidy2$Activity[tidy2$Activity == 1] <- "WALKING"
tidy2$Activity[tidy2$Activity == 2] <- "WALKING_UPSTAIRS"
tidy2$Activity[tidy2$Activity == 3] <- "WALKING_DOWNSTAIRS"
tidy2$Activity[tidy2$Activity == 4] <- "SITTING"
tidy2$Activity[tidy2$Activity == 5] <- "STANDING"
tidy2$Activity[tidy2$Activity == 6] <- "LAYING"

# Writes output to file: tidydata.txt
write.table(tidy2, file = "tidydata.txt", row.name=FALSE)
tidydata<-tidy2

cat("Process complete - output written to file: tidydata.txt")
cat("Output file tidydata also created in working environment for ease of examination")
