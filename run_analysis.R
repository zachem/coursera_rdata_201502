#unzip('getdata_projectfiles_UCI HAR Dataset.zip')
#old.dir <- getwd()
#setwd('UCI HAR Dataset')

features_names <- read.delim('features.txt',sep=" ",header=FALSE, col.names=c("id","name"), as.is=TRUE);
activities_names <- read.delim('activity_labels.txt',sep=" ",header=FALSE, col.names=c("id","name"), as.is=TRUE);

# only features with '-mean()' or '-std()'
mean_std_features <- features_names[which(grepl('-(mean|std)\\(\\)',features_names$name)),]

X_train_raw <- read.delim('train/X_train.txt', sep="", header=FALSE);
X_test_raw <- read.delim('test/X_test.txt', sep="", header=FALSE);

X_train <- X_train_raw[,c(mean_std_features$id)]
X_test <- X_test_raw[,c(mean_std_features$id)]

new_names <- gsub('-','_',gsub('[\\(\\)]','', mean_std_features$name))

colnames(X_train) <- new_names
colnames(X_test) <- new_names

Y_train_raw <- read.delim('train/y_train.txt', sep="", header=FALSE);
Y_test_raw <- read.delim('test/y_test.txt', sep="", header=FALSE);

X_train$label <- activities_names$name[Y_train_raw$V1]
X_test$label <- activities_names$name[Y_test_raw$V1]

#X_train$SRC <- "TRAIN"
#X_test$SRC <- "TEST"

train_sbj <- read.delim('train/subject_train.txt', sep="", header=FALSE)
test_sbj <- read.delim('test/subject_test.txt', sep="", header=FALSE)

X_train$subject = train_sbj$V1
X_test$subject = test_sbj$V1


merged <- rbind(X_train, X_test)

#install.packages("dplyr")
library(dplyr, quietly=TRUE, warn.conflicts=FALSE)

by_subj_act <- group_by(merged, subject, label)

result <- summarise_each(by_subj_act, funs(mean))
write.table(result, '', row.name=FALSE)
