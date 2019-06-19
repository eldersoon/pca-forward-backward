#install Caret library
install.packages("caret")

#use library
library(caret)

### to do random forest and cross validation:
### use iris to FORWARD and bk_pca to BACKWARD AND PCA 

#load dataset
iris <- read.csv('iris.csv') #dataset to FORWARD
bk_pca <-read.csv('bk_pca.csv') #dataset to BACKWARD and PCA

#partition dataset to train an test
validation_index <- createDataPartition(iris$species, p=0.80, list=FALSE)

# 20% to test
validation <- iris[-validation_index,]

#new dataset 80%
iris <- iris[validation_index,]

#parameter
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

#apply to Random Forest
set.seed(7)
fit.rf <- train(species ~., data=iris,  method="rf", metric=metric, trControl=control)
print(fit.rf)
 
#prediction and aply to confusion matrix
predictions <- predict(fit.rf, validation)
confusionMatrix(predictions, validation$species)



 
 
 
 
 
 
 
 
 
 