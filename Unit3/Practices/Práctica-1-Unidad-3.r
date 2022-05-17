install.packages("ggplot2")
install.packages("caTools")

library(caTools)
library(ggplot2)

dataset <- read.csv(file.choose())
dataset <- read.csv("Salary_Data.csv")

library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

regressor = lm(formula = Salary ~ YearsExperience,               
data = dataset)
summary(regressor)

y_pred = predict(regressor, newdata = test_set)


ggplot() + geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary), 
color = 'red') +  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,newdata = training_set)),            
color = 'green') +  ggtitle('Salary vs Experience Training set ') +  xlab('Years of experience') +  ylab('Salary')

ggplot() +  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),  color = 'red') +  geom_line(aes(x = training_set$YearsExperience,
y = predict(regressor,newdata = training_set)), 
color = 'black') +  ggtitle('Salary vs Experience Test Set ') +  xlab('Years of experience') +  ylab('Salary')

