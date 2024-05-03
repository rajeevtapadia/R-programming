library(caret)

my_df<- read.csv("assignment 6\\breast cancer data.csv")
my_df$diagnosis <- factor (my_df$diagnosis, levels = c("B", "M"), labels = c(0, 1))

set.seed(123)

trainIndex <- createDataPartition(my_df$diagnosis, p= .7, 
                                  times = 1, 
                                  list = FALSE)

data_train <- my_df [ trainIndex,]
data_test <- my_df [-trainIndex,]

preproc_train <- preProcess(data_train[, -1], method = c("scale", "center"))
data_train_scaled <- predict(preproc_train, data_train[, -1])
data_test_scaled <- predict(preproc_train, data_test[, -1])

k<-5

model <- train (diagnosis ~ ., data = data_train_scaled,
                method = "knn", tuneGrid = data.frame(k = k))

predictions <- predict(model, data_test_scaled)

confusion_matrix <- confusionMatrix(predictions, data_test$diagnosis)
confusion_matrix

confusion_matrix$overall['Accuracy']
confusion_matrix$byClass['Sensitivity']
confusion_matrix$byClass['Specificity']
confusion_matrix$byClass['Precision']

