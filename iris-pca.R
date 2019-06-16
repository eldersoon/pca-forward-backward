#install.packages("csvread")
#install.packages("ggplot2")
#install.packages("gridExtra")
#install.packages("grid")

library('csvread')
library('ggplot2') # visualização dos dados em gáficos
library('gridExtra')
library('grid')
library('dplyr')
library('cowplot')



iris <- read.csv('iris.csv')

p1 <- ggplot(iris, aes(x=sepal_length, y=sepal_width, color=species)) + geom_point()
p2 <- ggplot(iris, aes(x=petal_length, y=petal_width, color=species)) + geom_point()
p3 <- ggplot(iris, aes(x=sepal_length, y=petal_length, color=species)) + geom_point()
p4 <- ggplot(iris, aes(x=sepal_width, y=petal_width, color=species)) + geom_point()
plot_grid(p1, p2, p3, p4, labels = "AUTO")


iris %>% select(-species) %>% # remove Species column
  scale() %>%                 # scale to 0 mean and unit variance
  prcomp() ->                 # do PCA
  pca                         # store result as `pca`

# now display the results from the PCA analysis
pca


head(pca$x)

pca_data <- data.frame(pca$x, species=iris$species)
head(pca_data)

ggplot(pca_data, aes(x=PC1, y=PC2, color=species)) + geom_point()


pca$rotation

# capture the rotation matrix in a data frame
rotation_data <- data.frame(pca$rotation, variable=row.names(pca$rotation))
# define a pleasing arrow style
arrow_style <- arrow(length = unit(0.05, "inches"),
                     type = "closed")
# now plot, using geom_segment() for arrows and geom_text for labels
ggplot(rotation_data) + 
  geom_segment(aes(xend=PC1, yend=PC2), x=0, y=0, arrow=arrow_style) + 
  geom_text(aes(x=PC1, y=PC2, label=variable), hjust=0, size=3, color='red') + 
  xlim(-1.,1.25) + 
  ylim(-1.,1.) +
  coord_fixed() # fix aspect ratio to 1:1

percent <- 100*pca$sdev^2/sum(pca$sdev^2)
percent

perc_data <- data.frame(percent=percent, PC=1:length(percent))
ggplot(perc_data, aes(x=PC, y=percent)) + 
  geom_bar(stat="identity") + 
  geom_text(aes(label=round(percent, 2)), size=4, vjust=-.5) + 
  ylim(0, 80)

colors <- c("#999999", "#E69F00", "#56B4E9")
colors <- colors[as.numeric(pca_data$species)]

scatterplot3d(pca_data[,1:3], pch = 16, color=colors)

forward(iris, alpha = 0.2, full = FALSE, force.in)





