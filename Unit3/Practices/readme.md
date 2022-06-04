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

Salary vs Experience de Test Set:
ggplot() + geom_point(aes(x=test_set$YearsExperience,
y=test_set$Salary), color = 'red') + geom_line(aes(x =
training_set$YearsExperience,
y = predict(regressor,newdata = training_set)),
color = 'black') + ggtitle('Salary vs Experience Test Set ') +

xlab('Years of experience') + ylab('Salary')