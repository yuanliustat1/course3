setwd('/Users/yuanliu/Desktop/Data Science Track/UCI HAR Dataset')
#1
#read test files
#read subject test file
subject_test=read.table('test/subject_test.txt',header=F)
#read feature measurement file
x_test=read.table('test/X_test.txt',header=F)

#read test label file
y_test=read.table('test/Y_test.txt',header=FALSE)
#combine into test dataset
test_data=cbind(subject_test,x_test,y_test)

#read train files
#read subject train file
subject_train=read.table('train/subject_train.txt',header=F)

#read feature measurement file
x_train=read.table('train/X_train.txt',header=F)

#read train labels file
y_train=read.table('train/Y_train.txt',header=F)

#combine into train dataset
train_data=cbind(subject_train,x_train,y_train)

#merge train and test sets to create one
data1=rbind(test_data,train_data)

#2
#read features labels file
features=read.table('features.txt',header=F,colClasses = c('numeric','character'))
#locate the feature labels with mean and std
indic=grep("mean()|std()",features[,2])
feature_data=rbind(x_test,x_train)
#subsetting
feature_data_clean=feature_data[,indic]
feature_name=features[indic,2]
names(feature_data)=feature_name

#4
#clean features labels to get rid of () and replace "-" with "."
feature_name_clean=sapply(feature_name,function(x){gsub("[()]","",x)})
feature_name_clean_2=sapply(feature_name_clean,function(x){gsub("-",".",x)})
names(feature_data_clean)=feature_name_clean_2

subject=rbind(subject_test,subject_train)
names(subject)='subject'

y_all=rbind(y_test,y_train)
names(y_all)='activity.number'
data2=cbind(subject,y_all,feature_data_clean)

#3
#read activity labels file
activity=read.table('activity_labels.txt',header=F,colClasses ='character')
names(activity)=c('activity.number','activity')
#left join the activity labels files to y file
library(dplyr)
data3=merge(data2,activity,by='activity.number',all.x=T,sort=F)
#delete the activity number column
data3=data3[,-c(1)]

#5
library(reshape2)
basedata <- melt(data3,(id.vars=c("subject","activity")))
data4 <- dcast(basedata, subject + activity~ variable, mean)
names(data4)[-c(1:2)]=paste("mean of" , names(data4)[-c(1:2)])
write.table(data4, "project_2.txt", sep = ",")

