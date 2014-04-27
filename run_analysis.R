library(data.table)

activitylabel <- read.table("activity_labels.txt")
names(activitylabel)<- c("Activity","Activity Name")
features <- read.table("features.txt",stringsAsFactors=FALSE)

 subject_test <- read.table("./test/subject_test.txt")
 X_test <- read.table("./test/X_test.txt")
 y_test <- read.table("./test/y_test.txt")

 subject_train <- read.table("./train/subject_train.txt")
 X_train <- read.table("./train/X_train.txt")
 y_train <- read.table("./train/y_train.txt")


y_subject_test <- cbind(y_test,subject_test)
names(y_subject_test)<- c("Activity","Subject")

y_subject_train <- cbind(y_train,subject_train)
names(y_subject_train)<- c("Activity","Subject")

y_subject_new <- rbind(y_subject_train,y_subject_test)

newdataset<- rbind(X_train,X_test)

newnames<- data.frame(features$V2)
newnames<- as.vector(t(newnames))
names(newdataset) <- c(newnames)

newdata_mean <- newdataset[ , grepl( "mean" , names(newdataset))]
newdata_std <- newdataset[ , grepl( "std" , names(newdataset))]
newdata_mean_std <- cbind(newdata_mean,newdata_std)

xydata <- cbind(y_subject_new,newdata_mean_std)


dt <- data.table(xydata)
finaldata <- dt[, lapply(.SD,mean), by = "Activity,Subject"]

finalmerge <- merge(activitylabel,finaldata,by.x ="Activity",by.y="Activity")

write.table(finalmerge, file = "finalmerge.txt", sep = ",", col.names = colnames(finalmerge))
finaldata2 <- dt[, lapply(.SD,mean),]

write.table(finaldata2, file = "finaldata2.txt", sep = ",", col.names = colnames(finaldata))

