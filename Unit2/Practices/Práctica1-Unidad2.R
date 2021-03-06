#Abrir el CSV
videogames <- read.csv(file.choose())

#Datos del CSV
head(videogames)

#Librer�a
library(ggplot2)

#1. Gr�fica de dispersi�n de Puntos
ggplot(videogames,aes(x=VentasNA, y=VentasJP,color=Plataforma)) + geom_point()

#2. Gr�fica de facetas
x <- ggplot(videogames, aes(x=VentasNA, y=VentasGlobal,color=Plataforma))


x + geom_point()+ facet_grid(Plataforma~.)

#3. Gr�fica de Distribuci�n
a <- ggplot(videogames, aes(x=VentasNA))
b <- a + geom_histogram(binwidth = 10, aes(fill=Plataforma),color="Black")

b +xlab("VentasNA x Genero") + ylab("Number of VentasNA") + ggtitle("VentasNA by team Distribution") +
theme(axis.title.x = element_text(color = "Black", size=10),axis.title.y = element_text(color = "Black", size=10),)