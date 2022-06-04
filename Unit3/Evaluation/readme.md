Se instalan las paqueterias que se va a utilizar para la práctica:

install.packages("ElemStatLearn")

install.packages("caTools")

install.packages("carnet")

install.packages("e1071")

- Se hace uso de las librerías ya instaladas:
library(caTools)

library(ElemStatLearn)

library(e1071)

library (carnet)

library(ggplot2)

- Cargamos nuestro archivo csv que vamos a utilizar, para hacer uso de sus
datos:

dataset <- read.csv(file.choose())

dataset = dataset[3:5]

- Codificamos la característica de destino como factor:

dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

- Dividimos los diferentes tipos de datos que tenemos:

set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

- Escala de las características:

training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
- Adaptación de la clasificación:
classifier = naiveBayes(formula =Purchased ~ ., data=training_set, type=
'c-classification', kernel='linear')

- Predicción de los resultados del conjunto de los datos:
naiveBayes

y_pred=predict(classifier, newdata = test_set[-3])
y_pred

- Matriz:.
cm = table(test_set[, 3],y_pred)
cm

- Gráfica donde se muestran los resultados:

set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Classifier (Test set)',xlab = 'Age', ylab =
'Estimated Salary',
xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add =
TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'coral1',
'blue'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit3/Unit3/Evaluation/grafica.png)
