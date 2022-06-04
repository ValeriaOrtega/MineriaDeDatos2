- Instalación de paquetes:


install.packages("cluster") 
library(cluster)

- Se carga el archivo de datos iris.csv:

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit4/Unit4/Evaluation/file%20document.png)


getwd()
dataset = read.csv(choose.files())
dataset = read.csv('iris.csv') 

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit4/Unit4/Evaluation/select%20document.png)

- Aquí hacemos referencia a que los datos se van a relacionar con las primeras 4 columnas: 


dataset = dataset[1:4]

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit4/Unit4/Evaluation/columnas.png)


- Aquí decimos cuantos son los clusters que se van a utilizar, utilizando el metodo elbow
se crea un vector que nos ayudara a guardar la suma de cuadrados de cada grupo de clusters


set.seed(6) 
wcss = vector()


- Con ayuda del ciclo for se le va a decir cuantas veces queremos que se guarde la informacion 
y al  final obtendremos el numero de clusters que son 3, lo cual nos mostrara con una una curva en la grafica: 


for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,wcss,type = 'b', main = paste('The elbow method'), xlab = 'Number of clusters', ylab = 'WCSS')

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit4/Unit4/Evaluation/grafica%201.png)

- Ahora debemos de ejecutar nuestro modelo k-mean en que está instalado en el paquete 
base de R-Studio, Ahí debemos de agregar nuestra semilla de nuestra aleatoriedad,  
en la función de nuestro kmeans, el cuál es de gran necesidad tener  establecido 
el centro el cual  es el número de todos los grupos que queremos y se deben de agrupar:
  
- Debemos de aplicar  el método del codo para que se pueda observar la implementación 
de los datos y  dónde está el punto de quiebre de la gráfica obtenida:


set.seed(29)
kmeans = kmeans(x = dataset, centers = 3) 
y_kmeans = kmeans$cluster

library(cluster)
clusplot(dataset,
y_kmeans,
lines = 0, 
shade = TRUE, 
color = TRUE, 
labels = 2, 
plotchar = FALSE, 
span = TRUE,
main = paste('Clasification of iris'), 
xlab = 'features',
ylab = 'Clusters')

![img](https://github.com/ValeriaOrtega/MineriaDeDatos2/blob/Unit4/Unit4/Evaluation/grafica%202.png)
