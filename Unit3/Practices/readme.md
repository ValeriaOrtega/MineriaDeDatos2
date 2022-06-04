Practice 1

Instalamos nuestra paqueteria de ggplot y catools para poder generar las
graficaciones para nuestra práctica:

install.packages("ggplot2")
install.packages("caTools")
library(caTools)
library(ggplot2)

Creamos un dataset para que nos pueda buscar y leer nuestro archivo .CSV :
dataset <- read.csv(file.choose())
dataset <- read.csv('Salary_Data.csv')

Debemos de importar la librería caTools para que su función. Al igual debemos de
poner la semilla para poder crear los números. En cual debemos de asignar los
valores requeridos:
library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
Debemos de crear la variable regressor para que nos permita guardar los datos del
dataset con el cual el Salary y Years of Experience para que después nos deje
imprimir nuestro Summary:
regressor = lm(formula = Salary ~ YearsExperience,
data = dataset)
summary(regressor)

Variable de predicción de datos:
y_pred = predict(regressor, newdata = test_set)

Importación de nuestar libreria de ggplot para nuestra graficación de los datos de
Salary vs Experience de Training Set y de Test Set:
Salary vs Experience de Training Set:


ggplot() + geom_point(aes(x=test_set$YearsExperience,
y=test_set$Salary),
color = 'red') + geom_line(aes(x = training_set$YearsExperience,
y = predict(regressor,newdata = training_set)),
color = 'green') + ggtitle('Salary vs Experience Training set ')
+ xlab('Years of experience') + ylab('Salary')

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Practices/grafica%201.png)


Salary vs Experience de Test Set:
ggplot() + geom_point(aes(x=test_set$YearsExperience,
y=test_set$Salary), color = 'red') + geom_line(aes(x =
training_set$YearsExperience,
y = predict(regressor,newdata = training_set)),
color = 'black') + ggtitle('Salary vs Experience Test Set ') +

xlab('Years of experience') + ylab('Salary')

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Practices/grafica2.png)


Practice 2

install.packages("ggplot2")
install.packages("caTools")

library(caTools)
library(ggplot2)

dataset <- read.csv(file.choose())
dataset <- read.csv('50_Startups.csv')



dataset$State = factor(dataset$State, 
levels = c('New York', 'California', 'Florida'),    
labels = c(1,2,3))


library(caTools)
set.seed(123)

split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

regressor = lm(formula = Profit ~ .,               
data = training_set )
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
numVars = length(x)  for (i in c(1:numVars))
{    regressor = lm(formula = Profit ~ ., data = x)   
maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"]) 
if (maxVar > sl){      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar) 
x = x[, -j]    }    numVars = numVars - 1  }  return(summary(regressor))}
SL = 0.05

training_set
backwardElimination(training_set, SL)

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Practices/P2.png)


![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Practices/result%20P2.png)

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Practices/resultP2.png)




Practice 3

##Se agrega la ruta en donde se encuentra el archivo que es donde lo va a buscar:
getwd()
setwd("C:/Users/valer/Documents/9no Semestre/Minería de Datos/Unit3")
getwd()

##Abrimos nuestro archivo csv y nos lo va a importar:
dataset <- read.csv(file.choose())
dataset <- dataset[, 3:5]

##Se divide el conjunto de datos en el conjunto de entrenamiento y de prueba
##Se instala el paquete de datos de caTools:
  
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

##Escala de las características
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])

##Ajustes de la regresión logística al conjunto de entrenamiento:
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)

##Se predicen los resultados del conjunto de pruebas:
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred


cm = table(test_set[, 3], y_pred)
cm

 
library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

##Se muestra una visualización de los resultados obtenidos del conjunto de entrenamiento: 
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

##Se muestra una visualización de los resultados obtenidos del conjunto de pruebas: 
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Practices/grafica%201%20P3.png)


![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Practices/grafica%202%20P3.png)


![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Practices/grafica%203%20P3.png)



Practice 4

install.packages("ggplot2")
install.packages("caTools")
install.packages("ElemStatLearn")


library(caTools)
library(ggplot2)
library(ElemStatLearn)
 

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]


dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))



set.seed(123)

split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])


library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)


cm = table(test_set[, 3], y_pred)


library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Practices/grafica%201%20P4.png)

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Practices/grafica%202%20P4.png)