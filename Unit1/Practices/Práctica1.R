# **Ley de los números grandes para N números Aleatorios 
Normalmente distribuidos con la  media = 0, stdev = 1:**
  Cree un script de R que cuente de cuántos de estos números se encuentran entre 
-1 y 1 y lo dividirá por la cantidad total de N
Sabes que: ** E (X) = 68,2% **
  Compruebe que Sean (Xn) -> E (X) mientras vuelve a ejecutar su script 
mientras aumenta N
# ** Sugerencias: **
1. Inicializar el tamaño de la muestra
2. Inicializar contador
3. bucle para(i en rnorm(tamaño))
4. Compruebe si la variable iterada cae
5. Aumentar el contador si la condición es verdadera
6. devolver un resultado <- contador / N
# **Código paso a paso**
## 1. Inicializar el tamaño de la muestra con 10
x <- rnorm(10)
y <- dnorm(x, mean = 0, sd = 1)
plot(x,y)
## 2. Inicializar contador y la variable del resultado
count <- 0
res <- 0
## 3. Ciclo for que recorre la muestra y aumenta el contador a la vez que 
imprime la cuenta
for(i in rnorm(10))
{
  count <- count + 1
  print(count)
  ## 4. Verifique si la variable iterada cae entre -1 and 1, si es así 
  entonces lo imprime
  if(i <= 1 && i >= -1){
    print(i)
    print("It's between -1 y 1")
    
    ## 5. Aumente el contador si la condición es verdadera, de lo contrario 
    imprime que el número está fuera del rango
    res <- res + 1
  }
  else
  {
    print(i)
    print("Out of range")
  }
}
## 6. Devuelve un resultado y lo divide entre el contador, al final imprime 
el resultado
Res <- res / count
print(Res)
# **Código completo**
x <- rnorm(10)
y <- dnorm(x, mean = 0, sd = 1)
plot(x,y)
count <- 0
res <- 0
for(i in rnorm(10))
{
  count <- count + 1
  print(count)
  if(i <= 1 && i >= -1){
    print(i)
    print("It's between -1 y 1")
    res <- res + 1
  }
  else
  {
    print(i)
    print("Out of range")
  }
}
Res <- res / count
print(Res)

