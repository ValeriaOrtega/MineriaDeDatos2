##Instalaci�n de paquetes:
install.packages("cluster") 
library(cluster)

##Se carga el archivo de datos iris.csv:
getwd()
setwd('C:\Users\udr97\Desktop\Unit_2\iris-master') 
getwd()
dataset = read.csv(choose.files())
dataset = read.csv('iris.csv') 

##Aqu� hacemos referencia a que los datos se van a relacionar con las primeras 4 columnas: 
dataset = dataset[1:4]

##Aqu� decimos cuantos son los clusters que se van a utilizar, utilizando el metodo elbow
##se crea un vector que nos ayudara a guardar la suma de cuadrados de cada grupo de clusters
set.seed(6) 
wcss = vector()

##Con ayuda del ciclo for se le va a decir cuantas veces queremos que se guarde la informacion 
##y al  final obtendremos el numero de clusters que son 3, lo cual nos mostrara con una una curva en la grafica: 
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,wcss,type = 'b', main = paste('The elbow method'), xlab = 'Number of clusters', ylab = 'WCSS')

##Ahora debemos de ejecutar nuestro modelo k-mean en que est� instalado en el paquete 
##base de R-Studio, Ah� debemos de agregar nuestra semilla de nuestra aleatoriedad,  
##en la funci�n de nuestro kmeans, el cu�l es de gran necesidad tener  establecido 
##el centro el cual  es el n�mero de todos los grupos que queremos y se deben de agrupar:
  
##Debemos de aplicar  el m�todo del codo para que se pueda observar la implementaci�n 
##de los datos y  d�nde est� el punto de quiebre de la gr�fica obtenida:
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
