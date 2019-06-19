### to do neural network and cross validation:
### use iris to FORWARD and bk_pca to BACKWARD AND PCA 

iris <- read.csv('iris.csv') #dataset to FORWARD
bk_pca <-read.csv('bk_pca.csv') #dataset to BACKWARD and PCA

control <- trainControl(method="cv", number=10)
metric <- "Accuracy"


fit.nnet <- train(data=iris, species~.,
                 method = "nnet", 
                 tuneLength = 2,
                 trace = FALSE,
                 maxit = 100)


predictions <- predict(fit.nnet, validation)
confusionMatrix(predictions, validation$species)