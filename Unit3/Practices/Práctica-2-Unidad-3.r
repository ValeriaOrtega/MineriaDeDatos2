install.packages("ggplot2")
install.packages("caTools")

library(caTools)
library(ggplot2)

dataset <- read.csv(file.choose())
dataset <- read.csv("50_Startups.csv")



dataset$State = factor(dataset$State, 
levels = c('New York', 'California', 'Florida'),    
labels = c(1,2,3))

dataset

library(caTools)
set.seed(123)

split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

regressor = lm(formula = Profit ~ .,data = training_set )

summary(regressor)

y_pred = predict(regressor, newdata = test_set)
y_pred

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, data = dataset)
summary(regressor)


regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,  data = dataset)
summary(regressor)

y_pred = predict(regressor, newdata = test_set)y_pred


backwardElimination <- function(x, sl) { 
numVars = length(x)  
for (i in c(1:numVars)){    
regressor = lm(formula = Profit ~ ., data = x)   
maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"]) 
if (maxVar > sl){      
j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar) 
x = x[, -j]    
}    
numVars = numVars - 1  
}  return(summary(regressor))
}
SL = 0.05

training_set
backwardElimination(training_set, SL)

