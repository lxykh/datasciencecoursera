library(data.table)

# read test and train datasets
testSubjects     = read.table("test/subject_test.txt")
testLabels       = read.table("test/y_test.txt")
test             = read.table("test/X_test.txt")
test             = cbind(testSubjects, testLabels, test)

trainSubjects    = read.table("train/subject_train.txt")
trainLabels      = read.table("train/y_train.txt")
train            = read.table("train/X_train.txt")
train            = cbind(trainSubjects, trainLabels, train)

# merge
data             = rbind(test, train)

# load features and extract mean and std
features         = read.table("features.txt")
wanted           = grep("-(mean|std)\\(\\)", features[, 2])
data             = data[,c(1,2,wanted+2)]

# rename the columns
names(data)      = c("subject","activity",as.character(features[wanted,2]))

# load the activity labels and rename the rows accordingly
activityLabel    = read.table("activity_labels.txt")
data[,2]         = activityLabel[data[,2],2]

# calculating average of each variable for each activity and each subject
meltData         = melt(data,id.vars= c("subject","activity"))
newData          = dcast(meltData, subject+activity ~ variable, fun.aggregate=mean)

# create tidy data set
write.table(newData,"tidy_data.txt",row.names = FALSE)