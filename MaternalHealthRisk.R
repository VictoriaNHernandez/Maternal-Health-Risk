library(caret)
library(pROC)

#load data set
Maternal_Risk <- read.csv(file="Maternal Health Risk Data Set.csv", stringsAsFactors = TRUE)

#convert RiskLevel to factor
Maternal_Risk$RiskLevel <- as.factor(Maternal_Risk$RiskLevel)

#exploratory data analysis
summary(Maternal_Risk)

#Partition using hold out method

#set random seed
set.seed(123)

#70/30 split 
trainIndex <- createDataPartition(Maternal_Risk$RiskLevel, p=.7, list=FALSE, times = 1)
Maternal_Risk_train <- Maternal_Risk[trainIndex,]
Maternal_Risk_test <- Maternal_Risk[-trainIndex,]

#Check the proportion of training and testing partitions
prop.table(table(Maternal_Risk_train$RiskLevel)) * 100
prop.table(table(Maternal_Risk_test$RiskLevel)) * 100

#summary stats for train and testing
summary(Maternal_Risk_train)
summary(Maternal_Risk_test)

#K-nearest
ctrl_none <- trainControl(method="none")
knnFit_none <- train(RiskLevel ~ ., data = Maternal_Risk_train, method = "knn", trControl = ctrl_none, preProcess = "scale")
knnFit_none

#Predict our test data
knnPredict_none <- predict(knnFit_none, newdata = Maternal_Risk_test)
knnPredict_none

#Confusion Matrix
confusionMatrix(knnPredict_none, Maternal_Risk_test$RiskLevel, mode="everything")

#Naive Bayes
ctrl <- trainControl(method="cv")
nbFit <- train(RiskLevel ~ ., data = Maternal_Risk_train, method = "nb", trControl = ctrl, preProcess="scale")
nbFit

#Predict our test data
nbPredict <- predict(nbFit, newdata = Maternal_Risk_test)
nbPredict

#Evaluate the RiskLevelifier
confusionMatrix(nbPredict, Maternal_Risk_test$RiskLevel, mode="everything")

varImp(nbFit,scale=FALSE)

#Desision Tree
ctrl <- trainControl(method="cv")
treeFit <- train(RiskLevel ~ ., data = Maternal_Risk_train, method = "rpart", trControl = ctrl)
treeFit
summary(treeFit$finalModel)

#Attribute importance of the tree.
varImp(treeFit,scale=FALSE)

#Plot 
plot(treeFit$finalModel, uniform=TRUE)
text(treeFit$finalModel, all=TRUE, cex=.8)

library(rpart.plot)
rpart.plot(treeFit$finalModel)

#Predict test data 
treePredict <- predict(treeFit, newdata = Maternal_Risk_test)
treePredict

#Confusion Matrix
confusionMatrix(treePredict, Maternal_Risk_test$RiskLevel, mode="everything")


