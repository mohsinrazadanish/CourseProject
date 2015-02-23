trainingData<-read.table("train/X_train.txt")
testData<-read.table("test/X_test.txt")
projectData<-rbind(trainingData,testData)

featuresList<-read.table("features.txt")

meanFeaturesIndex<-grep("mean\\(", featuresList[,2])
stdFeaturesIndex<-grep("std\\(", featuresList[,2])

meanAndStdFeaturesIndex<-c(meanFeaturesIndex,stdFeaturesIndex)
meanAndStdFeaturesIndex<-sort(meanAndStdFeaturesIndex)

meanAndStdFeaturesData<-projectData[,meanAndStdFeaturesIndex]

namesVector<-featuresList[meanAndStdFeaturesIndex,2]
names(meanAndStdFeaturesData)<-namesVector

activityLabels<-read.table("activity_labels.txt")
trainingActivities<-read.table("train/y_train.txt")
testActivities<-read.table("test/y_test.txt")

trainingSubjects<-read.table("train/subject_train.txt")
testSubjects<-read.table("test/subject_test.txt")

trainingAndTestActivities<-rbind(trainingActivities,testActivities)

trainingAndTestSubjects<-rbind(trainingSubjects,testSubjects)

trainingAndTestActivitiesDescription<-activityLabels[trainingAndTestActivities[,],2]
trainingAndTestActivitiesDescription<-data.frame(trainingAndTestActivitiesDescription)

activitiesAndSubjects<-data.frame(trainingAndTestActivitiesDescription[,1],trainingAndTestSubjects[,1])

aggregateData<-data.frame(meanAndStdFeaturesData, activitiesAndSubjects)

my_names<-names(aggregateData)

my_names<-gsub("[[:punct:]]","",my_names)
my_names<-gsub("BodyBody","Body",my_names)

my_names<-gsub("^t","timeDomainValuesOf",my_names)

my_names<-gsub("^f","frequencyDomainValuesOf",my_names)

my_names<-gsub("std","StandardDeviation",my_names)

my_names<-gsub("mean","Mean",my_names)

my_names<-gsub("X$","AlongXAxis",my_names)

my_names<-gsub("Y$","AlongYAxis",my_names)

my_names<-gsub("Z$","AlongZAxis",my_names)

my_names<-gsub("Acc","Acceleration",my_names)

my_names[67]<-"Activities"
my_names[68]<-"Subjects"

names(aggregateData)<-my_names

library(dplyr)
tidyData<-ddply(aggregateData, .(Activities, Subjects), numcolwise(mean, na.rm=TRUE))

write.table(tidyData, "tidy_data_set_with_the_averages.txt", row.names=FALSE)

# optionally, I also wrote an xlsx file, plz uncomment, if you are interested
# library(xlsx)
# write.xlsx(tidyData, "tidy_data_set_with_the_averages_3.xlsx", row.names=FALSE)
