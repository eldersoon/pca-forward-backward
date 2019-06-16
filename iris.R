library("dplyr")
library('ggplot2')
iris <- read.csv('iris.csv')
library('data.table')
library(gridExtra)
library(grid)

iris$species <-as.factor(iris$species)
x <- iris$species
transform(iris,species=as.numeric(factor(iris$species)))
#irisDF <- iris %>% group_by(species) %>% summarize(Class_count = n())

cor(iris$Petal_Length, iris$Petal_Width)

#Transform to numeric
irisNM <- data.frame(species = c("NA", "setosa", "versicolor",
                                              "virginica"),stringsAsFactors=FALSE)


outlierReplace = function(dataframe, cols, rows, newValue = NA) {
  if (any(rows)) {
    set(dataframe, rows, cols, newValue)
  }
}

outlierReplace(newDataser, "sepal_width", which(iris$sepal_width < 2.1), NA)
outlierReplace(newDataser, "sepal_width", which(iris$sepal_width > 4), NA)


boxplot(iris$sepal_width, main="Box plot", ylab="Sepal width")


##criei a variável 'irisNew' e dela eu exclui
##todos os valores que estavam vazios(Na) na variavel'iris'
##logo o novo o dataset alterado  estará em 'irisNew'
irisNew <- na.exclude(iris)

#agora eu salvo o 'irisNew' no argumento e salvo como irisNew.csv
write.csv(data.frame(irisNew), file = "C:/Users/elder/OneDrive/Documentos/iris/irisNew.csv")









