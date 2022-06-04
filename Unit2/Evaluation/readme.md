install.packages("ggplot2")

library(ggplot2)

getwd()

setwd("C:/Users/udr97/Desktop/Unit_2")

getwd()

movies <- read.csv("Project-Data.csv")

movies <- movies [c(3,6,8,18)]




movies<-movies[
movies$Genre=="action"|
movies$Genre=="adventure"|
movies$Genre=="animation"|movies$Genre=="comedy"|
movies$Genre=="drama",]

movies<-movies[
movies$Studio=="Buena Vista Studios"|
movies$Studio=="Fox"| movies$Studio=="Paramount Pictures"|
movies$Studio=="Sony"|movies$Studio=="Universal" |
movies$Studio=="WB",]

colnames(movies) <- c("Genre", "Studio", "BudgetInMillions", "GrossInUS")



str(movies)

summary(movies)

BoxPlot <- ggplot(movies, aes(x=Genre, y=GrossInUS, color=Studio, size=BudgetInMillions))

BoxPlot + geom_boxplot()

BoxPlot + geom_jitter(shape=20) + geom_boxplot(size=0.5,alpha=0.8,color="Grey",
outlier.shape = NA)+ theme(plot.title = element_text(color="Green", size=16, face="bold", hjust = 0.5),
axis.title.x = element_text(color="Red", size=16), axis.title.y = element_text(color="Red", size=16))+  ggtitle("Total of all Domestic Gross % by Genre") + ylab("GrossInUS") + xlab("Genre")
